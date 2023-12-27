cmake_minimum_required(VERSION 3.27)

include(toolchain.cmake)

project(gcc_flash_test
        VERSION
            1.0.0
        LANGUAGES
            C
            CXX
            ASM
)

set(CMAKE_C_STANDARD 11)

set(TARGET_NAME gcc_flash_test)
add_executable(${TARGET_NAME})

set_target_properties(
        ${TARGET_NAME}
        PROPERTIES
            OUTPUT_NAME ${TARGET_NAME}.elf
)

target_compile_options(
        ${TARGET_NAME}
        PRIVATE
            -g3
            -mthumb
            -mcpu=cortex-m4
            -ffunction-sections
            -fdata-sections

            $<$<CONFIG:Debug>:>
            $<$<CONFIG:Release>:-Os>
)

target_compile_definitions(
        ${TARGET_NAME}
        PRIVATE
            $<$<CONFIG:Release>:NDEBUG>
)

target_link_options(
        ${TARGET_NAME}
        PRIVATE
            --specs=nano.specs
            --specs=nosys.specs

            -T ${CMAKE_CURRENT_LIST_DIR}/cfg/stm32f4-linker.ld

            LINKER:--gc-sections
            LINKER:--print-memory-usage
            LINKER:-Map=${TARGET_NAME}.map
)

target_sources(
        ${TARGET_NAME}
        PRIVATE
            main.c
            curve25519-donna-master/curve25519-donna.c
)
