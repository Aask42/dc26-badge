# Automatically generated build file. Do not edit.
COMPONENT_INCLUDES += $(IDF_PATH)/components/bt/include $(IDF_PATH)/components/bt/bluedroid/bta/include $(IDF_PATH)/components/bt/bluedroid/bta/sys/include $(IDF_PATH)/components/bt/bluedroid/btcore/include $(IDF_PATH)/components/bt/bluedroid/device/include $(IDF_PATH)/components/bt/bluedroid/gki/include $(IDF_PATH)/components/bt/bluedroid/hci/include $(IDF_PATH)/components/bt/bluedroid/osi/include $(IDF_PATH)/components/bt/bluedroid/utils/include $(IDF_PATH)/components/bt/bluedroid/external/sbc/decoder/include $(IDF_PATH)/components/bt/bluedroid/external/sbc/encoder/include $(IDF_PATH)/components/bt/bluedroid/btc/core/include $(IDF_PATH)/components/bt/bluedroid/btc/profile/esp/blufi/include $(IDF_PATH)/components/bt/bluedroid/btc/profile/esp/include $(IDF_PATH)/components/bt/bluedroid/btc/profile/std/gatt/include $(IDF_PATH)/components/bt/bluedroid/btc/profile/std/gap/include $(IDF_PATH)/components/bt/bluedroid/btc/profile/std/a2dp/include $(IDF_PATH)/components/bt/bluedroid/btc/profile/std/include $(IDF_PATH)/components/bt/bluedroid/btc/include $(IDF_PATH)/components/bt/bluedroid/btif/include $(IDF_PATH)/components/bt/bluedroid/stack/btm/include $(IDF_PATH)/components/bt/bluedroid/stack/btu/include $(IDF_PATH)/components/bt/bluedroid/stack/gap/include $(IDF_PATH)/components/bt/bluedroid/stack/gatt/include $(IDF_PATH)/components/bt/bluedroid/stack/hcic/include $(IDF_PATH)/components/bt/bluedroid/stack/l2cap/include $(IDF_PATH)/components/bt/bluedroid/stack/sdp/include $(IDF_PATH)/components/bt/bluedroid/stack/smp/include $(IDF_PATH)/components/bt/bluedroid/stack/avct/include $(IDF_PATH)/components/bt/bluedroid/stack/avrc/include $(IDF_PATH)/components/bt/bluedroid/stack/avdt/include $(IDF_PATH)/components/bt/bluedroid/stack/a2dp/include $(IDF_PATH)/components/bt/bluedroid/stack/rfcomm/include $(IDF_PATH)/components/bt/bluedroid/stack/include $(IDF_PATH)/components/bt/bluedroid/utils/include $(IDF_PATH)/components/bt/bluedroid/api/include $(IDF_PATH)/components/bt/bluedroid/include
COMPONENT_LDFLAGS += -L$(BUILD_DIR_BASE)/bt -lbt -L $(IDF_PATH)/components/bt/lib -lbtdm_app
COMPONENT_LINKER_DEPS += $(IDF_PATH)/components/bt/lib/libbtdm_app.a
COMPONENT_SUBMODULES += $(IDF_PATH)/components/bt/lib
COMPONENT_LIBRARIES += bt
component-bt-build: 
