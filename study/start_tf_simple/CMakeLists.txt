cmake_minimum_required (VERSION 2.8.12)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g -Wno-shadow -Wno-sign-compare")
set(CMAKE_CXX_STANDARD 11)

project(start_tf_simple)

# 编译结果中的库和可执行文件的路径
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib)

set(macOS_PREFIX "/Volumes/CaseVolume/Repository/Dropbox/repos/macOS/")

set(INCLUDE_DIRS
    ${PROJECT_SOURCE_DIR}/../../
    ${PROJECT_SOURCE_DIR}/../../bazel-genfiles/
    ${macOS_PREFIX}/include
    ${macOS_PREFIX}/include/eigen3/
)
include_directories( ${INCLUDE_DIRS} )

link_directories(
    ${PROJECT_SOURCE_DIR}/../../bazel-bin/tensorflow
)

set (EXTRA_LIBS ${EXTRA_LIBS} tensorflow_cc)

add_executable(start_tf_add add.cc)
target_link_libraries(
    start_tf_add
    ${EXTRA_LIBS}
)
