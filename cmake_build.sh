#---Definitions---#
CMAKE_SOURCE_DIR=$(realpath .)
CMAKE_BINARY_DIR=${CMAKE_SOURCE_DIR}/out/build
CMAKE_INSTALL_PREFIX=${CMAKE_SOURCE_DIR}/out

#---Create & change to build directory---#
rm -Rf ${CMAKE_BINARY_DIR}
mkdir -p ${CMAKE_BINARY_DIR}
cd ${CMAKE_BINARY_DIR}

#---Configure the project & generate a native build system---#
cmake												\
	-DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}	\
	${CMAKE_SOURCE_DIR}

#---Change to source directory---#
cd ${CMAKE_SOURCE_DIR}

#---Build the "install" target using the native build system---#
cmake --build ${CMAKE_BINARY_DIR} --target install

