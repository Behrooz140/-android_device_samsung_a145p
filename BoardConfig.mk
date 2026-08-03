#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP Device Tree for Samsung Galaxy A14 (SM-A145P)
#

DEVICE_PATH := device/samsung/a145p

# Custom Bootimg Maker (Using root mkbootimg.mk for Samsung AVB Patch)
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# 64-bit Apps Support
TARGET_SUPPORTS_64_BIT_APPS := true

# Bootloader
BOARD_VENDOR := samsung
TARGET_SOC := mt6769
TARGET_BOOTLOADER_BOARD_NAME := a145p
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Display
TW_THEME := portrait_hdpi
TARGET_SCREEN_DENSITY := 450
TARGET_USES_VULKAN := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_DEFAULT_BRIGHTNESS := 255
TW_MAX_BRIGHTNESS := 1000

# Kernel Offset & Page Size Definition
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_DTB_OFFSET := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image

# Kernel Cmdline
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 loop.max_part=7 androidboot.selinux=permissive bootconfig buildtime_bootconfig=enable

# Complete Mkbootimg Arguments Injection
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)

# Kernel - Prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/dtb
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB) --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/dtbo.img
endif

# Partitions & Block Size
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 80740352
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 80740352
BOARD_HAS_LARGE_FILESYSTEM := true

# Dynamic / Super Partition Settings
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm system_ext system_dlkm vendor_dlkm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm

# File Systems Configuration (Samsung Default)
BOARD_SYSTEMIMAGE_PARTITION_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs

# System Root & Extra Folders (Essential for Samsung/Android 15)
BOARD_ROOT_EXTRA_FOLDERS := carrier data_mirror debug_ramdisk efs linkerconfig metadata odm_dlkm oem optics postinstall prism second_stage_resources spu system_ext vendor_dlkm system_dlkm
BOARD_SUPPRESS_SECURE_ERASE := true

# Platform
TARGET_BOARD_PLATFORM := mt6769

# Recovery Setup & Ramdisk for Android 15 / Samsung
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Verified Boot (Bypass Samsung Anti-Rollback & AVB Verification)
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_RECOVERY_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Security Patch & Platform Version Sync (Future-Proof Bypass)
PLATFORM_VERSION := 15
PLATFORM_VERSION_LAST_STABLE := 15
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31

# TWRP Configuration & Tools
TW_EXTRA_LANGUAGES := true
TW_USE_TOOLBOX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
ALWAYS_ALLOW_INSECURE_ADB := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false

# Samsung Specific Extras
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_USE_SAMSUNG_HAPTICS := true

# Init RC Scripts for Recovery
define add-rc-file
$(if $(wildcard $(DEVICE_PATH)/$(1)),PRODUCT_COPY_FILES += $(DEVICE_PATH)/$(1):recovery/root/$(1))
endef

$(eval $(call add-rc-file,Android.hardware.health-service.example_recovery.rc))
$(eval $(call add-rc-file,dsms.rc))
$(eval $(call add-rc-file,init.recovery.mt6768.rc))
$(eval $(call add-rc-file,init.recovery.samsung.rc))
$(eval $(call add-rc-file,libdsms.recovery.rc))
$(eval $(call add-rc-file,mtk-plpath-utils.rc))
$(eval $(call add-rc-file,servicemanager.recovery.rc))
$(eval $(call add-rc-file,snapuserd.rc))

# Fastbootd Configuration
TW_INCLUDE_FASTBOOTD := true

# Display & Timeout Rules (Prevent black screen freeze)
TW_NO_SCREEN_TIMEOUT := true
TW_NO_SCREEN_BLANK := true
