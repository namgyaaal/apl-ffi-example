#ifndef __MAIN__H_
#define __MAIN__H_

extern int side_effect;

void print();
void print_str(const char *str);
void call_with_side_effects();
int get_side_effects();
int call_with_input(int);

typedef struct BasicStruct
{
	int a;
	int b;
} BasicStruct;

typedef struct Matryoshka
{
	BasicStruct a;
	BasicStruct b;
} Matryoshka;

int add_struct(BasicStruct);
int add_structs(unsigned, BasicStruct *);

BasicStruct *get_new_struct(int, int);
void print_struct(BasicStruct *);
void free_struct(BasicStruct *);

void crash();

int add_matryoshka(Matryoshka);

void print_array(int *test);

#endif
