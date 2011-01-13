////////////////////////////////////////////////////////////////////////////////
// 
// Alan Reiner
// 05 Jan, 2010
// 
//
// Some very simple code for generating fractals using CUDA
// Some code is intentionally left inefficient because simplicity was more
// important.  This might be a good playground for testing various optimization
// techniques
//
////////////////////////////////////////////////////////////////////////////////
#ifndef _FRACTAL_KERNEL_H_CU_
#define _FRACTAL_KERNEL_H_CU_

#define VALUE double

#include <iostream>
#include "cudaConvUtilities.h.cu"

__device__ inline void IFS(VALUE & znplus1Re,
                           VALUE & znplus1Im,
                           VALUE const & znRe,
                           VALUE const & znIm,
                           VALUE const & cRe,
                           VALUE const & cIm);


// Separating out into a separate function really isn't necessary...
__device__ inline int MandlebrotIterator( VALUE const & cRe, 
                                          VALUE const & cIm,
                                          int   const & timeMaxEsc);
                                     

__global__ void GenerateMandlebrotTile( 
                                     VALUE* devOutPtr,
                                     // TODO:  a lot of params, maybe const mem?
                                     int    nTileRows,
                                     int    nTileCols,
                                     VALUE  tileMinRe,
                                     VALUE  tileMinIm,
                                     VALUE  tileStepRe,
                                     VALUE  tileStepIm,
                                     int    iterMaxEsc);

__global__ void GenerateJuliaTile( 
                                     VALUE *devOutPtr,
                                     VALUE cRe,
                                     VALUE cIm,
                                     // TODO:  a lot of params, maybe const mem?
                                     int    nTileRows,
                                     int    nTileCols,
                                     VALUE  tileMinRe,
                                     VALUE  tileMinIm,
                                     VALUE  tileStepRe,
                                     VALUE  tileStepIm,
                                     int    iterMaxEsc);
                                    
// This is a completely failed attempt at producing cool 3D mandlebrot
// This should probably be ignored
__global__ void GenerateFractalTile3D( VALUE* devOutPtr,
                                     // TODO:  a lot of params, maybe const mem?
                                     int    nTileRows,
                                     int    nTileCols,
                                     VALUE  tileMinRe,
                                     VALUE  tileMinIm,
                                     VALUE  tileStepRe,
                                     VALUE  tileStepIm,
                                     int    iterMaxEsc);


#endif