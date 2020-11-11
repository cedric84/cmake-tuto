@echo off

REM ---Set the PATH---
set PATH=%MINGW_HOME%\bin;%CMAKE_HOME%\bin;%PATH%

REM ---Definitions---
set CMAKE_SOURCE_DIR=%~dp0
set CMAKE_BINARY_DIR=%CMAKE_SOURCE_DIR%out\build
set CMAKE_INSTALL_PREFIX=%CMAKE_SOURCE_DIR%out\install

REM ---Create & change to build directory---
cmake -E remove_directory %CMAKE_BINARY_DIR%
cmake -E make_directory %CMAKE_BINARY_DIR%
cd %CMAKE_BINARY_DIR%

REM ---Configure the project & generate a native build system---
cmake															^
	-G"MinGW Makefiles"											^
	-DCMAKE_INSTALL_PREFIX=%CMAKE_INSTALL_PREFIX%				^
	%CMAKE_SOURCE_DIR%
if %ERRORLEVEL% NEQ 0 (
	cd %CMAKE_SOURCE_DIR%
	EXIT /B 1
)

REM ---Change to source directory---
cd %CMAKE_SOURCE_DIR%

REM ---Build the "install" target using the native build system---
cmake --build %CMAKE_BINARY_DIR% --target install
if %ERRORLEVEL% NEQ 0 (
	cd %CMAKE_SOURCE_DIR%
	EXIT /B 1
)
