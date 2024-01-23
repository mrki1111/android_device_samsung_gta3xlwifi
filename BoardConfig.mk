#
# Copyright (C) 2022 The LineageOS Project
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

DEVICE_PATH := device/samsung/gta3xlwifi
LOCAL_PATH := device/samsung/gta3xlwifi
BOARD_VENDOR := samsung

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_CPU_SMP := true
TARGET_USES_64_BIT_BINDER := true

#TARGET_2ND_ARCH := arm
#TARGET_2ND_ARCH_VARIANT := armv8-a
#TARGET_2ND_CPU_ABI := armeabi-v7a
#TARGET_2ND_CPU_ABI2 := armeabi
#TARGET_2ND_CPU_VARIANT := cortex-a53

# Bluetooth
BOARD_HAVE_BLUETOOTH_SLSI := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= false
    WITH_DEXPREOPT := true
  endif
endif

# Display
TARGET_SCREEN_DENSITY := 240
TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE := true
BOARD_MINIMUM_DISPLAY_BRIGHTNESS := 1

# Filesystem
#TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs

# Fingerprint
TARGET_SEC_FP_HAS_FINGERPRINT_GESTURES := true

# FM Radio
BOARD_HAVE_SLSI_FM := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/samsung/gta3xlwifi
TARGET_KERNEL_CONFIG := gta3xlwifi_defconfig

KERNEL_TOOLCHAIN_arm := /home/martin/lineage/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin


# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_SUPER_PARTITION_SIZE := 444596224
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := product system vendor odm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 4443865088

BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_CACHEIMAGE_PARTITION_SIZE := 104857600
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26324432896

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

BOARD_ODMTIMAGE_PARTITION_RESERVED_SIZE := 393216000
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 786432000
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 786432000
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 393216000

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_VENDOR := vendor

BOARD_USES_METADATA_PARTITION := true

BOARD_ROOT_EXTRA_FOLDERS := efs

# Platform
TARGET_BOARD_PLATFORM := universal7904
TARGET_SOC := exynos7904
TARGET_BOOTLOADER_BOARD_NAME := exynos7904
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

include hardware/samsung_slsi-linaro/config/BoardConfig7904.mk

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_RECOVERY_DEVICE_DIRS := $(DEVICE_PATH)
TARGET_RECOVERY_DENSITY := hdpi

# Releasetools
#TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
include device/samsung_slsi/sepolicy/sepolicy.mk


# System properties
TARGET_ODM_PROP += $(DEVICE_PATH)/properties/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/properties/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop


# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/vintf/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/framework_matrix.xml


# OTA assertions
TARGET_OTA_ASSERT_DEVICE := gta3xlwifi
TARGET_OTA_ASSERT_DEVICE := gta3xl

# Vendor
TARGET_COPY_OUT_VENDOR := vendor

# Vibrator
$(call soong_config_set,samsungVibratorVars,duration_amplitude,true)

# VNDK
BOARD_VNDK_VERSION := current

# Wifi
BOARD_WLAN_DEVICE                := slsi
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
include vendor/samsung/gta3xlwifi/BoardConfigVendor.mk
