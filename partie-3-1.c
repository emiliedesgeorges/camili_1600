#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){

    int val1, val2, a;
    printf("Entrez le premier matricule: \n");
    scanf("%d", &val1);
    printf("Entrez le seconde matricule: \n");
    scanf("%d", &val2);

    a = ((val1 + val2) % 13) + 3;
    
    // remplace les boucles dans le code asm qui determinent si le chiffre est 3, impair et divisible par 3
    if((a % 3 == 0) && (a != 3) && (a % 2 != 0)){
        printf("le chiffre est impair, divisible par 3, mais n'est pas 3 ");
    }
    printf("le chiffre n'est pas impair et divisible par 3");
    return 0;
}
