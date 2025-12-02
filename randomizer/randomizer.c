#include <stdio.h>
#include <time.h>
#include <stdlib.h>


const char *languages[] = {"Haskell", "Java", "Kotlin", "Ruby", "Typescript (NodeJS)", "Python", "Rust", "Zig", "Gleam"};

int main(void){

	srand(time(NULL));

	const char *language = languages[rand() % 8];

	printf("This Advent Of Code should be done using: %s", language);

	return 0;
}

