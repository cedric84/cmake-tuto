import os
import shutil
import pathlib
import subprocess

#---Definitions---#
CMAKE_SOURCE_DIR		= pathlib.Path(".").resolve()
CMAKE_BINARY_DIR		= CMAKE_SOURCE_DIR.joinpath("out").joinpath("build")
CMAKE_INSTALL_PREFIX	= CMAKE_SOURCE_DIR.joinpath("out")

#---Create & change to build directory---#
shutil.rmtree(str(CMAKE_BINARY_DIR), ignore_errors=True)
CMAKE_BINARY_DIR.mkdir(parents=True, exist_ok=True)
os.chdir(str(CMAKE_BINARY_DIR))

#---Configure the project & generate a native build system---#
args	= [
	"cmake",
	"-DCMAKE_INSTALL_PREFIX=" + str(CMAKE_INSTALL_PREFIX),
	str(CMAKE_SOURCE_DIR),
]
subprocess.Popen(args).wait()
del args

#---Change to source directory---#
os.chdir(str(CMAKE_SOURCE_DIR))

#---Build the "install" target using the native build system---#
args	= [
	"cmake",
	"--build",
	str(CMAKE_BINARY_DIR),
	"--target",
	"install"
]
subprocess.Popen(args).wait()
del args

