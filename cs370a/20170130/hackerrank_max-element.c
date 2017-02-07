#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
    int count;
    scanf("%i", &count);

    for(int i=0; i<count; i++){
        int arr[count];
        int stackTop = 0;
        int cmd;
        scanf("%i", &cmd);
        if(cmd == 1){
            int num;
            scanf("%i", &num);
            arr[stackTop] = num;
            stackTop = stackTop + 1;
            printf("\n%i - %i", cmd, num);
        }else{
            printf("\n%i", cmd);
        }
    }
    return 0;
}


int main() {
    int count;
    scanf("%i", &count);

    for(int i=0; i<count; i++){
        int arr[count];
        int stackTop = 0;
        int cmd;
        int num;
        int topNum;
        scanf("%i", &cmd);
        switch(cmd){
            case 1://add element
                scanf("%i", &num);
                arr[stackTop] = num;
                stackTop = stackTop + 1;
                break;
            case 2://delete top
                stackTop = stackTop - 1;
                break;
            case 3://print top
                printf("%i", arr[stackTop-1]);
                break;
        }
    }
    return 0;
}
