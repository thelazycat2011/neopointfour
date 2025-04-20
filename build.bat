@echo off

REM edit paths here, important: \ at the end

set NDK=D:\android-ndk-r16b\

set MAIN=D:\development\neopointfour\

call %NDK%ndk-build.cmd NDK_PROJECT_PATH=%MAIN% NDK_APPLICATION_MK=%MAIN%jni\Application.mk MAIN_LOCAL_PATH=%MAIN%jni
pause