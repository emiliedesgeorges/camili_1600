.data
etiquette1:
.int 1
n:
.long 4
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
xor %edx, %edx

#mov 12(%esp), $n
movl $n, %eax 
movl $n, %ecx 
jmp resultat

denominateur_commun:
sub $1, %ecx 
mul %ecx
cmp $0, %ecx
je numerateur
jmp denominateur_commun

numerateur:

division:

resultat:
pushl $n
pushl $formattedString
call printf
addl $8, %esp

popl %ebx
popl %ebp
ret
