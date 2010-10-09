#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/supersonic/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/supersonic/init.supersonic.rc:root/init.supersonic.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y

DEVICE_PACKAGE_OVERLAYS += device/htc/supersonic/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/supersonic/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni \
    sensors.supersonic \
    lights.supersonic

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/supersonic/supersonic-keypad.kl:system/usr/keylayout/supersonic-keypad.kl \
    device/htc/supersonic/supersonic-keypad.kcm.bin:system/usr/keychars/supersonic-keypad.kcm.bin \
    device/htc/supersonic/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/supersonic/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/supersonic/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/supersonic/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Supersonic uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/htc/supersonic/vold.fstab:system/etc/vold.fstab \
    device/htc/supersonic/apns-conf.xml:system/etc/apns-conf.xml

# Kernel modules
PRODUCT_COPY_FILES += \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/sunrpc/sunrpc.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/sunrpc/sunrpc.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/xfrm6_mode_transport.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/xfrm6_mode_transport.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/tunnel6.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/tunnel6.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/ah6.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/ah6.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/ipv6.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/ipv6.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/xfrm6_mode_tunnel.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/xfrm6_mode_tunnel.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/ip6_tunnel.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/ip6_tunnel.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/xfrm6_tunnel.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/xfrm6_tunnel.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/sit.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/sit.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/mip6.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/mip6.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/xfrm6_mode_beet.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/xfrm6_mode_beet.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/ipcomp6.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/ipcomp6.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/esp6.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/net/ipv6/esp6.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/fs/nfs_common/nfs_acl.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/fs/nfs_common/nfs_acl.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/fs/jbd2/jbd2.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/fs/jbd2/jbd2.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/fs/ext4/ext4.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/fs/ext4/ext4.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/fs/exportfs/exportfs.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/fs/exportfs/exportfs.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/fs/lockd/lockd.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/fs/lockd/lockd.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/fs/nfsd/nfsd.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/fs/nfsd/nfsd.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/fs/cifs/cifs.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/fs/cifs/cifs.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/fs/fuse/fuse.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/fs/fuse/fuse.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/fs/mbcache.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/fs/mbcache.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/fs/nfs/nfs.ko:system/lib/modules/2.6.34.5-cyanogenmod/kernel/fs/nfs/nfs.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/drivers/net/wireless/bcm4329/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/kernel/drivers/net/wimax/SQN/sequans_sdio.ko:system/lib/modules/sequans_sdio.ko \
    device/htc/supersonic/modules/2.6.34.5-cyanogenmod/modules.dep:system/lib/modules/2.6.34.5-cyanogenmod/modules.dep

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/supersonic/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/supersonic/media_a1026.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full.mk)


PRODUCT_NAME := generic_supersonic
PRODUCT_DEVICE := supersonic
