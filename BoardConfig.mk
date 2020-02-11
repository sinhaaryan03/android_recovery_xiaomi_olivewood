#
# Copyright 2019 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

PLATFORM_PATH := device/xiaomi/olivelite


TARGET_NO_BOOTLOADER := true 
TARGET_BOOTLOADER_BOARD_NAME := sdm439
TARGET_BOARD_PLATFORM := sdm439

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 :=armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_USES_64_BIT_BINDER := false

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x4000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x4000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x100000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x550647000
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x18000000
BOARD_PERSISTIMAGE_PARTITION_SIZE := 0x2000000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Cmdline
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7824900.sdhci earlycon=msm_serial_dm,0x78B0000 firmware_class.path=/vendor/firmware_mnt/image 
BOARD_KERNEL_CMDLINE += androidboot.usbconfigfs=true loop.max_part=7

# Kernel
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/xiaomi/olivelite
TARGET_KERNEL_CONFIG := olivelite-perf_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch-linux-android-
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_PREBUILT_KERNEL := $(PLATFORM_PATH)/kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Fstab
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/recovery/root/etc/recovery.fstab

# QCOM Stuff
BOARD_USES_QCOM_HARDWARE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_BUILD_DISABLED_VBMETAIMAGE := false

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USES_MKE2FS := true

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true

# Platform
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_SDK_VERSION := 28

# TWRP Stuff
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_THEME := portrait_hdpi
TW_USE_TOOLBOX := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_INCLUDE_REPACKTOOLS := true
TW_SCREEN_BLANK_ON_BOOT := false
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_SCREEN_TIMEOUT  := true
TW_HAS_USB_STORAGE := true
TW_NO_USB_STORAGE := false
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_Y_OFFSET := 57
TW_H_OFFSET := -57
TW_NO_EXFAT := false
TW_NO_EXFAT_FUSE := false
TW_INCLUDE_NTFS_3G := true

# System-as-root

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SUPPRESS_SECURE_ERASE := true
# OTA

TARGET_OTA_ASSERT_DEVICE := olivelite

# Treble
BOARD_NEEDS_VENDORIMAGE_SYMLINK := false
TARGET_COPY_OUT_VENDOR := vendor