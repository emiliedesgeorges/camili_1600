.data
string1:
.asciz  "chien" 
lenght1:
.int 5
string2:
.asciz  "niche" 
lenght2:
.int 5

.text
.globl anagramme
main:
anagramme: 

## comparer la longueur des mots
mov lenght1, %ebx
mov lenght2, %ecx
cmp %ebx, %ecx
jne longueurDifferentes

mask:
xor %eax, %eax          
xor %ecx, %ecx
xor %ebx, %ebx
xor %edx, %edx

## La somme des lettres divisés par la longueur du mot 
movl $string1, %esi 

n_c:
lodsb
cmp $0x00, %al ##regarder si on est a la fin du mot
je division1
addl %eax, %ecx
jmp n_c

division1:
movl %ecx, %eax
movl lenght1, %ecx
div %ecx
movl %eax, %ecx

movl $string2, %esi

n_c2:
lodsb
cmp $0x00, %al ##regarder si on est a la fin du mot
je division2
addl %eax, %ebx
jmp n_c2

division2:
xor %edx, %edx
movl %ebx, %eax
movl lenght2, %ebx
div %ebx
movl %eax, %ebx

cmp %ebx, %ecx
je estAnagramme
jmp pasAnagramme

longueurDifferentes:
movl $1, %eax
jmp resultat

estAnagramme:
movl $0, %eax
jmp resultat

pasAnagramme:
movl $255, %eax

resultat:
ret
push %eax 
