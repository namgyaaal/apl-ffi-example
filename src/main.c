#include "main.h"
#include <stdio.h>

int side_effect = 1;

void call_with_side_effects() {
	side_effect++;
}

int get_side_effects() {
	return side_effect;
}

int call_with_input(int arg) {
	return side_effect * arg;
}
