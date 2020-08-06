//******************************************************************************
// Copyright 2020 Google LLC
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
#ifndef asmdOps_h
#define asmdOps_h

#include "kernelHelpers.h"


// make visible to Swift as C API
#ifdef __cplusplus
extern "C" {
#endif

//==============================================================================
//
cudaError_t srtAdd(
    cudaDataType_t type, 
    const void *a, long strideA, 
    const void *b, long strideB,
    void *c, long count, 
    cudaStream_t stream
);

cudaError_t srtAddFullyStrided(
    cudaDataType_t type,
    long dims,
    const void *a,
    const int* stridesA, 
    const void *b, 
    const int* stridesB, 
    void *c,
    const int* stridesC, 
    cudaStream_t stream
);

//==============================================================================
#ifdef __cplusplus
}
#endif

#endif // asmdOps_h