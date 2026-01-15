project(dummy CXX)

file(GLOB_RECURSE sourceFiles ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

add_executable(dummy ${sourceFiles})