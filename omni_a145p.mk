# Inherit from minimum TWRP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/a145p/BoardConfig.mk)

PRODUCT_DEVICE := a145p
PRODUCT_NAME := omni_a145p
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-A145P
PRODUCT_MANUFACTURER := samsung
