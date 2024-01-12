#!/bin/bash

# mGBA version that should be checked out from the Git repository.
# Must be a valid Git ref.
MGBA_VERSION=0.10.3

LSB_DISTRIBUTION_ID=$(lsb_release -si)
if [ "$LSB_DISTRIBUTION_ID" != "Ubuntu" ]
then
  >&2 echo "This does not seem to be an Ubuntu installation. Only Ubuntu is supported by this convenience script."
  exit 1
fi

UBUNTU_CODENAME=${1:-$(lsb_release -sc)}
ORIGINAL_DIRECTORY=$(pwd)

# Download and build mGBA itself
git clone https://github.com/mgba-emu/mgba.git mgba-src
cd mgba-src
git checkout "$MGBA_VERSION"
docker run --rm \
  -v "$(pwd):/home/mgba/src" \
  -e CMAKE_FLAGS="-DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED=ON -DBUILD_STATIC=OFF" \
  "mgba/ubuntu:$UBUNTU_CODENAME"
cd ..

# Build the Python bindings
docker run --rm \
  -v "$(pwd)/mgba-src:/home/mgba/src" \
  -v "$(pwd):/home/mgba/libmgba-py" \
  -w /home/mgba/libmgba-py \
  --user root \
  "mgba/ubuntu:$UBUNTU_CODENAME" \
  /bin/sh -c "apt-get update && apt-get full-upgrade -y && apt-get install -y python3-dev python3-cffi python3-setuptools && python3 setup.py build --build-lib build/ubuntu-$UBUNTU_CODENAME"

echo ""
echo "Done!"
echo "Distributable files are located in build/ubuntu-$UBUNTU_CODENAME/mgba/"
cd "$ORIGINAL_DIRECTORY"
