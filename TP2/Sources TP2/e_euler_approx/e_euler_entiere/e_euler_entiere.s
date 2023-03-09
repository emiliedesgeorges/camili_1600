.data
etiquette_un:
.int 1
somme:
.long 0
formattedString:
.ascii "%d"
.text
.globl e_euler_entiere


e_euler_entiere:
 
pushl %ebp
movl %esp,%ebp
pushl %ebx

mask:
xor %eax, %eax          
xor %ecx, %ecx
xor %ebx, %ebx
xor %esi, %esi


##prendre le n passé en paramètre dans le script en C
movl 12(%esp), %esi
jmp division_zero


##mettre le resultat de 1 divisé par 0! dans eax qui save le résultat de la division précédente
division_zero:
movl etiquette_un, %eax
addl %eax, %ebx
jmp approximation


approximation:
add $1, %ecx
xor %edx, %edx   #mettre restant a zero car implique dans la division
div %ecx
addl %eax, %ebx
cmp %esi, %ecx
je resultat
jmp approximation


resultat:
movl %ebx, %eax
popl %ebx
popl %ebp
ret
