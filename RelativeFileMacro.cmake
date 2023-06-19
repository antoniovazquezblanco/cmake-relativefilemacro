# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright 2023 Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>

#[=======================================================================[.rst:
RelativeFileMacro
-------

This module attempts to define the __REL_FILE__ macro as the relative paths
of a file.

This module requires CMake 3.20 or newer.

Custom functions
^^^^^^^^^^^^^^^^

``source_add_relative_file_macro(SRC_FILE)``
  Add a __REL_FILE__ macro definition a source file.
``target_add_relative_file_macro(TARGET)``
  Add a __REL_FILE__ macro definition to all sources in the provided TARGET.

#]=======================================================================]

# This module requires CMake 3.20 because it uses cmake_path
cmake_minimum_required(VERSION 3.20.0)

# Function that sets the __REL_FILE__ definition for a particular source file
function(source_add_relative_file_macro SRC_FILE)
    # Normalize
    cmake_path(ABSOLUTE_PATH SRC_FILE NORMALIZE OUTPUT_VARIABLE SRC_FILE_ABSOLUTE)
    # Get relative path
    cmake_path(RELATIVE_PATH SRC_FILE_ABSOLUTE BASE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} OUTPUT_VARIABLE SRC_FILE_REL)
    # Set a __FILE__ property for the current source file
    set_property(SOURCE ${SRC_FILE} APPEND PROPERTY COMPILE_DEFINITIONS __REL_FILE__="\"${SRC_FILE_REL}\"")
endfunction()

# Function that sets the __REL_FILE__ definition in all files of a particular target
function(target_add_relative_file_macro TARGET)
    get_target_property(TARGET_SRCS ${TARGET} SOURCES)
    foreach(SRC ${TARGET_SRCS})
        source_add_relative_file_macro(${SRC})
    endforeach()
endfunction()
