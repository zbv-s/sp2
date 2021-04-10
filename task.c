#include <stdio.h>
#include <stdint.h>
#define N 10

int8_t C[N] = {-1, 2, 3, -4, -5, 6, -7, 8, 9, -10};
int32_t SumPosBytes(const int8_t *C, int8_t size_C, int st_pos, int nd_pos)
{
        int32_t sum = 0;  
        for (int8_t i = 0; i < size_C; i++) 
        {
                if ((C[i] > 0) && (C[i] > st_pos) && (C[i] < nd_pos))
                {
                        if (INT32_MAX - C[i] < sum)
                        { 
                                perror("overflow");
                                return -1;
                        }
                        sum += C[i];
                }
        }
        return sum;
}

int main()
{
        int A = 0;
        int B = 9;
        printf("%d\n", SumPosBytes(C, N, A, B));
        return 0;
}

