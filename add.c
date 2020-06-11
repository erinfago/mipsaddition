#include <stdio.h>
#include <stdlib.h>
/*
 * two 3x3 matrix
 * 1D array of signed ints on the stack
 */

#define AR_LEN 9
int tot;
int main()
{
  /* declare the arrays*/
  int ar1[AR_LEN];
  int ar2[AR_LEN];
  int k, j, m, n, i;

  /* define the arrays*/
  for(k=0; k<AR_LEN; k++)
  {
    ar1[k] = k;
    ar2[k] = k;
  }


  /* print out each array to see contents*/
  for(j=0; j<AR_LEN; j++)
  {
    printf("array 1: %d \n", ar1[j]);
  }


  for(m=0; m<AR_LEN; m++)
  {
    printf("array 2: %d \n", ar1[m]);
  }

  /* add the arrays together and store in first array*/
  for(i=0; i<AR_LEN; i++)
  {
    tot = ar1[i] + ar2[i];
    ar1[i]= tot;
  }

  
  /* print out array1 that now contains the sum of the two arrays*/
  for(n=0; n<AR_LEN; n++)
  {
    printf("array 1 + 2: %d \n", ar1[n]);
  }

  return 0;
}
