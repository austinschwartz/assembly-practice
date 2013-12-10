#include <stdio.h>
#include <stdlib.h>
extern int addarray(int n, int* a);
main()
{
        int n;
        int i;
        int * a;

        printf("How many elements in array? ");
        scanf("%d",&n);
        a = (int*) malloc(n*sizeof(int));
  	
	for (i = 0; i < n; i++) {
                printf("a[%d]= ", i);
		scanf("%d", &a[i]);
        }

        int m = addarray(n, a);
	printf("sum=%d\n", m);
}

