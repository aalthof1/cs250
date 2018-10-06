
int myprintf(const char * format, ...) {
	
	char* ptr = (char*)format;
	int* arg_ptr = (int*)(&format+1);

	for(; *ptr != '\0'; ptr++) {
		if(*ptr == '%') {
			if(*(ptr+1) == '%') {
				putchar('%');
			}
			else if(*(ptr+1) == 'c') {
				putchar(*arg_ptr);
				arg_ptr++;
			}
			else if(*(ptr+1) == 's') {
				char* temp = (char*)*arg_ptr;
				for(; *(temp) != '\0'; temp++) {
					putchar(*temp);
				}
				arg_ptr++;
			}
			else if(*(ptr+1) == 'x') {
				int i = *arg_ptr;
				printx(i);
				arg_ptr++;
			}
			else if(*(ptr+1) == 'd') {
				int i = *arg_ptr;
				printd(i);
				arg_ptr++;
			}
			else {
				return -1;
			}
			ptr++; 
		}
		else {
			putchar(*ptr);
		}	
	}

	return 0;

}
