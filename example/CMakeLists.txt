project(example CXX)

file(GLOB_RECURSE sourceFiles ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

add_executable(example ${sourceFiles})

target_include_directories(example
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../include)

target_link_libraries(example
    PUBLIC CompileTimeEncryption MMapLoader)