#!/bin/bash

# mGBA version that should be checked out from the Git repository.
# Must be a valid Git ref.
MGBA_VERSION=0.10.3
if [ "$(uname)" != "Darwin" ]
 then
  >&2 echo "This does not seem to be MacOS. Only MacOS is supported by this convenience script."
  exit 1
fi

ORIGINAL_DIRECTORY=$(pwd)

# Download and build mGBA itself
git clone https://github.com/mgba-emu/mgba.git mgba-src
cd mgba-src
git checkout "$MGBA_VERSION"
brew install cmake ffmpeg libzip qt5 sdl2 libedit lua pkg-config
mkdir build
cd build
cmake -DCMAKE_PREFIX_PATH=`brew --prefix qt5` ..
make
cd ../..

pip install cffi setuptools
python3 setup.py build --build-lib build/mac

echo ""
echo "Done!"
echo "Distributable files are located in build/mac/mgba/"
cd "$ORIGINAL_DIRECTORY"
