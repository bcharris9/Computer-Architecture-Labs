#include <stdio.h>

extern long long int test();
extern long long int lab02b();
extern void lab02c(long long int a);
extern long long int lab02d(long long int a);

int main(void)
{
//test();
//lab02b();
//lab02c(69);
Long long int z = lab02d(69);    //input 69 into lab02d
printf("Result is 0x%llx\n", z); //prints result
    return 0;
}
