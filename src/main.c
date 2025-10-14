#include "main.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int side_effect = 1;

void print()
{
	printf("Side Effect: %d\n", side_effect);
}

void print_str(const char *str)
{
	printf("%s %lu\n", str, strlen(str));
}

void call_with_side_effects()
{
	side_effect++;
}

int get_side_effects()
{
	return side_effect;
}

int call_with_input(int arg)
{
	return side_effect * arg;
}

int add_struct(BasicStruct obj)
{
	return obj.a + obj.b;
}

int add_structs(unsigned len, BasicStruct *objs)
{
	int sum = 0;
	for (int i = 0; i < len; ++i)
	{
		sum += objs[i].a + objs[i].b;
	}
	return sum;
}

BasicStruct *get_new_struct(int a, int b)
{
	BasicStruct *obj = (BasicStruct *)malloc(sizeof(BasicStruct));
	obj->a = a;
	obj->b = b;
	return obj;
}

void print_struct(BasicStruct *obj)
{
	printf("a: %d b: %d\n", obj->a, obj->b);
}

void free_struct(BasicStruct *obj)
{
	free(obj);
}

void crash()
{
	int *p = NULL;
	*p = 42;
}

int add_matryoshka(Matryoshka m)
{
	return m.a.a + m.a.b + m.b.a + m.b.b;
}

void takes_fn(void (*fn)(void))
{
	fn();
}

void print_array(int *test)
{
	// Need to also pass length!!

	for (int i = 0; i < 6; i++)
	{
		printf("Array: %d\n", test[i]);
	}
}