#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
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

DEVICE=supersonic

mkdir -p ../../../vendor/htc/$DEVICE/proprietary

# This needs to be removed once .32 kernel is ported.
adb pull /system/lib/hw/gralloc.qsd8k.so ../../../vendor/htc/$DEVICE/proprietary

adb pull /system/bin/PPST ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/akmd ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/aparse ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/awb_camera ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/bma150_usr ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/bootcomplete ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/btld ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/cam_ins_spmo ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/debug_tool ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/dmagent ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/fbtool ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/htclogkernel ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/ser2net ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/setmic ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/snd ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/snd8k ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/sound8k ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/spkamp ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/bin/wifitools ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/AdieHWCodecSetting.csv ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/AudioBTID.csv ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/TPA2018.csv ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/WPDB.zip ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/agps_rm ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/voVidDec.dat ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/vo_omx_core.cfg ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/vomeOne.cfg ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/Supersonic_20100204_Sprint_Jack_324016_v2.acdb ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/BCM4329B1_002.002.023.0360.0361.hcd ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/default.acdb ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/fw_bcm4329.bin ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/yamato_pfp.fw ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/yamato_pm4.fw ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/pvasflocal.cfg ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/egl/libEGL_adreno200.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/egl/libGLESv1_CM_adreno200.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/egl/libGLESv2_adreno200.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libOlaBase.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libOmxAacEnc.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libOmxCore.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libOmxQcelp13Enc.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libOmxVdec.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libOmxVidEnc.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libcamera.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libgps.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libgsl.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libhtc_acoustic.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libhtc_ril.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libmm-omxcore.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/liboemcamera.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libomx_vo_omx_core.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libomx_wmadec_sharedlibrary.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libomx_wmvdec_sharedlibrary.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libpvasfcommon.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libpvasflocalpb.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libpvasflocalpbreg.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libspeech.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/voEVRCDec.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/voEVRCEnc.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/voOMXOne.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/voQCELPDec.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/voQCELPEnc.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/voVidDec.so ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/lib/libon2.so ../../../vendor/htc/$DEVICE/proprietary

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/htc/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

# This file is generated by device/htc/__DEVICE__/extract-files.sh

# This needs to be removed once .32 kernel is ported.
PRODUCT_COPY_FILES := \\
    vendor/htc/__DEVICE__/proprietary/gralloc.qsd8k.so:/system/lib/hw/gralloc.qsd8k.so

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/libgps.so:obj/lib/libgps.so \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:obj/lib/libcamera.so

# All the blobs necessary for passion
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/akmd:/system/bin/akmd \\
    vendor/htc/__DEVICE__/proprietary/snd:/system/bin/snd \\
    vendor/htc/__DEVICE__/proprietary/snd8k:/system/bin/snd8k \\
    vendor/htc/__DEVICE__/proprietary/sound8k:/system/bin/sound8k \\
    vendor/htc/__DEVICE__/proprietary/spkamp:/system/bin/spkamp \\
    vendor/htc/__DEVICE__/proprietary/wifitools:/system/bin/wifitools \\
    vendor/htc/__DEVICE__/proprietary/AdieHWCodecSetting.csv:/system/etc/AdieHWCodecSetting.csv \\
    vendor/htc/__DEVICE__/proprietary/AudioBTID.csv:/system/etc/AudioBTID.csv \\
    vendor/htc/__DEVICE__/proprietary/TPA2018.csv:/system/etc/TPA2018.csv \\
    vendor/htc/__DEVICE__/proprietary/WPDB.zip:/system/etc/WPDB.zip \\
    vendor/htc/__DEVICE__/proprietary/agps_rm:/system/etc/agps_rm \\
    vendor/htc/__DEVICE__/proprietary/BCM4329B1_002.002.023.0360.0361.hcd:/system/etc/firmware/BCM4329B1_002.002.023.0360.0361.hcd \\
    vendor/htc/__DEVICE__/proprietary/Supersonic_20100204_Sprint_Jack_324016_v2.acdb:/system/etc/firmware/Supersonic_20100204_Sprint_Jack_324016_v2.acdb \\
    vendor/htc/__DEVICE__/proprietary/default.acdb:/system/etc/firmware/default.acdb \\
    vendor/htc/__DEVICE__/proprietary/fw_bcm4329.bin:/system/etc/firmware/fw_bcm4329.bin \\
    vendor/htc/__DEVICE__/proprietary/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \\
    vendor/htc/__DEVICE__/proprietary/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw \\
    vendor/htc/__DEVICE__/proprietary/pvasflocal.cfg:/system/etc/pvasflocal.cfg \\
    vendor/htc/__DEVICE__/proprietary/voVidDec.dat:/system/etc/voVidDec.dat \\
    vendor/htc/__DEVICE__/proprietary/vo_omx_core.cfg:/system/etc/vo_omx_core.cfg \\
    vendor/htc/__DEVICE__/proprietary/vomeOne.cfg:/system/etc/vomeOne.cfg \\
    vendor/htc/__DEVICE__/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libOlaBase.so:/system/lib/libOlaBase.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxAacEnc.so:/system/lib/libOmxAacEnc.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxCore.so:/system/lib/libOmxCore.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxQcelp13Enc.so:/system/lib/libOmxQcelp13Enc.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxVdec.so:/system/lib/libOmxVdec.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxVidEnc.so:/system/lib/libOmxVidEnc.so \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:/system/lib/libcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libgps.so:/system/lib/libgps.so \\
    vendor/htc/__DEVICE__/proprietary/libgsl.so:/system/lib/libgsl.so \\
    vendor/htc/__DEVICE__/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \\
    vendor/htc/__DEVICE__/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \\
    vendor/htc/__DEVICE__/proprietary/libmm-omxcore.so:/system/lib/libmm-omxcore.so \\
    vendor/htc/__DEVICE__/proprietary/liboemcamera.so:/system/lib/liboemcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libomx_vo_omx_core.so:/system/lib/libomx_vo_omx_core.so \\
    vendor/htc/__DEVICE__/proprietary/libomx_wmadec_sharedlibrary.so:/system/lib/libomx_wmadec_sharedlibrary.so \\
    vendor/htc/__DEVICE__/proprietary/libomx_wmvdec_sharedlibrary.so:/system/lib/libomx_wmvdec_sharedlibrary.so \\
    vendor/htc/__DEVICE__/proprietary/libon2.so:/system/lib/libon2.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasfcommon.so:/system/lib/libpvasfcommon.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasflocalpb.so:/system/lib/libpvasflocalpb.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasflocalpbreg.so:/system/lib/libpvasflocalpbreg.so \\
    vendor/htc/__DEVICE__/proprietary/libspeech.so:/system/lib/libspeech.so \\
    vendor/htc/__DEVICE__/proprietary/voEVRCDec.so:/system/lib/voEVRCDec.so \\
    vendor/htc/__DEVICE__/proprietary/voEVRCEnc.so:/system/lib/voEVRCEnc.so \\
    vendor/htc/__DEVICE__/proprietary/voOMXOne.so:/system/lib/voOMXOne.so \\
    vendor/htc/__DEVICE__/proprietary/voQCELPDec.so:/system/lib/voQCELPDec.so \\
    vendor/htc/__DEVICE__/proprietary/voQCELPEnc.so:/system/lib/voQCELPEnc.so \\
    vendor/htc/__DEVICE__/proprietary/voVidDec.so:/system/lib/voVidDec.so 



EOF

./setup-makefiles.sh
