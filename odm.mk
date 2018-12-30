COMMON_ODM_PATH := device/sony/odm
COMMON_ODM_SUBPATH := $(COMMON_ODM_PATH)/odm

ifeq ($(PRODUCT_PREBUILT_ODM),true)

ODM_FILES := $(foreach p,$(shell find $(COMMON_ODM_SUBPATH) -type f),$(subst $(COMMON_ODM_SUBPATH)/,,$(p)))

PRODUCT_COPY_FILES += \
	$(foreach p,$(ODM_FILES),$(COMMON_ODM_SUBPATH)/$(p):$(TARGET_COPY_OUT_VENDOR)/odm/$(p))

endif
