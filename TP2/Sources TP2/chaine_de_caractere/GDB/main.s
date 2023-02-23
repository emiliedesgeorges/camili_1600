.data
strings:
.asciz "Allo Hi"
num:
.asciz "Allo"
den:
.asciz "Hi"
.text
.globl main


main : 
push %ebp
mov %esp,%ebp
push %ebx           #garder ebx dans stack avant de le mettre à zéro

mask:
xor %eax, %eax        #mettre les registres à zéro  
xor %ecx, %ecx
xor %ebx, %ebx

setup:
movl $strings, %esi     #mettre string dans esi

n_c:
lodsb        #mettre esi dans al car byte, on ajoute une lettre à la fois

d:              
cmp $0x20, %al        #regarder si al (esi(string)) = a un espace et si oui veut dire qu'on est rendu au 2e mot
je n_c2           #aller au 2e mot
cmp $0x41, %al     #si plus petit que A, passe au prochain mot pck veut dire que pas une lettre
jb n_c2
cmp $0x5A, %al    #si plus petit que Z, additioner la valeur car c'est un lettre
jbe a    #-------jb a -> jbe a | car on veut inclure Z
#cmp $0x61, %al      #si plus petit que a et pas dans l'interval d'avant (A-Z), aller au prochain mot car c'est pas une lettre
jb n_c2
cmp $0x7A, %al      #si plus petit que z, additioner car c'est une lettre minuscule.
jbe a

a:       
addl %eax, %ecx   #additioner les valeurs ascii des lettres du mot dans ecx
jmp n_c          #retourner à n_c pour regarder le reste du mot

n_c2:
lodsb   #iterer dans mot

d2:
cmp $0,%al    #comparer avec null pour voir si mot est finit
jz r              
cmp $0x41, %al  #same que d
jb n_c2
cmp $0x5A, %al
jb a_2
cmp $0x61, %al
jb n_c2
cmp $0x7A, %al 
jbe a_2

a_2:
addl %eax, %ebx
jmp n_c2

r:
movl %ecx, %eax    #somme mot 1 dans eax somme mot 2 dans ebx
xchg %eax, %ebx          #switcher a et b
divl %ebx      #division de a par b et met resultat dans eax
cmp $0x00, %eax    #a = 0
jmp e_n          #echanger de place
je e_d              
             

e_n:
push $num
call printf
 
jmp bye

e_d:
push $den
call printf


bye:
popl %ebx
popl %ebp
ret



