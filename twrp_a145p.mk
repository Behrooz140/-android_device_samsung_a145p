# Inherit from minimum TWRP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

# Product Specifications
PRODUCT_DEVICE := a145p
PRODUCT_NAME := twrp_a145p
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A145P
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := SM-A145P

# Platform Version for Android 15 / One UI 7 (API 35)
PLATFORM_SDK_VERSION := 35
PLATFORM_VERSION := 15
PLATFORM_VERSION_LAST_STABLE := 15
