//******************************************************************************
// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <cuda_fp16.h>
#include <cuda_bf16.h>

#include "elementOps.h"
#include "kernelHelpers.h"

//==============================================================================
// vector ops
__device__ inline float4 operator +(const float4& l, const float4& r) {
    return make_float4(l.x + r.x, l.y + r.y, l.z + r.z, l.w + r.w);
}
  
__device__ inline double4 operator +(const double4& l, const double4& r) {
    return make_double4(l.x + r.x, l.y + r.y, l.z + r.z, l.w + r.w);
}

//------------------------------------------------------------------------------
// add
template<typename T>
__global__ void add(const void *va, const void *vb, void *vc, unsigned count) {
    const T* a = (T*)va; const T* b = (T*)vb; T* c = (T*)vc;
    GRID_STRIDE_LOOP(i, count) {
        c[i] = a[i] + b[i];
    }
}

// __global__ void add_bfloat16(const void *va, const void *vb, void *vc, unsigned count) {
//     const __nv_bfloat162* a = (__nv_bfloat162*)va; 
//     const __nv_bfloat162* b = (__nv_bfloat162*)vb; 
//     __nv_bfloat162* c = (__nv_bfloat162*)vc;
//     GRID_STRIDE_LOOP(i, count) {
//         c[i] = a[i] + b[i];
//     }
// }

//------------------------------------------------------------------------------
// Swift importable C functions
cudaError_t srtAdd(
    cudaDataType_t type, 
    const void *a,
    long countA, 
    const void *b, 
    long countB, 
    void *c,
    long countC, 
    cudaStream_t stream
) {
    // make sure sizes fit within Cuda limitations
    assert(countA > 0 && countA <= INT32_MAX &&
        countB > 0 && countB <= INT32_MAX &&
        countC > 0 && countC <= INT32_MAX);

    KernelPreCheck(stream);
    unsigned blocks = BLOCK_COUNT(countC);
    unsigned threads = THREADS_PER_BLOCK;
    switch(type) {
        // case CUDA_R_8I: add<char> <<<blocks, threads, 0, stream>>>(a, b, c, countC); break;
        // case CUDA_R_8U: add<unsigned char> <<<blocks, threads, 0, stream>>>(a, b, c, countC); break;
        // case CUDA_R_16I: add<short> <<<blocks, threads, 0, stream>>>(a, b, c, countC); break;
        // case CUDA_R_16U: add<unsigned short> <<<blocks, threads, 0, stream>>>(a, b, c, countC); break;

        case CUDA_R_16F: {
            int count = shiftDownRoundingUp(countC, 1);
            add<__half2><<<BLOCK_COUNT(count), threads, 0, stream>>>(a, b, c, count);
            break;
        }
        // case CUDA_R_16BF: {
        //     int count = shiftDownRoundingUp(countC, 1);
        //     add_bfloat16<<<BLOCK_COUNT(count), threads, 0, stream>>>(a, b, c, count);
        //     break;
        // }
        case CUDA_R_32F: {
            int count = shiftDownRoundingUp(countC, 2);
            add<float4><<<BLOCK_COUNT(count), threads, 0, stream>>>(a, b, c, count);
            break;
        }
        case CUDA_R_64F: {
            int count = shiftDownRoundingUp(countC, 2);
            add<double4><<<BLOCK_COUNT(count), threads, 0, stream>>>(a, b, c, count);
            break;
        }
        default: printf("cudaDataType_t not implemented"); assert(false);
    }
    return KernelPostCheck(stream);
}

//------------------------------------------------------------------------------
cudaError_t srtAddStrided(
    cudaDataType_t type,
    long dims,
    const void *a,
    const long* stridesA, 
    const void *b, 
    const long* stridesB, 
    void *c,
    const long* stridesC, 
    cudaStream_t stream
) {
    return cudaSuccess;
}
