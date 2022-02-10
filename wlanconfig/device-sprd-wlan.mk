#
# Spreadtrum WLAN(Wi-Fi,SoftAP,P2P) configuration
#

# WLAN configuration
#$(call inherit-product-if-exists, vendor/sprd/modules/wlan/wlanconfig/device-sprd-wlan-property.mk)
$(call inherit-product-if-exists, vendor/sprd/modules/wlan/wlanconfig/device-sprd-wlan-service.mk)
$(call inherit-product-if-exists, vendor/sprd/modules/wlan/wlanconfig/device-sprd-wlan-ui.mk)


