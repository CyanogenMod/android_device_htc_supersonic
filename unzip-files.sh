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

unzip -j -o ../../../${DEVICE}_update.zip system/bin/akmd -d ../../../vendor/htc/$DEVICE/proprietary
chmod 755 ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/akmd
unzip -j -o ../../../${DEVICE}_update.zip system/bin/snd8k -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/sound8k -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/AdieHWCodecSetting.csv -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/AudioBTID.csv -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/TPA2018.csv -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/WPDB.zip -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/firmware/Supersonic_20100204_Sprint_Jack_324016_v2.acdb -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/firmware/default.acdb -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/firmware/yamato_pfp.fw -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/firmware/yamato_pm4.fw -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/egl/libEGL_adreno200.so -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/egl/libGLESv1_CM_adreno200.so -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/egl/libGLESv2_adreno200.so -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/egl/libq3dtools_adreno200.so -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/libOmxVdec.so -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/libcamera.so -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/libgsl.so -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/libhtc_acoustic.so -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/libhtc_ril.so -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/liboemcamera.so -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/wimaxDumpKmsg -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/apph -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/wimaxDumpLogcat -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/setWiMAXPropDaemond -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/wimax_mtd -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/sequansd -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/getWiMAXPropDaemond -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/wimaxDumpLastKmsg -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/wimaxDhcpRenew -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/wimaxDhcpRelease -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/wimaxAddRoute -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/wimax/sequansd/DefaultTree.xml -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/wimax/sequansd/sequansd_app.xml -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/etc/wimax/dhcp/wimaxDhcp.conf -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/ipd -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/ip -d ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/framework/wimax-api.jar -d ../../../vendor/htc/$DEVICE/proprietary

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

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:obj/lib/libcamera.so

# All the blobs necessary for passion
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/akmd:/system/bin/akmd \\
    vendor/htc/__DEVICE__/proprietary/snd8k:/system/bin/snd8k \\
    vendor/htc/__DEVICE__/proprietary/sound8k:/system/bin/sound8k \\
    vendor/htc/__DEVICE__/proprietary/AdieHWCodecSetting.csv:/system/etc/AdieHWCodecSetting.csv \\
    vendor/htc/__DEVICE__/proprietary/AudioBTID.csv:/system/etc/AudioBTID.csv \\
    vendor/htc/__DEVICE__/proprietary/TPA2018.csv:/system/etc/TPA2018.csv \\
    vendor/htc/__DEVICE__/proprietary/WPDB.zip:/system/etc/WPDB.zip \\
    vendor/htc/__DEVICE__/proprietary/Supersonic_20100204_Sprint_Jack_324016_v2.acdb:/system/etc/firmware/Supersonic_20100204_Sprint_Jack_324016_v2.acdb \\
    vendor/htc/__DEVICE__/proprietary/default.acdb:/system/etc/firmware/default.acdb \\
    vendor/htc/__DEVICE__/proprietary/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \\
    vendor/htc/__DEVICE__/proprietary/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw \\
    vendor/htc/__DEVICE__/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxVdec.so:/system/lib/libOmxVdec.so \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:/system/lib/libcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libgsl.so:/system/lib/libgsl.so \\
    vendor/htc/__DEVICE__/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \\
    vendor/htc/__DEVICE__/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \\
    vendor/htc/__DEVICE__/proprietary/liboemcamera.so:/system/lib/liboemcamera.so \\
    vendor/htc/__DEVICE__/proprietary/wimaxDumpKmsg:/system/bin/wimaxDumpKmsg \\
    vendor/htc/__DEVICE__/proprietary/apph:/system/bin/apph \\
    vendor/htc/__DEVICE__/proprietary/wimaxDumpLogcat:/system/bin/wimaxDumpLogcat \\
    vendor/htc/__DEVICE__/proprietary/setWiMAXPropDaemond:/system/bin/setWiMAXPropDaemond \\
    vendor/htc/__DEVICE__/proprietary/wimax_mtd:/system/bin/wimax_mtd \\
    vendor/htc/__DEVICE__/proprietary/sequansd:/system/bin/sequansd \\
    vendor/htc/__DEVICE__/proprietary/getWiMAXPropDaemond:/system/bin/getWiMAXPropDaemond \\
    vendor/htc/__DEVICE__/proprietary/wimaxDumpLastKmsg:/system/bin/wimaxDumpLastKmsg \\
    vendor/htc/__DEVICE__/proprietary/wimaxDhcpRenew:/system/bin/wimaxDhcpRenew \\
    vendor/htc/__DEVICE__/proprietary/wimaxDhcpRelease:/system/bin/wimaxDhcpRelease \\
    vendor/htc/__DEVICE__/proprietary/wimaxAddRoute:/system/bin/wimaxAddRoute \\
    vendor/htc/__DEVICE__/proprietary/DefaultTree.xml:/system/etc/wimax/sequansd/DefaultTree.xml \\
    vendor/htc/__DEVICE__/proprietary/wimaxDhcp.conf:/system/etc/wimax/dhcp/wimaxDhcp.conf \\
    vendor/htc/__DEVICE__/proprietary/ipd:/system/bin/ipd \\
    vendor/htc/__DEVICE__/proprietary/ip:/system/bin/ip \\
    vendor/htc/__DEVICE__/proprietary/sequansd_app.xml:/system/etc/wimax/sequansd/sequansd_app.xml \\
    vendor/htc/__DEVICE__/proprietary/wimax-api.jar:/system/framework/wimax-api.jar
EOF

./setup-makefiles.sh
