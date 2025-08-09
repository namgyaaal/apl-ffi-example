#!/usr/bin/env /usr/local/bin/dyalogscript 

⎕IO ← 0 
⎕ ← 'Testing dynamic library calling'

dylib ← './build/libbasic.dylib|'

fn0 ← ' ' 'print' ' ' 
fn1 ← ' '  'call_with_side_effects' ' '
fn2 ← 'I4 ' 'get_side_effects'       ' ' 
fn3 ← 'I4 ' 'call_with_input'        ' I4'
fn4 ← 'I4 ' 'add_struct' ' {I4 I4}' 
fn5 ← ' ' 'print_str' ' <0T1[]' 
fn6 ← 'I4 ' 'add_structs ' 'U <{I4 I4}[]' 

fn_mat ← fn0 fn1 fn2 fn3 fn4 fn5 fn6
⍝ Figure out a way to improve this. 
fn_mat ← {(⊃(⍵[0])), dylib, (⊃(⍵[1])), (⊃(⍵[2]))} ¨fn_mat
⎕NA ¨fn_mat

call_with_side_effects
⎕ ← get_side_effects 
⎕ ← call_with_input 10 
⎕ ← add_struct ⊂ (15 get_side_effects)
print 
print_str ⊂'hello world!'

structs ← (1 2) (3 4) (5 6) (7 8)
⎕ ← add_structs (≢structs),⊂structs
