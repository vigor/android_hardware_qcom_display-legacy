#Common headers
common_includes := $(call project-path-for,qcom-display)/libgralloc
common_includes += $(call project-path-for,qcom-display)/libgenlock
common_includes += $(call project-path-for,qcom-display)/liboverlay
common_includes += $(call project-path-for,qcom-display)/libcopybit
common_includes += $(call project-path-for,qcom-display)/libqdutils
common_includes += $(call project-path-for,qcom-display)/libhwcomposer

common_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

common_header_export_path := qcom/display

ifeq ($(TARGET_USES_POST_PROCESSING),true)
    common_flags     += -DUSES_POST_PROCESSING
    common_includes += $(TARGET_OUT_HEADERS)/pp/inc
endif


#Common libraries external to display HAL
common_libs := liblog libutils libcutils libhardware

#Common C flags
common_flags := -DDEBUG_CALC_FPS -Wno-missing-field-initializers

ifeq ($(ARCH_ARM_HAVE_NEON),true)
    common_flags += -D__ARM_HAVE_NEON
endif

ifeq ($(TARGET_NO_HW_VSYNC),true)
    common_flags += -DNO_HW_VSYNC
endif

ifeq ($(TARGET_USES_QCOM_BSP),true)
    common_flags += -DQCOM_BSP
endif

common_deps :=
kernel_includes :=

ifneq ($(TARGET_PREBUILT_HEADERS),true)
ifeq ($(call is-vendor-board-platform,QCOM),true)
     common_deps += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
     kernel_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
 endif
endif
