#include <stdio.h>
#include <stdbool.h>

bool isPrime(int n);

int main(){
	for (int i = 0; i <= 100; i++) {
		if (isPrime(i)) {
			printf("%d\n", i);
		}
	}
}

bool isPrime(int n){
	if(n == 0 || n == 1){
		return 0; 
	}
}
