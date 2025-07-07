
#include "common.h"

__kernel void vecadd (__global const TYPE *A,
	                    __global const TYPE *B,
	                    __global TYPE *C)
{
  int gid = get_global_id(0);
  // printf("[%d] A is %d, and B is %d\n",gid,A[gid],B[gid]);
  // if ((gid % 4) == 2) printf("[%d] @A 0x%p, @B 0x%p, @C 0x%p\n",gid,&A[gid],&B[gid],&C[gid]);
  C[gid] = A[gid] + B[gid];
}
