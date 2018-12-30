# ODM packager

Put the unpacked odm image inside the odm/ folder
(i.e. under device/sony/odm/odm)

Set this variable, e.g. in device/sony/common/common.mk:
```
PRODUCT_PREBUILT_ODM := true
```

And call device/sony/odm/odm.mk from device/sony/common:
```
[...]
$(call inherit-product, device/sony/common/common-treble.mk)
$(call inherit-product, device/sony/odm/odm.mk)
```

Then also add /odm/radio and /odm/build.prop to SONY_SYMLINKS:
```
[...]
SONY_CLEAR_VARS := $(COMMON_PATH)/sony_clear_vars.mk
SONY_BUILD_SYMLINKS := $(COMMON_PATH)/sony_build_symlinks.mk
[...]
SONY_SYMLINKS += \
    /vendor/odm/build.prop:$(TARGET_OUT_ROOT)/odm/build.prop \
    /vendor/odm/radio:$(TARGET_OUT_ROOT)/odm/radio
[...]
include $(SONY_BUILD_SYMLINKS)
```
