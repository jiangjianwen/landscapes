#!/bin/bash

#####################################################################
####Run this from the project root directory
####This script will delete/overwrite any data in the ./libs directory
#### that it will download and build.
#####################################################################



CMAKE_DEPS_BUILD_TYPE="Debug"
CMAKE_BUILD_TYPE="Debug"

CMAKE_GENERATOR="MSYS Makefiles" CMAKE_BUILD_TYPE="$CMAKE_DEPS_BUILD_TYPE" bash ./scripts/download-and-build-googletest.sh

CMAKE_GENERATOR="MSYS Makefiles" CMAKE_BUILD_TYPE="$CMAKE_DEPS_BUILD_TYPE" bash ./scripts/download-and-build-libs-with-no-pkg.sh

#CMAKE_GENERATOR="MSYS Makefiles" bash ./scripts/download-unittest-data.sh

rm -rf ./build
mkdir -p build && cd build

cmake -G"MSYS Makefiles" ..
cmake . -DCMAKE_BUILD_TYPE="$CMAKE_BUILD_TYPE"
cmake --build .

./unittests




