#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char **argv){
	char buffer[256];
	printf("I am Olympus! Make me fall..\n");
	if(argc != 2) {
		printf("Usage: ./olympus.exe <your poison>\n");
		exit(0);
	}
	strcpy(buffer, argv[1]);
	printf("%s\n", buffer);
	return 0;
}
