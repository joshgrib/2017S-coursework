#include <iostream>
#include <stdio.h>
using namespace std;

int main() {

    // your code here
    int count, divisor, input, divCount = 0;
    scanf("%i %i", &count, &divisor);
    for(int i=0; i<count; i++){
        scanf("%i", &input);
        if(input % divisor == 0){
            divCount++;
        }
    }
    cout << divCount << endl;

    return 0;
}
