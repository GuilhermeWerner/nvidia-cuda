#include <stdio.h>
#include <unistd.h>

__global__ void printNumber(int number)
{
    printf("%d\n", number);
}

int main()
{
    for (int i = 0; i < 5; ++i)
    {
        cudaStream_t stream;                 // CUDA streams are of type `cudaStream_t`.
        cudaStreamCreate(&stream);           // Note that a pointer must be passed to `cudaCreateStream`.
        printNumber<<<1, 2, 0, stream>>>(i); // `stream` is passed as 4th EC argument.
        cudaStreamDestroy(stream);
    }
    cudaDeviceSynchronize();
}
