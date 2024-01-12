# mGBA Python Bindings

This is a fork of the Python bindings in the
[mGBA repository](https://github.com/mgba-emu/mgba/tree/master/src/platform/python)
with some modifications to get it to build easily on my machine.

## What this is (and isn't)

This provides Python bindings to libmgba, which is a library of
functions that mGBA uses internally.

Thus, you can use it to create a 'headless' emulator instance and
interact with its internal functions using Python.

It does **not** come with any GUI, i.e. you can't use it to just
remote control an instance of the mGBA emulator.

## Build Instructions

### Compiling on Windows (64-bit)

Heads up: This will require a couple of GB of disk space.

1. Have [Visual Studio](https://visualstudio.microsoft.com/vs/community/) installed (the free Community Edition is enough.)
2. Have [Python](https://www.python.org/downloads/windows/) installed.  
   (Also make sure you have `setuptools` installed. You might have to run `pip install setuptools` for that.)
3. Have [Git](https://git-scm.com/download/win) installed.
4. Download this repository to somewhere on your hard drive (using `git clone` or by just downloading it as a ZIP file.)
5. Open the Start menu, look for the `Visual Studio 2022` directory, and run the `x64 Native Tools Command Prompt`.
6. Navigate to wherever you have extracted this repository (e.g. `cd /D C:\Users\someone\Desktop\libmgba-py`.)
7. Run `build_win64.bat`

Afterwards, distributable files should be available in the
`build\win64\mgba` directory. You can copy that entire directory
into your Python project, or create a package from it.

### Compiling on Linux/Ubuntu

These instructions only works for Ubuntu, specifically for versions
that are supported by mGBA's Docker build containers. Available tags
can be checked here: https://hub.docker.com/r/mgba/ubuntu/tags

1. Have [Docker](https://docs.docker.com/engine/install/ubuntu/) installed
2. Have Git installed (`apt install git`)
3. Download this repository to somewhere on your hard drive (using `git clone` or by just downloading it as a ZIP file.)
4. Open a shell and navigate to this directory.
5. Run `build_ubuntu.sh`

### Compiling on MacOS (Ventura 13.5 or later)

1. Have [Homebrew](https://brew.sh/) installed
2. Have Xcode installed from the app store
3. Download this repository to somewhere on your hard drive (using `git clone` or by just downloading it as a ZIP file.)
4. Open a shell and navigate to this directory.
5. Run `./build_macos.sh`

## License

This code was taken from the offical mGBA repository and only modified
a bit, so [the original license terms](https://github.com/mgba-emu/mgba/#copyright)
apply:

> mGBA is Copyright © 2013 – 2023 Jeffrey Pfau.
>
> It is distributed under the Mozilla Public License version 2.0.  
> A copy of the license is available in the distributed LICENSE file.
