#include <stdlib.h>

char* sub_string(char* in, int start, int end){
	char* res = (char*) malloc(size(char) * (end-start+2));
	int i;
	for(i = 0; i <(end-start+2); i++)
		res[i] = in[start-1+i];
	res[end-start+1] = '\0';
	return res;
}
