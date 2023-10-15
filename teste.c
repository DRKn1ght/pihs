#include <stdio.h>

void Juntar(int vetor[], int ini, int meio, int fim, int vetAux[]) {
    int esq = ini;
    int dir = meio;
    for (int i = ini; i < fim; ++i) {
        printf("%d < %d && %d >= %d || %d < %d\n", esq, meio, dir, fim, vetor[esq], vetor[dir]);
        if ((esq < meio) && ((dir >= fim) || (vetor[esq] < vetor[dir]))) {
            //printf("1\n");
            vetAux[i] = vetor[esq];
            esq++;
        }
        else {
            //printf("0\n");
            vetAux[i] = vetor[dir];
            dir++;
        }
    }

    //copiando o vetor de volta
    for (int i = ini; i < fim; i++) {
        vetor[i] = vetAux[i];
    }
}

void MergeSort(int vetor[], int inicio, int fim, int vetorAux[]) {
    if ((fim - inicio) < 2) return;
    
    int meio = ((inicio + fim)/2);
    
    MergeSort(vetor, inicio, meio, vetorAux);
    MergeSort(vetor, meio, fim, vetorAux);
    //printf("%d\n", meio);
    Juntar(vetor, inicio, meio, fim, vetorAux);
}

int main(){
    int vetor[10] = {9, 8, 2, 6, 5, 4, 3, 7, 1};
    int vetAux[10];
    MergeSort(vetor, 0, 10, vetAux);
    for (int i = 0; i < 10; i++){
        printf("%d ", vetor[i]);
    }
}