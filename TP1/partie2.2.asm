.text
ld a
st var1
st var2
temp:
ld var1
sub b
st var1
brz divisible
ld var2
sub weight
st var2
brz fin
br temp
divisible:
ld weight
st resultat
fin:
stop
.data
a: 5
b: 1
var1: 0
var2: 0
weight: 1
resultat: 0