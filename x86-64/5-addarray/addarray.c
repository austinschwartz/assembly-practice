int addarray(int n, int* array) {
     int i = 0;
     int sum = 0;
     for (i = 0; i < n; i++)
         sum += array[i];
     return sum;
}
