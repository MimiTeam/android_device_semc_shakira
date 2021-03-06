$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/shakira/shakira-vendor.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := E15i
PRODUCT_DEVICE := shakira
PRODUCT_MODEL := E15i

#
# Boot files
#
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
endif

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=160

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.    
DEVICE_PACKAGE_OVERLAYS := device/semc/shakira/overlay

-include device/semc/msm7x27-common/msm7x27.mk

# Sensors lights
PRODUCT_PACKAGES += \
    sensors.shakira \
    lights.shakira

# Shakira has working copybit too
PRODUCT_PACKAGES += \
    copybit.msm7x27

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/semc/shakira/prebuilt/media_profiles.xml:/system/etc/media_profiles.xml

# Shakira uses medium-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Extra prebuilt binaries
PRODUCT_COPY_FILES += \
    device/semc/shakira/prebuilt/hw_config.sh:system/etc/hw_config.sh

# Wifi firmware
PRODUCT_COPY_FILES += \
    device/semc/shakira/prebuilt/tiwlan.ini:system/etc/wifi/tiwlan.ini \
    device/semc/shakira/prebuilt/tiwlan_ap.ini:system/etc/wifi/softap/tiwlan_ap.ini

# Themes
PRODUCT_COPY_FILES += \
    device/semc/shakira/prebuilt/Seeder-2.0.0b1.apk:system/app/Seeder-2.0.0b1.apk \

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/semc/shakira/prebuilt/system,system)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/semc/shakira/prebuilt/WALKMAN,system)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/semc/shakira/prebuilt/SuperSU,system)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/semc/shakira/prebuilt/SmallGappsICS,system)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/semc/shakira/prebuilt/XperiaHome,system)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/semc/shakira/prebuilt/XperiaApps,system)

# Touchsceen
PRODUCT_COPY_FILES += \
    device/semc/msm7x27-common/prebuilt/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/semc/msm7x27-common/prebuilt/cyttsp-spi.idc:system/usr/idc/cyttsp-spi.idc

PRODUCT_PROPERTY_OVERRIDES := \
    windowsmgr.max_events_per_sec=240 \
    ro.kernel.android.checkjni=0 \
    ro.kernel.checkjni=0 \
    ro.max.fling_velocity=6000 \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \ 
    ro.ril.hep=1 \
    ro.ril.enable.dtm=1 \ 
    ro.ril.hsdpa.category=10 \ 
    ro.ril.enable.a53=1 \
    ro.ril.enable.3g.prefix=1 \ 
    ro.ril.htcmaskw1.bitmask=4294967295 \ 
    ro.ril.htcmaskw1=14449 \
    ro.ril.hsupa.category=5 \
    net.tcp.buffersize.default=4096,87380,256960,4096, 16384,256960 \
    net.tcp.buffersize.wifi=4096,87380,256960,4096,163 84,256960 \
    net.tcp.buffersize.umts=4096,87380,256960,4096,163 84,256960 \
    net.tcp.buffersize.gprs=4096,87380,256960,4096,163 84,256960 \
    net.tcp.buffersize.edge=4096,87380,256960,4096,163 84,256960 

