/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


// #define LOG_NDEBUG 0
#define LOG_TAG "lights"

#include <cutils/log.h>

#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>

#include <sys/ioctl.h>
#include <sys/types.h>

#include <hardware/lights.h>

/******************************************************************************/

static pthread_once_t g_init = PTHREAD_ONCE_INIT;
static pthread_mutex_t g_lock = PTHREAD_MUTEX_INITIALIZER;

enum lights {
    LED_GREEN=1, LED_AMBER
};

static int amberstate = 0;
static int amberblink = 0;
static int greenstate = 0;
static int greenblink = 0;


char const*const GREEN_LED_FILE
        = "/sys/class/leds/green/brightness";

char const*const AMBER_LED_FILE
        = "/sys/class/leds/amber/brightness";

char const*const GREEN_BLINK_FILE
        = "/sys/class/leds/green/blink";

char const*const AMBER_BLINK_FILE
        = "/sys/class/leds/amber/blink";

char const*const LCD_FILE
        = "/sys/class/leds/lcd-backlight/brightness";

char const*const BUTTON_FILE
        = "/sys/class/leds/button-backlight/brightness";
/**
 * device methods
 */

void init_globals(void)
{
    // init the mutex
    pthread_mutex_init(&g_lock, NULL);
}

static int
write_int(char const* path, int value)
{
    int fd;
    static int already_warned = 0;

    fd = open(path, O_RDWR);
    if (fd >= 0) {
        char buffer[20];
        int bytes = sprintf(buffer, "%d\n", value);
        int amt = write(fd, buffer, bytes);
        close(fd);
        return amt == -1 ? -errno : 0;
    } else {
        if (already_warned == 0) {
            LOGE("write_int failed to open %s\n", path);
            already_warned = 1;
        }
        return -errno;
    }
}

static int
is_lit(struct light_state_t const* state)
{
    return state->color & 0x00ffffff;
}

static int
rgb_to_brightness(struct light_state_t const* state)
{
    int color = state->color & 0x00ffffff;
    return ((77*((color>>16)&0x00ff))
            + (150*((color>>8)&0x00ff)) + (29*(color&0x00ff))) >> 8;
}

static int
set_light_backlight(struct light_device_t* dev,
        struct light_state_t const* state)
{
    int err = 0;
    int brightness = rgb_to_brightness(state);
    //LOGD("set_light_backlight brightness=%d\n", brightness);
    pthread_mutex_lock(&g_lock);
    err = write_int(LCD_FILE, brightness);
    pthread_mutex_unlock(&g_lock);
    return err;
}


static int
set_light_buttons(struct light_device_t* dev,
        struct light_state_t const* state)
{
    int err = 0;
    int on = is_lit(state);
    pthread_mutex_lock(&g_lock);
    err = write_int(BUTTON_FILE, on?255:0);
    pthread_mutex_unlock(&g_lock);
    return err;
}

static int
set_light_locked(enum lights light, unsigned int status, unsigned int blink)
{
    //LOGD("set_light_locked light=%d, state=%d\n", light, status);

    char const* ledFile;
    char const* blinkFile;

    switch (light) {
        case LED_AMBER:
            ledFile = AMBER_LED_FILE;
            blinkFile = AMBER_BLINK_FILE;
            break;

        case LED_GREEN:
        default:
            ledFile = GREEN_LED_FILE;
            blinkFile = GREEN_BLINK_FILE;
    }

    if (status) {
        // bugfix: if blink=1 before brightness is set light doesn't blink
        write_int(blinkFile, 0);
        write_int(ledFile, 1);
        if (blink) write_int(blinkFile, 1);
    } else {
        write_int(ledFile, 0);
    }

    return 0;
}

static int
set_light_battery(struct light_device_t* dev,
        struct light_state_t const* state)
{
    int red = (state->color >> 16) & 0xFF;
    int green = (state->color >> 8) & 0xFF;
    int status = (red && green);

    if (status == amberstate &&
            state->flashMode == amberblink) return 0;

    amberstate = status;
    amberblink = state->flashMode;

    pthread_mutex_lock(&g_lock);
    set_light_locked(LED_AMBER, status, state->flashMode);
    pthread_mutex_unlock(&g_lock);
    return 0;
}

static int
set_light_notification(struct light_device_t* dev,
        struct light_state_t const* state)
{
    int status = (state->color >> 8) & 0xFF;

    if (status == greenstate &&
            state->flashMode == greenblink) return 0;

    greenstate = status;
    greenblink = state->flashMode;

    pthread_mutex_lock(&g_lock);
    set_light_locked(LED_GREEN, status, state->flashMode);
    pthread_mutex_unlock(&g_lock);
    return 0;
}

static int
set_light_attention(struct light_device_t* dev,
        struct light_state_t const* state)
{
    // Legend doesn't have an attention light
    return 0;
}

/** Close the lights device */
static int
close_lights(struct light_device_t *dev)
{
    if (dev) {
        free(dev);
    }
    return 0;
}


/******************************************************************************/

/**
 * module methods
 */

/** Open a new instance of a lights device using name */
static int open_lights(const struct hw_module_t* module, char const* name,
        struct hw_device_t** device)
{
    int (*set_light)(struct light_device_t* dev,
            struct light_state_t const* state);

    if (0 == strcmp(LIGHT_ID_BACKLIGHT, name)) {
        set_light = set_light_backlight;
    }
    else if (0 == strcmp(LIGHT_ID_BUTTONS, name)) {
        set_light = set_light_buttons;
    }
    else if (0 == strcmp(LIGHT_ID_BATTERY, name)) {
        set_light = set_light_battery;
    }
    else if (0 == strcmp(LIGHT_ID_NOTIFICATIONS, name)) {
        set_light = set_light_notification;
    }
    else if (0 == strcmp(LIGHT_ID_ATTENTION, name)) {
        set_light = set_light_attention;
    }
    else {
        return -EINVAL;
    }

    pthread_once(&g_init, init_globals);

    struct light_device_t *dev = malloc(sizeof(struct light_device_t));
    memset(dev, 0, sizeof(*dev));

    dev->common.tag = HARDWARE_DEVICE_TAG;
    dev->common.version = 0;
    dev->common.module = (struct hw_module_t*)module;
    dev->common.close = (int (*)(struct hw_device_t*))close_lights;
    dev->set_light = set_light;

    *device = (struct hw_device_t*)dev;
    return 0;
}


static struct hw_module_methods_t lights_module_methods = {
    .open =  open_lights,
};

/*
 * The lights Module
 */
const struct hw_module_t HAL_MODULE_INFO_SYM = {
    .tag = HARDWARE_MODULE_TAG,
    .version_major = 1,
    .version_minor = 0,
    .id = LIGHTS_HARDWARE_MODULE_ID,
    .name = "QCT MSM7K lights Module",
    .author = "Google, Inc.",
    .methods = &lights_module_methods,
};
