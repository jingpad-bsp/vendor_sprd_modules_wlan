#
# Copyright (C) 2008 The Android Open Source Project
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
ifeq ($(strip $(PRODUCT_WIFI_DEVICE)), sprd)
LOCAL_PATH := $(call my-dir)

WPA_SUPPL_DIR = external/wpa_supplicant_8

########################

#local_target_dir := $(TARGET_OUT)/etc/wifi
#local_target_dir := $(TARGET_OUT_VENDOR)/etc/wifi
#include $(CLEAR_VARS)
#LOCAL_MODULE := wpa_supplicant_overlay.conf
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_PATH := $(local_target_dir)
#LOCAL_SRC_FILES := wpa_supplicant_overlay.conf
#include $(BUILD_PREBUILT)

########################


########################
include $(CLEAR_VARS)

LOCAL_MODULE := wpa_supplicant.conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/wifi

include $(BUILD_SYSTEM)/base_rules.mk

WPA_SUPPLICANT_CONF_TEMPLATE := $(LOCAL_PATH)/wpa_supplicant_template.conf
ifeq ($(BOARD_WLAN_DEVICE),$(filter $(BOARD_WLAN_DEVICE),sc2332))
WPA_SUPPLICANT_CONF_TEMPLATE := $(LOCAL_PATH)/wpa_supplicant_template_marlin2.conf
else ifeq ($(BOARD_WLAN_DEVICE),$(filter $(BOARD_WLAN_DEVICE),sc2355))
WPA_SUPPLICANT_CONF_TEMPLATE := $(LOCAL_PATH)/wpa_supplicant_template_marlin2.conf
else ifeq ($(BOARD_WLAN_DEVICE),$(filter $(BOARD_WLAN_DEVICE),sp9832e))
WPA_SUPPLICANT_CONF_TEMPLATE := $(LOCAL_PATH)/wpa_supplicant_template_marlin2.conf
endif
WPA_SUPPLICANT_CONF_SCRIPT := $(WPA_SUPPL_DIR)/wpa_supplicant/wpa_supplicant_conf.sh
$(LOCAL_BUILT_MODULE): PRIVATE_WIFI_DRIVER_SOCKET_IFACE := $(WIFI_DRIVER_SOCKET_IFACE)
$(LOCAL_BUILT_MODULE): PRIVATE_WPA_SUPPLICANT_CONF_TEMPLATE := $(WPA_SUPPLICANT_CONF_TEMPLATE)
$(LOCAL_BUILT_MODULE): PRIVATE_WPA_SUPPLICANT_CONF_SCRIPT := $(WPA_SUPPLICANT_CONF_SCRIPT)
$(LOCAL_BUILT_MODULE) : $(WPA_SUPPLICANT_CONF_TEMPLATE) $(WPA_SUPPLICANT_CONF_SCRIPT)
	@echo Target wpa_supplicant.conf: $@
	@mkdir -p $(dir $@)
	$(hide) WIFI_DRIVER_SOCKET_IFACE="$(PRIVATE_WIFI_DRIVER_SOCKET_IFACE)" \
                bash $(PRIVATE_WPA_SUPPLICANT_CONF_SCRIPT) $(PRIVATE_WPA_SUPPLICANT_CONF_TEMPLATE) > $@

########################
endif
