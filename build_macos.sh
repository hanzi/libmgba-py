#!/bin/bash

# mGBA version that should be checked out from the Git repository.
# Must be a valid Git ref.
MGBA_VERSION=0.10.2
if [ "$(uname)" != "Darwin" ]
 then
  >&2 echo "This does not seem to be Macos. Only Macos is supported by this convenience script."
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

# I have NO clue how this works, I couldnt work out why it kept complaining about png.h but this shut it up
# If someone smarter than me works it out please fix it lmao
mv mgba-src/include/mgba-util/png-io.h mgba-src/include/mgba-util/png.h
touch mgba-src/include/mgba-util/png-io.h
pip install cffi setuptools
python3 setup.py build --build-lib build/mac

echo ""
echo "Done!"
echo "Distributable files are located in build/mac/mgba/"
cd "$ORIGINAL_DIRECTORY"