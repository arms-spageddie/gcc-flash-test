# Description

This is a sample project which is meant to test the ARM GCC toolchain for memory usage. I believe there is a bug in ARM
GCC since v10 which causes the flash memory usage to increase drastically.

# Requirements

This is a `CMake` based project, so you must have `CMake` installed. You will also need a version of ARM GCC for bare metal
(`arm-none-eabi-`) installed.

# Usage

First clone the project onto your local machine, then navigate to the directory where the project is cloned and run `CMake`
using the following command:

```shell
cmake -DTOOLCHAIN_PATH=/path/to/arm_gcc/bin/dir -B build
```

This will build the necessary files for the build system. The macro `TOOLCHAIN_PATH` must point to the ARM GCC `bin` directory.
This is the directory which contains the `arm-none-eabi-gcc` executable.

Once the build system is generated via the above command, you can build the project using the following command:

```shell
cmake --build build -t gcc_flash_test
```

# Output

The result should print the memory usage as shown below (memory usage will be different depending on ARM GCC version used):

```shell
Memory region         Used Size  Region Size  %age Used
           FLASH:       31660 B       384 KB      8.05%
             RAM:          36 B       192 KB      0.02%
[100%] Built target gcc_flash_test
```

# Results

Below are the memory usage results from different ARM GCC versions.

## ARM GCC v6-2017-q2-update

```shell
Memory region         Used Size  Region Size  %age Used
           FLASH:       17704 B       384 KB      4.50%
             RAM:          40 B       192 KB      0.02%
```

## ARM GCC v7-2018-q2-update

```shell
Memory region         Used Size  Region Size  %age Used
           FLASH:       16864 B       384 KB      4.29%
             RAM:          36 B       192 KB      0.02%
```

## ARM GCC v8-2019-q3-update

```shell
Memory region         Used Size  Region Size  %age Used
           FLASH:       20448 B       384 KB      5.20%
             RAM:          36 B       192 KB      0.02%
```

## ARM GCC v9-2020-q2-update

```shell
Memory region         Used Size  Region Size  %age Used
           FLASH:       21352 B       384 KB      5.43%
             RAM:          36 B       192 KB      0.02%
```

## ARM GCC v10.3-2021.10

```shell
Memory region         Used Size  Region Size  %age Used
           FLASH:       31552 B       384 KB      8.02%
             RAM:          36 B       192 KB      0.02%
```

## ARM GCC v11.2-2022.02

```shell
Memory region         Used Size  Region Size  %age Used
           FLASH:       31660 B       384 KB      8.05%
             RAM:          36 B       192 KB      0.02%
```

## ARM GCC v11.3.Rel1

```shell
Memory region         Used Size  Region Size  %age Used
           FLASH:       31660 B       384 KB      8.05%
             RAM:          36 B       192 KB      0.02%
```

## ARM GCC v12.3.Rel1

```shell
Memory region         Used Size  Region Size  %age Used
           FLASH:       31660 B       384 KB      8.05%
             RAM:          36 B       192 KB      0.02%
```

## ARM GCC v13.2.rel1

```shell
Memory region         Used Size  Region Size  %age Used
           FLASH:       31660 B       384 KB      8.05%
             RAM:          36 B       192 KB      0.02%
```