#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP Device Tree for Samsung Galaxy A14 (SM-A145P)
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a145p)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
