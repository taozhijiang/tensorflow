cmake_minimum_required (VERSION 2.8.12)
project(start_tf_simple)

include("${PROJECT_SOURCE_DIR}/help.cmake")
define_colors()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Wno-shadow -Wno-sign-compare")
set(CMAKE_CXX_STANDARD 11)

option(BUILD_DEBUG "build project for debug or development propurse..." ON)

# 编译结果中的库和可执行文件的路径
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib)

set(macOS_PREFIX "/Volumes/CaseVolume/Repository/Dropbox/repos/macOS/")

set(INCLUDE_DIRS
    ${PROJECT_SOURCE_DIR}
    ${PROJECT_SOURCE_DIR}/../../
    ${PROJECT_SOURCE_DIR}/../../bazel-genfiles/
    ${macOS_PREFIX}/include
    ${macOS_PREFIX}/include/eigen3/
)
include_directories( ${INCLUDE_DIRS} )

link_directories(
    ${PROJECT_SOURCE_DIR}/../../bazel-bin/tensorflow
    ${macOS_PREFIX}/lib
)

set (EXTRA_LIBS ${EXTRA_LIBS} tensorflow_cc)

add_executable(start_tf_add main.cc add.cc)
target_link_libraries(
    start_tf_add
    ${EXTRA_LIBS}
)


if(BUILD_DEBUG)
    
    # 启用单元测试
    enable_testing()
    add_subdirectory( test )

endif(BUILD_DEBUG)