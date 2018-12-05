#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>

int main(int argc, char* argv[]){

    if (argc != 2) {
        printf("unknown error \n");
    } else {
            int num;

        // make sure user enter a number
        if (num = atoi(argv[1] ) ) {
            srand(time(NULL));
            printf("From 1 to %d\n", num);
            printf("Number is %d\n",(rand() % num) +1);

        } else {
            printf("please enter a value");
        }
    }

    return 0;
}
