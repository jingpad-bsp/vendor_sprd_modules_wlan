#
# Spreadtrum WLAN(Wi-Fi,SoftAP,P2P) configuration
#

#wifi UI configs

ifneq ($(strip $(BOARD_SUPPORT_SPRD_WLAN)), disabled)
    PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:vendor/etc/permissions/android.hardware.wifi.xml
endif

ifneq ($(strip $(BOARD_SUPPORT_SPRD_WLAN_DIRECT)), disabled)
    PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:vendor/etc/permissions/android.hardware.wifi.direct.xml
endif

ifeq ($(strip $(BOARD_SUPPORT_SPRD_WLAN_AWARE)), enabled)
    PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:vendor/etc/permissions/android.hardware.wifi.aware.xml
endif

ifneq ($(strip $(BOARD_SUPPORT_SPRD_WLAN_PASSPOINT)), disabled)
    PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:vendor/etc/permissions/android.hardware.wifi.passpoint.xml
endif