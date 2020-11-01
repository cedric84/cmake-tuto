#---Check the cmake version---#
cmake_minimum_required(VERSION 3.13)

#---Set the name & version for the project---#
project(my_project VERSION 0.0.0.0)

#---Specify the standard---//
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

#---Add the generic compilation options---#
if(MSVC)
	add_compile_options(/W3 /WX)
else()
	add_compile_options(-Wall -Werror)
endif()

#---Add the subdirectories---#
add_subdirectory(app)

