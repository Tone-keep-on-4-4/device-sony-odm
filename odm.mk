COMMON_ODM_PATH := device/sony/odm
COMMON_ODM_SUBPATH := $(COMMON_ODM_PATH)/odm

ifeq ($(PRODUCT_PREBUILT_ODM),true)

ODM_FILES := $(foreach p,$(shell find $(COMMON_ODM_SUBPATH) -type f),$(subst $(COMMON_ODM_SUBPATH)/,,$(p)))

ODM_ADRENO_LIB_EGL_FILES := $(foreach p,$(shell find $(COMMON_ODM_SUBPATH)/lib/egl/ -type f),$(subst $(COMMON_ODM_SUBPATH)/lib/,,$(p)))
ODM_ADRENO_LIB64_EGL_FILES := $(foreach p,$(shell find $(COMMON_ODM_SUBPATH)/lib64/egl/ -type f),$(subst $(COMMON_ODM_SUBPATH)/lib64/,,$(p)))
# HW is only vulkan.platform.so
#hw/vulkan.$(TARGET_BOARD_PLATFORM).so
#ODM_ADRENO_LIB_HW_FILES := $(foreach p,$(shell find $(COMMON_ODM_SUBPATH)/lib/hw/ -type f),$(subst $(COMMON_ODM_SUBPATH)/lib/,,$(p)))
#ODM_ADRENO_LIB64_HW_FILES := $(foreach p,$(shell find $(COMMON_ODM_SUBPATH)/lib64/hw/ -type f),$(subst $(COMMON_ODM_SUBPATH)/lib64/,,$(p)))

ODM_ADRENO_HW_VULKAN_LIBS := \
    hw/vulkan.$(TARGET_BOARD_PLATFORM).so

ODM_ADRENO_SINGLE_LIBS := \
    libC2D2.so \
    libCB.so \
    libOpenCL.so \
    libRSDriver_adreno.so \
    libadreno_utils.so \
    libc2d30_bltlib.so \
    libgsl.so \
    libllvm-glnext.so \
    libllvm-qcom.so \
    librs_adreno.so \
    librs_adreno_sha1.so \

PRODUCT_COPY_FILES += \
    $(foreach p,$(ODM_FILES),$(COMMON_ODM_SUBPATH)/$(p):$(TARGET_COPY_OUT_VENDOR)/odm/$(p))

PRODUCT_COPY_FILES += \
    $(foreach p,$(ODM_ADRENO_LIB_EGL_FILES),$(COMMON_ODM_SUBPATH)/lib/$(p):$(TARGET_COPY_OUT_VENDOR)/lib/$(p)) \
    $(foreach p,$(ODM_ADRENO_LIB64_EGL_FILES),$(COMMON_ODM_SUBPATH)/lib64/$(p):$(TARGET_COPY_OUT_VENDOR)/lib64/$(p))

PRODUCT_COPY_FILES += $(foreach lib_dir,lib lib64, \
    $(foreach p,$(ODM_ADRENO_HW_VULKAN_LIBS), \
    $(COMMON_ODM_SUBPATH)/$(lib_dir)/$(p):$(TARGET_COPY_OUT_VENDOR)/$(lib_dir)/$(p) \
    ) \
)

PRODUCT_COPY_FILES += $(foreach lib_dir,lib lib64, \
    $(foreach p,$(ODM_ADRENO_SINGLE_LIBS), \
    $(COMMON_ODM_SUBPATH)/$(lib_dir)/$(p):$(TARGET_COPY_OUT_VENDOR)/$(lib_dir)/$(p) \
    ) \
)

endif
