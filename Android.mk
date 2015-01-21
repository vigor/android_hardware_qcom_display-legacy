ifeq ($(call my-dir),$(call project-path-for,qcom-display))

display-hals := libgralloc libgenlock libcopybit
display-hals += libhwcomposer liboverlay libqdutils

ifneq ($(TARGET_PROVIDES_LIBLIGHT),true)
display-hals += liblight
endif

ifneq ($(filter msm8660,$(TARGET_BOARD_PLATFORM)),)
    #This is for mako since it doesn't have the QCOM make functions
    include $(call all-named-subdir-makefiles,$(display-hals))
endif

endif
