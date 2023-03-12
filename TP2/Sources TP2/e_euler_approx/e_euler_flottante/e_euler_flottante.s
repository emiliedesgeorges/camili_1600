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

##initialisation des valeurs pour la factiorielle zero
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
flds factorial_value
fdivrp
flds e 
faddp
fstps e 

##notre compteur
sub $1, %esi 
cmp $0, %esi
je resultat

##preparation pour la prochaine iteration
incremente_facto_value:
flds factorial_value
flds one
faddp
fstps factorial_value
jmp valeur_facto

resultat:
movl e, %eax

pop %ebx
pop %ebp
ret
