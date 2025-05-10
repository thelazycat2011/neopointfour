#include <jni.h>
#include <dlfcn.h>
#include "patch.h"
#include "../include/cocos2dx/include/cocos2d.h"
#include "Logger.h"
#include <hooking.h>
#include <string>
#include <iostream>

using namespace cocos2d;

#ifndef __GDMACROS_H__
#define __GDMACROS_H__

/** __STR_CAT__(str)
* Concatenate 2 tokens. Don't use this.
*/
#define __STR_CAT___(str1, str2) str1##str2
#define __STR_CAT__(str1, str2) __STR_CAT___(str1, str2)

/** PAD
* Add padding to a class / struct. For shifting classes /
* structs to be aligned, if too lazy to fully reverse.
*
* Based on line number, to be standard C / C++ compatible.
*/
#define PAD(size) char __STR_CAT__(__, __STR_CAT__(pad, __LINE__))[size] = {};

template <class R, class T>
R& from(T base, intptr_t offset) {
    return *reinterpret_cast<R*>(reinterpret_cast<uintptr_t>(base) + offset);
}

/** __WARN_DEBUG__
* Set this macro to 0 to disable warnings when compiling in debug.
*/
#define __WARN_DEBUG__ true

#endif 