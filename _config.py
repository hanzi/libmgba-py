import os
import platform
from pathlib import Path

path_to_libmgba_py = Path(".").absolute()
path_to_homebrew_libs = Path("/usr/homebrew/include")
usr_local_include = Path("/usr/local/include")

if platform.system() == "Windows":
    path_to_mgba_root = Path("./mgba-src").absolute()
    path_to_mgba_build = Path("./mgba-src/build").absolute()
elif platform.system() == "Linux":
    # This only works for Ubuntu-based Docker images provided by the mGBA project
    # see: https://hub.docker.com/r/mgba/ubuntu/tags
    build_directory = os.environ["BUILD_DIR"]

    path_to_mgba_root = Path("/home/mgba/src")
    path_to_mgba_build = Path(f"/home/mgba/src/{build_directory}")
elif platform.system() == "Darwin":
    path_to_mgba_root = Path("./mgba-src").absolute()
    path_to_mgba_build = Path("./mgba-src/build").absolute()
else:
    raise RuntimeError("Unsupported platform: " + platform.system())
