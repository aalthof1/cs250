#include "myprintf.c"

int main() {

	char c = 'e';
	char* s = "this is the string";
	int z = 0;
	int i = 5;
	int b = 1234567890;
	int n = -12;
	int i2 = 45;
	int b2 = 987654321;
	int bn = -12753479;
	int bn2 = -987634543;
	myprintf("c = %c and s = %s. %% is a percent sign.\n", c, s);
	myprintf("HEX: z = %x, i = %x, b = %x, n = %x, i2 = %x, b2 = %x, bn = %x, bn2 = %x\n", z, i, b, n, i2, b2, bn, bn2);
	myprintf("DEC: z = %d, i = %d, b = %d, n = %d, i2 = %d, b2 = %d, bn = %d, bn2 = %d\n", z, i, b, n, i2, b2, bn, bn2);
	myprintf("Mixed: c = %c, s = %s, i = %x, i2 = %d %% is percent\n", c, s, i, i2);






}
