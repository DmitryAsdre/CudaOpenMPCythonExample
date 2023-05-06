#include <stdio.h>
#include <math.h>

void __global__ kernel_add_one(int * a, int length) {
    int gid = threadIdx.x + blockDim.x*blockIdx.x;

    while(gid < length) {
    	a[gid] += 1;
        gid += blockDim.x*gridDim.x;
    }
}

void __global__ kernel_sum_sin(float * data, int length, float * res_sum){
    int gid = threadIdx.x + blockDim.x*blockIdx.x;

    while(gid < length){
        //for(int j = 0; j < length; j++){
        //    atomicAdd(res_sum, sin(data[gid])*cos(data[j]));
        //}
        atomicAdd(res_sum, sin(data[gid]));
        gid += blockDim.x*gridDim.x;
    }
}