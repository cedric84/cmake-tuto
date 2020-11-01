#include <stdlib.h>
#include <stdio.h>

extern int
main(int argc, char* argv[])
{
	printf("%s started\n", __func__);
	printf("%s terminated\n", __func__);
	return EXIT_SUCCESS;
}

