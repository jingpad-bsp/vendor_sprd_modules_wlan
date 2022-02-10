#
# Spreadtrum WLAN(Wi-Fi,SoftAP,P2P) configuration
#

#WLAN stuff
PRODUCT_PACKAGES += wpa_supplicant \
		    wpa_supplicant.conf \
		    wpa_supplicant_overlay.conf \
		    wificond \
		    wificond.rc \
		    liblowi_wifihal \
		    libwifi-hal \
		    libwifi-system \
		    android.hardware.wifi@1.0-service \
		    android.hardware.wifi.supplicant@1.0 \
		    hostapd \
		    autotestwifi

ifeq ($(strip $(BOARD_HAVE_SPRD_WCN_COMBO)), marlin)
WLAN_FEATURE_HOTSPOT20 := disabled
endif

ifneq ($(strip $(WLAN_FEATURE_HOTSPOT20)), disabled)
# Add HotSpot 2.0 client bin for debug image
PRODUCT_PACKAGES_DEBUG += hs20-osu-client
endif

#Add client bin for debug image
PRODUCT_PACKAGES_DEBUG += wpa_cli \
                          hostapd_cli

# for go version using lazy hal
ifeq ($(strip $(PRODUCT_GO_DEVICE)),true)
PRODUCT_PACKAGES +=  \
    android.hardware.wifi@1.0-service-lazy
endif
