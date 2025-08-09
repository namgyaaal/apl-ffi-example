#ifndef __MAIN__H_ 
#define __MAIN__H_ 

extern int side_effect;

void print();
void print_str(const char *str);
void call_with_side_effects();
int get_side_effects();
int call_with_input(int);

typedef struct BasicStruct {
	int a; 
	int b; 
} BasicStruct;
int add_struct(BasicStruct);
int add_structs(unsigned, BasicStruct*);
#endif 
