#include <stdio.h>
extern int addarray(int n, int * array);

int main() {
    int a[5] = {5, 4, 3, 2, 1};
    printf("%d\n", addarray(5, a));
}
