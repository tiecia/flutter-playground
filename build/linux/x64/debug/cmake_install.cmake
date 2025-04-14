# Install script for directory: /home/tiec/dev/random/flutter_playground/linux

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/nix/store/n37gxbg343hxin3wdryx092mz2dkafy8-clang-wrapper-16.0.6/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  
  file(REMOVE_RECURSE "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/")
  
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/flutter_playground" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/flutter_playground")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/flutter_playground"
         RPATH "$ORIGIN/lib")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/flutter_playground")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle" TYPE EXECUTABLE FILES "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/intermediates_do_not_run/flutter_playground")
  if(EXISTS "$ENV{DESTDIR}/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/flutter_playground" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/flutter_playground")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/flutter_playground"
         OLD_RPATH "/home/tiec/dev/random/flutter_playground/linux/flutter/ephemeral:/nix/store/1jkmjwd4d5c9x520kw2wzpw09bfcldcq-gtk+3-3.24.38/lib:/nix/store/7ah2yapjqvx33as3gqxqkgaica6x8mp7-pango-1.51.0/lib:/nix/store/rnw7n0c8zxhzxzrn8d7kr1xmc95wxqlw-harfbuzz-7.3.0/lib:/nix/store/mnjqn0qmnvjjp5c3ly5i7a7jhp83zlfg-at-spi2-core-2.50.0/lib:/nix/store/disx58b0m5lmvpc0ddbaxpnfniik1z2x-cairo-1.18.0/lib:/nix/store/9v7bs0i8r6x9sg6q64qyhqgzmj1nrbmw-gdk-pixbuf-2.42.10/lib:/nix/store/5qxy21wbd1n391y8wrf2djyjkiz1bs16-glib-2.78.1/lib:"
         NEW_RPATH "$ORIGIN/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/nix/store/n37gxbg343hxin3wdryx092mz2dkafy8-clang-wrapper-16.0.6/bin/strip" "$ENV{DESTDIR}/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/flutter_playground")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/data/icudtl.dat")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/data" TYPE FILE FILES "/home/tiec/dev/random/flutter_playground/linux/flutter/ephemeral/icudtl.dat")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/lib/libflutter_linux_gtk.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/lib" TYPE FILE FILES "/home/tiec/dev/random/flutter_playground/linux/flutter/ephemeral/libflutter_linux_gtk.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  
  file(REMOVE_RECURSE "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/data/flutter_assets")
  
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/data/flutter_assets")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/bundle/data" TYPE DIRECTORY FILES "/home/tiec/dev/random/flutter_playground/build//flutter_assets")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/flutter/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/tiec/dev/random/flutter_playground/build/linux/x64/debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
