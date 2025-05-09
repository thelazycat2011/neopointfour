LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_CPP_FEATURES := rtti
LOCAL_MODULE := dobby
LOCAL_SRC_FILES := libraries/libdobby.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include/libzip
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CPP_FEATURES := rtti
LOCAL_MODULE := hooking
LOCAL_SHARED_LIBRARIES := dobby
LOCAL_SRC_FILES := libraries/libhooking.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include/libzip
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
COCOS_PATH    := 	$(LOCAL_PATH)/include/cocos2dx
LOCAL_CPP_FEATURES := rtti
LOCAL_MODULE := game
LOCAL_SRC_FILES := libraries/libgame.so 
LOCAL_EXPORT_C_INCLUDES := 	$(LOCAL_PATH)/include/cocos2dx/include \
							$(LOCAL_PATH)/include/GeometryDash \
							$(COCOS_PATH)/include \
							$(COCOS_PATH)/Includes \
							$(COCOS_PATH)/kazmath/include \
							$(COCOS_PATH)/platform/android \
							$(COCOS_PATH)/support \
							$(COCOS_PATH)/ \
							$(COCOS_PATH)/base_nodes \
							$(COCOS_PATH)/extensions/DS_Dictionary \
							$(COCOS_PATH)/platform \
							$(COCOS_PATH)/extensions \

include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_CFLAGS := -w
LOCAL_CPP_FEATURES := rtti
LOCAL_MODULE := neopointfour
LOCAL_DISABLE_FORMAT_STRING_CHECKS := true
LOCAL_SHARED_LIBRARIES := game hooking
TARGET_ARCH_ABI := all
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include \
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include/includes \
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include/KittyMemory \


LOCAL_SRC_FILES := 	src/main.cpp \
					src/KittyMemory/KittyMemory.cpp \
					src/KittyMemory/KittyUtils.cpp \
					src/KittyMemory/MemoryBackup.cpp \
					src/KittyMemory/MemoryPatch.cpp

LOCAL_LDLIBS := -llog \
				-frtti \
				-lEGL \
				-lGLESv2

include $(BUILD_SHARED_LIBRARY)