#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main() {
    int matricule1 = 2214718;
    int matricule2 = 2214742;
    int a = 3 + ((matricule1 + matricule2) % 13);
    int i = a;
    int sum1 = a;
    int weight = 1;
    //équivalent de terme1
    while (i != 0){
        i -= weight;
        sum1 += i;
    }
    //équivalent de temp
    int j = a;
    int sum2 = a * a;
    //équivalent de terme2
    while (j != 0){
        j -= weight;
        sum2 += (j * j);
    }
    //équivalent de fin
    printf("sum1 = %d\n", sum1);
    printf("sum2 = %d\n", sum2); 
    sum1 = (sum1 * sum1) - sum2;
    int result = sum1;
    printf("resultat = %d\n", result);
}