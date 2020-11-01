#---Add the executable----#
add_executable(my_app
	./src/main.c
)

#---Specify the install rules---#
install(TARGETS my_app DESTINATION bin)

