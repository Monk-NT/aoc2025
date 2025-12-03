#include <stdio.h>
#include <time.h>
#include <stdlib.h>


const char *languages[] = {"Haskell", "Java", "Kotlin", "Ruby", "Typescript (NodeJS)", "Python", "Rust", "Zig", "Gleam"};

int main(void){

	srand(time(NULL));

	const char *language = languages[rand() % 9];

	printf("This Advent Of Code should be done using: %s\n", language);

	return 0;
}

