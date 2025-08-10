#include <iostream>
#include <chrono>
#include <vector>

extern unsigned int x;
#define MATRIX_DIM0 4096
#define FOR(IDX, START, N, INC) for(unsigned int IDX = 0 ;  IDX < N ;IDX = IDX + INC)

typedef double matType;

matType A[MATRIX_DIM0][MATRIX_DIM0];
matType B[MATRIX_DIM0][MATRIX_DIM0];
matType C[MATRIX_DIM0][MATRIX_DIM0];

void init(){
FOR(i, 0, MATRIX_DIM0, 1){
    FOR(j, 0, MATRIX_DIM0, 1){
        A[i][j] = 1;
        B[i][j] = 1;
    }
}
}

void matmul(){
FOR(i, 0, MATRIX_DIM0, 1){
    FOR(j, 0, MATRIX_DIM0, 1){
        FOR(k, 0, MATRIX_DIM0, 1){
            C[i][j] += A[i][k] * B[k][j];
        }
    }
}
}


int main(){
std::ios_base::sync_with_stdio(false);
init();
auto start = std::chrono::steady_clock::now();
//std::vector<std::vector<matType>> A,B,C;
// Matrix Mul
matmul();
auto end = std::chrono::steady_clock::now();
auto diff = end - start;
std::cout << std::chrono::duration <double, std::milli> (diff).count() << " ms" << std::endl; 
(void)C[x][x];
return 0;
}
