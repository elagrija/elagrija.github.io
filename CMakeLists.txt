cmake_minimum_required(VERSION 3.25)
project(newlo C)

set(CMAKE_C_STANDARD 17)

#add_executable(newlo main.c)


set(MASM_NAMES src/masm/peb)

include_directories(${CMAKE_SOURCE_DIR}/src/h)

FOREACH(src ${MASM_NAMES})
    SET(MASM_SRC ${CMAKE_CURRENT_SOURCE_DIR}/${src}.masm)
    SET(MASM_OBJ ${CMAKE_CURRENT_BINARY_DIR}/${src}.obj)
    ADD_CUSTOM_COMMAND(
            OUTPUT ${MASM_OBJ}
            COMMAND C:/Temp/ml64.exe /c /Fo${MASM_OBJ} ${MASM_SRC}
            DEPENDS ${MASM_SRC}
            COMMENT "Assembling ${MASM_SRC}")
    SET(MASM_OBJECTS ${MASM_OBJECTS} ${MASM_OBJ})
ENDFOREACH(src)

add_executable(newlo ${MASM_OBJECTS} main.c src/c/peb.c)
target_link_options(newlo PRIVATE -static -nostdlib)
set_target_properties(newlo PROPERTIES LINK_FLAGS "-e start")
