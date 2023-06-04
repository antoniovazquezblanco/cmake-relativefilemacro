# CMake Relative File Macro

This module allows you to expose the relative path of the file being compiled to your code.


## Installation

This repo is meant to be cloned as a submoule inside your project CMake modules folder. Alternatively, you can copy the cmake module directly in your folder.

Remember to add your CMake modules folder to the module search path in your `CMakeLists.txt`. This can be done with the list append command:
```CMake
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/<your_cmake_modules_folder>/cmake-relativefilemacro")
```

Also, include the module in your `CMakeLists.txt`:
```CMake
include(RelativeFileMacro)
```


## Usage

The module exposes two macros you can call:
* `source_add_relative_file_macro(SRC_FILE_VAR)`: This adds a `__REL_FILE__` macro definition to a source file.
* `target_add_relative_file_macro(TARGET)`: This adds the `__REL_FILE__` macro definition to all source files in the target.
