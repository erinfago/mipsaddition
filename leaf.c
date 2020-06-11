#include <stdio.h>


int long_add(int a, int b, int c, int d, int e, int f, int g)
{
  int z = (a-b) + (c-d) + (e-f) + g;
  return z;
}

int main()
{
  int a1 = 100;
  int a2 = 10;
  int a3 = 90;
  int a4 = 9;
  int a5 = 80; 
  int a6 = 8;
  int a7 = 110;
  int a8 = long_add(a1,a2,a3,a4,a5,a6,a7);
  a1 = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8;
  printf("%d\n", a1);
  return 0;

}
