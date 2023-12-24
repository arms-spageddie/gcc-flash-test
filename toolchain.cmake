set(CMAKE_SYSTEM_NAME               Generic)
set(CMAKE_SYSTEM_PROCESSOR          ARM-Cortex-M4)
set(CMAKE_TRY_COMPILE_TARGET_TYPE   STATIC_LIBRARY)

function(_find_tool VAR_NAME BINARY_NAME)
    if (NOT EXISTS CACHE{${VAR_NAME}})
        # Try to locate tool
        find_program(
                ${VAR_NAME}
                ${BINARY_NAME}
                PATHS
                ${TOOLCHAIN_PATH}
                DOC "${BINARY_NAME} path"
                REQUIRED
        )
    endif ()
endfunction()

# Find tools
_find_tool(BIN_COMPILER_C       arm-none-eabi-gcc)
_find_tool(BIN_COMPILER_CXX     arm-none-eabi-g++)
_find_tool(BIN_COMPILER_ASM     arm-none-eabi-gcc)
_find_tool(BIN_AR               arm-none-eabi-ar)
_find_tool(BIN_OBJCOPY          arm-none-eabi-objcopy)
_find_tool(BIN_OBJDUMP          arm-none-eabi-objdump)
_find_tool(BIN_SIZE             arm-none-eabi-size)

# Set tools
set(CMAKE_C_COMPILER_ID "GNU")
set(CMAKE_C_COMPILER    ${BIN_COMPILER_C})
set(CMAKE_CXX_COMPILER  ${BIN_COMPILER_CXX})
set(CMAKE_ASM_COMPILER  ${BIN_COMPILER_ASM})
set(CMAKE_AR            ${BIN_AR})
set(CMAKE_OBJCOPY       ${BIN_OBJCOPY})
set(CMAKE_OBJDUMP       ${BIN_OBJDUMP})