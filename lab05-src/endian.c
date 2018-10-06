#include <stdio.h>

int isLittleEndian() {
	int a = 0x05;
	char* p = (char*) &a;
	if (*p==0x05) return 1;
	return 0;
}

int main() {
	if (isLittleEndian()) {
		printf("little\n");
	} else {
			printf("big\n");
	}
}
