#include "main.h"
#include <stdio.h>
#include <string.h>
int side_effect = 1;

void print() {
	printf("Side Effect: %d\n", side_effect);
}

void print_str(const char* str) {
	printf("%s %lu\n", str, strlen(str));
}

void call_with_side_effects() {
	side_effect++;
}

int get_side_effects() {
	return side_effect;
}

int call_with_input(int arg) {
	return side_effect * arg;
}

int add_struct(BasicStruct obj) {
	return obj.a + obj.b;
}

int add_structs(unsigned len, BasicStruct *objs) {
	int sum = 0; 
	for(int i = 0; i < len; ++i) {
		sum += objs[i].a + objs[i].b;
	}
	return sum;
}
