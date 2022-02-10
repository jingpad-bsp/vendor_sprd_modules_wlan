#
# Spreadtrum WLAN(Wi-Fi,SoftAP,P2P) configuration
#

ifeq ($(BOARD_HAVE_SPRD_WCN_COMBO),)
$(error PRODUCT MK should have BOARD_HAVE_SPRD_WCN_COMBO config)
endif

#Abandoned, will not be used after 8.1 vesion
#ro.void_charge_tip = true
#ro.vowifi.softap.ee_warning = false
#wifi inout icon, 8.1 and newest versions use original design.
#ro.wifi.signal.optimized = true

ifeq ($(strip $(BOARD_HAVE_SPRD_WCN_COMBO)), marlin)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.auto_roam = true \
    ro.wifi.sup_sprd.coexist_p2p = true \
    ro.softap.sup_sprd.whitelist = true \
    ro.softap.sup_sprd.coexist_bt = true\
    ro.softap.sup_sprd.hidessid = false \
    ro.softap.sup_sprd.maxstanum = 8 \
    ro.softap.sup_sprd.hide5gchannel = true
endif

ifeq ($(strip $(BOARD_HAVE_SPRD_WCN_COMBO)), marlin2)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.auto_roam = false \
    ro.wifi.sup_sprd.coexist_p2p = true \
    ro.softap.sup_sprd.whitelist = true \
    ro.softap.sup_sprd.coexist_bt = true\
    ro.softap.sup_sprd.hidessid = true \
    ro.softap.sup_sprd.maxstanum = 8 \
    ro.softap.sup_sprd.hide5gchannel = true
endif

ifeq ($(strip $(BOARD_HAVE_SPRD_WCN_COMBO)), sharkle)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.auto_roam = false \
    ro.wifi.sup_sprd.coexist_p2p = true \
    ro.softap.sup_sprd.whitelist = true \
    ro.softap.sup_sprd.coexist_bt = true\
    ro.softap.sup_sprd.hidessid = true \
    ro.softap.sup_sprd.maxstanum = 10 \
    ro.softap.sup_sprd.hide5gchannel = true
endif

ifeq ($(strip $(BOARD_HAVE_SPRD_WCN_COMBO)), sharklep)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.auto_roam = false \
    ro.wifi.sup_sprd.coexist_p2p = true \
    ro.softap.sup_sprd.whitelist = true \
    ro.softap.sup_sprd.coexist_bt = true\
    ro.softap.sup_sprd.hidessid = true \
    ro.softap.sup_sprd.maxstanum = 10 \
    ro.softap.sup_sprd.hide5gchannel = true
endif

ifeq ($(strip $(BOARD_HAVE_SPRD_WCN_COMBO)), rs2351)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.auto_roam = true \
    ro.wifi.sup_sprd.coexist_p2p = false \
    ro.softap.sup_sprd.whitelist = false \
    ro.softap.sup_sprd.coexist_bt = false\
    ro.softap.sup_sprd.hidessid = false \
    ro.softap.sup_sprd.maxstanum = 8 \
    ro.softap.sup_sprd.hide5gchannel = true
endif

ifeq ($(strip $(BOARD_HAVE_SPRD_WCN_COMBO)), sharkl3)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.auto_roam = false \
    ro.wifi.sup_sprd.coexist_p2p = true \
    ro.softap.sup_sprd.whitelist = true \
    ro.softap.sup_sprd.coexist_bt = true\
    ro.softap.sup_sprd.hidessid = true \
    ro.softap.sup_sprd.maxstanum = 10 \
    ro.softap.sup_sprd.hide5gchannel = true
endif

ifeq ($(strip $(BOARD_HAVE_SPRD_WCN_COMBO)), marlin3)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.auto_roam = false \
    ro.wifi.sup_sprd.coexist_p2p = true \
    ro.softap.sup_sprd.whitelist = true \
    ro.softap.sup_sprd.coexist_bt = true\
    ro.softap.sup_sprd.hidessid = true \
    ro.softap.sup_sprd.maxstanum = 10 \
    ro.softap.sup_sprd.hide5gchannel = true \
    ro.softap.sup_sprd.support5G = true
endif

ifeq ($(strip $(BOARD_HAVE_SPRD_WCN_COMBO)), marlin3_lite)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.auto_roam = false \
    ro.wifi.sup_sprd.coexist_p2p = true \
    ro.softap.sup_sprd.whitelist = true \
    ro.softap.sup_sprd.coexist_bt = true\
    ro.softap.sup_sprd.hidessid = true \
    ro.softap.sup_sprd.maxstanum = 10 \
    ro.softap.sup_sprd.hide5gchannel = true \
    ro.softap.sup_sprd.support5G = true
endif

ifeq ($(strip $(BOARD_HAVE_SPRD_WCN_COMBO)), pike2)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.auto_roam = false \
    ro.wifi.sup_sprd.coexist_p2p = true \
    ro.softap.sup_sprd.whitelist = true \
    ro.softap.sup_sprd.coexist_bt = true\
    ro.softap.sup_sprd.hidessid = true \
    ro.softap.sup_sprd.maxstanum = 10 \
    ro.softap.sup_sprd.hide5gchannel = true
endif

ifeq ($(strip $(VOFAFONE_MAXNUM_SOFTAP)), true)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.softap.sup_sprd.reqstanum=5
endif

# Not support wapi by default.
# The verisons supporting wapi should define PRODUCT_SUPPORT_WAPI true in their product mks.
ifeq ($(strip $(PRODUCT_SUPPORT_WAPI)), true)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.wapi = true
else
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd.wapi = false
endif

# Support wcn by default.
# No wcn versions product mks should define PRODUCT_SUPPORT_WCN false.
ifeq ($(strip $(PRODUCT_SUPPORT_WCN)), false)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wcn = disabled
else
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wcn = enabled
endif

#WLAN commom config
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wifi.sup_sprd = true \
    ro.wifi.sup_sprd.80211w = true \
    ro.wifi.sup_sprd.check_network = true \
    ro.wifi.sup_sprd.pocketmode = true \
    ro.wifi.sup_sprd.wlan_plus = false \
    ro.softap.sup_sprd = true \
    ro.softap.sup_sprd.coexist_lte = true
