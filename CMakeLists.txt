#---Check the cmake version---#
cmake_minimum_required(VERSION 3.13.5 FATAL_ERROR)

#---Set the name & version for the project---#
project(my_project
	VERSION
		0.0.0.0
	LANGUAGES
		C
)

#---Specify the standard---//
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

#---Add the generic compilation options---#
if(FALSE
	OR (CMAKE_C_COMPILER_ID STREQUAL "GNU")
	OR (CMAKE_C_COMPILER_ID STREQUAL "Clang")
	OR (CMAKE_C_COMPILER_ID STREQUAL "AppleClang")
	)
	add_compile_options(-Wall -Werror)
elseif(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
	add_compile_options(/W3 /WX)
else()
	message(FATAL_ERROR "generic compilation options are missing for the \"${CMAKE_C_COMPILER_ID}\" compiler")
endif()

#---Add the subdirectories---#
add_subdirectory(app)
