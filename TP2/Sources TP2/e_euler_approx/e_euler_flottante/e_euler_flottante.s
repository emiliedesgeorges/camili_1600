.data
iteration:
.int 3
iteration_FPU:  
.float 3      
factorial_value:
.float 0
factorial:
.float 0
e:
.float 0
reset:
.float 0
one:
.float 1
.text
.globl e_euler_flottante

e_euler_flottante:

push %ebp               
mov %esp,%ebp
push %ebx

mov iteration, %esi

facto_zero:
flds one 
fstps factorial_value 

flds one 
fstps e

flds one
fstps factorial

valeur_facto:
flds factorial
flds factorial_value
fmulp
fstps factorial

valeur_e:
flds one
flds factorial
fdivrp
flds e 
faddp
fstps e 

sub $1, %esi 
cmp $0, %esi
je resultat

incremente_facto_value:
flds factorial_value
flds one
faddp
fstps factorial_value
jmp valeur_facto

resultat:
flds e 
pop %ebx
pop %ebp
ret
