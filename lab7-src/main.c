#include <stdlib.h>
#include <stdio.h>

int main() {
	int start, end;
	char* in = (char*) malloc(sizeof(char) * 50);
	printf("Enter the string: ");
	scanf("%s", in);
	printf("Enter the start index: ");
	scanf("%d", &start);
	printf("Enter the end index: ");
	scanf("%d", &end);
	char* res = (char*)sub_string(in, start, end);
	printf("The substring of the given string is '%s'\n");
	return 0;
}
