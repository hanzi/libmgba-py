mGBA Python Bindings
=====================

This is a fork of the Python bindings in the [mGBA repository](https://github.com/mgba-emu/mgba/tree/master/src/platform/python) and [libmgba-py repository](https://github.com/hanzi/libmgba-py)
with some modifications to get it to build easily on Raspberry Pi 4 (Pi 5 not tested).


## What this is (and isn't)

This provides Python bindings to libmgba, which is a library of
functions that mGBA uses internally.

Thus, you can use it to create a 'headless' emulator instance and
interact with its internal functions using Python.

It does **not** come with any GUI, i.e. you can't use it to just
remote control an instance of the mGBA emulator.


## Build Instructions on Raspberry Pi OS 64 bits (Trixie) (tested on PI 4)

### mGBA 0.10.x

   These instructions CAN ONLY WORK with the mGBA 0.10.x branches, replace x with the number desired (not tested with mGBA version higher than 0.10.5)
   
   example for mGBA 0.10.5
   1. Install depedencies<br>`sudo apt install python3-setuptools python3-cffi python3-dev python3-tk libmgba0.10t64 portaudio19-dev git cmake build-essential libedit-dev libavcodec-dev libavfilter-dev libpng-dev libzip-dev libminizip-dev libepoxy-dev libelf-dev libsdl2-dev liblua5.4-dev libsqlite3-dev`
   2. Download Pokébot-gen3<br>`git clone --depth 1 https://github.com/40Cakes/pokebot-gen3`
   3. Now we create a special folder for the buids files and venv<br>`cd && mkdir LibmgbaForRPI`<br>`cd LibmgbaForRPI`
   5. We create a python venv<br>`python -m venv PyPokebot`
   6. We install the pokebot-gen3 requirements<br>`/home/pi/LibmgbaForRPI/PyPokebot/bin/python /home/pi/pokebot-gen3/requirements.py`<br>(Press Enter when asked to "install libmgba-py anyway")
   7. `git clone https://github.com/hanzi/libmgba-py/`
   8. `git clone --depth 1 --branch 0.10.5 https://github.com/mgba-emu/mgba`
   9. `cp /home/pi/LibmgbaForRPI/libmgba-py/core.* /home/pi/LibmgbaForRPI/mgba/src/platform/python/`
   10. `cp /home/pi/LibmgbaForRPI/libmgba-py/mgba/* /home/pi/LibmgbaForRPI/mgba/src/platform/python/mgba/`
   11. `cd /home/pi/LibmgbaForRPI/mgba`
   12. `mkdir build`
   13. `cd build`
   14. `cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-Wno-error=incompatible-pointer-types" -DENABLE_PYTHON=ON -DBUILD_PYTHON=ON -DBUILD_QT=OFF`
   15. `make CFLAGS="-Wno-error=incompatible-pointer-types" -j4`
   16. `cp /home/pi/LibmgbaForRPI/mgba/build/python/lib.linux-aarch64-cpython-313/mgba/* /home/pi/pokebot-gen3/mgba/`
   17. Launch the game with this command<br>`/home/pi/LibmgbaForRPI/PyPokebot/bin/python /home/pi/pokebot-gen3/pokebot.py`
   
   > [!WARNING]
   > **DON'T DELETE NOR MOVE THE `/home/pi/LibmgbaForRPI` FOLDER !**

## License

This code was taken from the offical mGBA repository and only modified
a bit, so [the original license terms](https://github.com/mgba-emu/mgba/#copyright)
apply:

> mGBA is Copyright © 2013 – 2023 Jeffrey Pfau.
> 
> It is distributed under the Mozilla Public License version 2.0.  
> A copy of the license is available in the distributed LICENSE file.
