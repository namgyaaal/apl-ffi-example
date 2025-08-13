#!/usr/bin/env /usr/local/bin/dyalogscript 

⎕IO ← 0 
⎕ ← 'Testing dynamic library calling'

dylib ← './build/libbasic.dylib|'


fns ← ⍬ 
fns ,← ⊂ ' ' 'print' ' ' 
fns ,← ⊂ ' '  'call_with_side_effects' ' '
fns ,← ⊂ 'I4 ' 'get_side_effects'       ' ' 
fns ,← ⊂'I4 ' 'call_with_input'        ' I4'
fns ,← ⊂'I4 ' 'add_struct' ' {I4 I4}' 
fns ,← ⊂' ' 'print_str' ' <0T1[]' 
fns ,← ⊂'I4 ' 'add_structs ' 'U <{I4 I4}[]'
fns ,← ⊂'P ' 'get_new_struct' ' I4 I4'
fns ,← ⊂' ' 'print_struct' ' P'
fns ,← ⊂' ' 'free_struct' ' P' 
fns ,← ⊂' ' 'crash' ' '
fns ,← ⊂'I4 ' 'add_matryoshka' ' {{I4 I4} {I4 I4}}' 

fns ← {∊ ¯1⌽dylib, 1⌽⍵} ¨fns
⎕NA ¨fns

call_with_side_effects
⎕ ← get_side_effects 
⎕ ← call_with_input 10 
⎕ ← add_struct ⊂ (15 get_side_effects)
print⍬
print_str ⊂'hello world!'

structs ← (1 2) (3 4) (5 6) (7 8)
⎕ ← add_structs (≢structs),⊂structs 


⍝ Sanitizing input choice 1: Flooring 
⎕ ← call_with_input ⌊10.5

⍝ Sanitizing input choice 2: 
⍝    Some sort of error guard? 
fn_call_with ← {
    ⍝ 11 is a domain error 
    11::'Call with expects an integer'
    call_with_input ⍵
}

⎕ ← fn_call_with 10.5

⍝ Do other stuff afterwards 
print_str ⊂'stuff afterwards:'

⍝ Pointer logic 
⎕ ← 'Struct with B as side effect'
struct ← (get_new_struct 4 get_side_effects)
⎕ ← 'Pointer to struct: ', struct
print_struct struct

⍝ Free it 
free_struct struct

⎕ ← 'What happens when you access a dangling pointer?'
print_struct struct 


⍝ Don't uncomment this -- this will crash the script 
⍝ crash⍬

⎕ ← add_matryoshka ⊂ ((1 2) (3 4))

