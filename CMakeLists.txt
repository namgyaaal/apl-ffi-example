cmake_minimum_required(VERSION 3.10)
project(basic_lib)

file(GLOB_RECURSE SRC_FILES src/*.c src/*.h)
add_library(basic SHARED ${SRC_FILES})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)
set_target_properties(basic PROPERTIES LINKER_LANGUAGE C)

