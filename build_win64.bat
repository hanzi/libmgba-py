@echo off

REM mGBA version that should be checked out from the Git repository. Must be a valid Git ref.
SET MGBA_VERSION=0.10.2

WHERE /q git
IF %ERRORLEVEL% NEQ 0 (
    echo Git is not installed, or cannot be found in PATH.
    EXIT /B 1
)

WHERE /q cmake
IF %ERRORLEVEL% NEQ 0 (
    echo cmake cannot be found in PATH. Is Visual Studio installed? Are you running the 'Native Tools Command Prompt'?
    EXIT /B 1
)

WHERE /q msbuild
IF %ERRORLEVEL% NEQ 0 (
    echo msbuild cannot be found in PATH. Is Visual Studio installed? Are you running the 'Native Tools Command Prompt'?
    EXIT /B 1
)

PUSHD .

REM Download the mGBA sources to we can compile libmgba
git clone https://github.com/mgba-emu/mgba.git mgba-src
cd mgba-src
git checkout %MGBA_VERSION%
mkdir build
cd build

REM Download vcpkg because the version included in Visual Studio might not work
REM (that's the case as of 2023-09-22.)
git clone https://github.com/microsoft/vcpkg
call vcpkg\bootstrap-vcpkg.bat

REM Build mGBA (this also creates mgba.dll)
vcpkg\vcpkg.exe install ffmpeg[vpx,x264] libepoxy libpng libzip lua sdl2 sqlite3 --triplet=x64-windows
cmake -DCMAKE_TOOLCHAIN_FILE=./vcpkg/scripts/buildsystems/vcpkg.cmake -DBUILD_SHARED=ON -DBUILD_STATIC=ON ..
msbuild ALL_BUILD.vcxproj /property:Configuration=Release

REM Now build the actual Python bindings
cd ..\..
python setup.py build --build-lib build/win64
copy mgba-src\build\Release\*.dll build\win64\mgba

@echo on
@echo Done!
@echo Distributable files are located in `.\build\win64\mgba\`.
@echo off

POPD
