# ODM packager

Put the unpacked odm image inside the odm/ folder
(i.e. under device/sony/odm/odm)

And inherit `device/sony/odm/odm.mk` from device/sony/common:
```
[...]
 $(call inherit-product, device/sony/common/common-treble.mk)
+$(call inherit-product, device/sony/odm/odm.mk)
```

Remove `adreno_symlinks` from `PRODUCT_PACKAGES`!
```
 PRODUCT_PACKAGES += \
-    adreno_symlinks \
```

Then also add `/odm/radio` and `/odm/build.prop` to
`BOARD_ROOT_EXTRA_SYMLINKS` in `CommonConfig.mk`:
```
[...]
 BOARD_ROOT_EXTRA_SYMLINKS += /$(TARGET_COPY_OUT_VENDOR)/firmware_mnt:/firmware
 BOARD_ROOT_EXTRA_SYMLINKS += /$(TARGET_COPY_OUT_VENDOR)/bt_firmware:/bt_firmware
 BOARD_ROOT_EXTRA_SYMLINKS += /mnt/vendor/persist:/persist
+BOARD_ROOT_EXTRA_SYMLINKS += /$(TARGET_COPY_OUT_VENDOR)/odm/build.prop:/odm/build.prop
+BOARD_ROOT_EXTRA_SYMLINKS += /$(TARGET_COPY_OUT_VENDOR)/odm/radio:/odm/radio
[...]
```

# TODO
Copy keymaster files etc to /vendor/ instead of keeping them in /vendor/odm so
TWRP can use crypto functions
