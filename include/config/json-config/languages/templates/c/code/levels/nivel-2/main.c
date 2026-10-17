#include <stdio.h>

int main(void) {
  char nombre[50];

  printf("¿Cómo te llamas? ");
  if (fgets(nombre, sizeof nombre, stdin) != NULL) {
    printf("Hola, %s", nombre);
  }
  return 0;
}
