DEVICE_PATH := device/samsung/a145p

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

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

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := a14p
TARGET_NO_BOOTLOADER := true

# Fix 64-bit app support
TARGET_SUPPORTS_64_BIT_APPS := true

# Prebuilt Kernel & DTB Configuration
TARGET_NO_KERNEL := false
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/dtbo.img

# Kernel Flags & Header Version
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTBO := true
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Fix Vendor/Symlink Conflict for TWRP Ramdisk
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := false
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := false

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 80740352
BOARD_HAS_NO_REAL_SDCARD := true

# Dynamic Partitions (Samsung A145P MT6769V)
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product

# Anti Rollback Patch
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_FASTBOOTD := true

# Display & Screen Fixes
TW_NO_SCREEN_TIMEOUT := true
TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := true

# Fix vendor symlink crash during rsync packaging
BOARD_BUILD_VENDOR_RAMDISK_IMAGE := false
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := false
TARGET_COPY_OUT_VENDOR := vendor
BOARD_RECOVERY_RAMDISK_USE_SYSTEM_AS_ROOT := true

# Recovery / File Systems
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Init RC Scripts for Recovery (Safe Copy)
define add-rc-file
$(if $(wildcard $(DEVICE_PATH)/$(1)),PRODUCT_COPY_FILES += $(DEVICE_PATH)/$(1):recovery/root/$(1))
endef

$(eval $(call add-rc-file,Android.hardware.health-service.example_recovery.rc))
$(eval $(call add-rc-file,dsms.rc))
$(eval $(call add-rc-file,libdsms.recovery.rc))
$(eval $(call add-rc-file,​mtk-plpath-utils.rc))
$(eval $(call add-rc-file,servicemanager.recovery.rc))
$(eval $(call add-rc-file,snapuserd.rc))


# USB / MTP / ADB Configuration
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun0/file

# TWRP USB IDs (Samsung / Standard Android)
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_CRYPTO := true
TW_USE_TOOLBOX := true

# ADB & MTP Enablement
GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND_ONLY

# USB Configfs Settings for Android 12
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true



