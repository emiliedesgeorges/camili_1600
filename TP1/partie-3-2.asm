.text
ld n 
sub i
st n
boucle:
ld precedent
shl
st precedent
ld actuel
lda actuel 
add precedent
st futur
sta precedent
ld futur
st actuel
ld n 
sub b
st n
brz fin
br boucle
fin:
ld futur
st result
stop
.data
n: 12
i: 2
b: 1
precedent: 0
actuel: 1
futur: 0
result: 0
