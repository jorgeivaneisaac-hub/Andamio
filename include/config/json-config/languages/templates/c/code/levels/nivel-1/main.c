// ============================================================================
//  Tu primer programa en C: "Hola mundo"
// ============================================================================
//
//  Qué hace: escribe "hola mundo" en pantalla y termina. Nada más.
//
//  ¡Bienvenido! Este es el programa más pequeño que puedes escribir, y ya es
//  un programa de verdad. C es un lenguaje muy usado: con él se hacen
//  videojuegos, sistemas operativos, aplicaciones y mucho más. Y empezar es
//  más sencillo de lo que parece.
//
//  Andamio ya preparó las carpetas y la configuración por ti. Solo tienes que
//  escribir en este archivo (main.c) y usar los comandos del final para
//  probarlo.
//
//  Cómo leer este archivo:
//    - Las líneas que empiezan con // son notas. La computadora las ignora,
//      así que son solo para ti.
//    - Cuando ya no las necesites, puedes borrarlas.
//    - No hace falta memorizar nada. Léelo con calma y prueba cosas.
// ----------------------------------------------------------------------------

// 1) Pedir ayuda a otros -----------------------------------------------------
// Nadie escribe todo desde cero. Esta línea le dice a C: "tráeme las
// herramientas para mostrar cosas en pantalla". Esas herramientas ya las
// escribió alguien más, y tú solo las usas.
#include <stdio.h>

// 2) Aquí empieza tu programa ------------------------------------------------
// Todo programa en C arranca en un lugar llamado main ("principal"). Piensa
// en él como la puerta de entrada: la computadora entra por aquí y sigue las
// instrucciones de arriba hacia abajo.
//
// Lo que va entre llaves { } es lo que el programa hará, en orden.
// Por ahora escríbelo tal cual; con el tiempo entenderás cada palabra.
int main(void) {
  // 3) Tus instrucciones -----------------------------------------------------
  // printf significa "imprimir": muestra un texto en pantalla. El texto va
  // entre comillas. El \n al final equivale a pulsar Enter, para que lo
  // siguiente que se escriba aparezca en una línea nueva.
  // Cada instrucción termina con un punto y coma (;), como el punto al final
  // de una frase.
  printf("hola mundo\n");

  // Aquí el programa se despide. El 0 quiere decir "todo salió bien".
  return 0;
}

// 4) Probar tu programa ------------------------------------------------------
// Lo que escribiste es texto. Para que la computadora lo pueda ejecutar,
// primero hay que "traducirlo". De eso se encarga el compilador, un programa
// que hace esa traducción por ti. Puedes usar GCC o Clang, el que tengas
// instalado.
//
// Con GCC:
//   Traducir:  gcc src/main.c -o hola
//   Ejecutar:  .\hola        (Windows PowerShell)
//              ./hola        (Linux, macOS o Git Bash)
//
// Con Clang:
//   Traducir:  clang src/main.c -o hola
//   Ejecutar:  .\hola        (Windows PowerShell)
//              ./hola        (Linux, macOS o Git Bash)
//
// Qué dice cada parte del comando:
//   gcc / clang   el traductor (compilador)
//   src/main.c    tu archivo
//   -o hola       "ponle de nombre hola al programa que va a salir"
//
// Traducir y ejecutar de una vez:
//   PowerShell:            gcc src/main.c -o hola; if ($?) { .\hola }
//   Linux/macOS/Git Bash:  gcc src/main.c -o hola && ./hola
//   (con Clang, cambia gcc por clang)
//
// 5) Si algo no sale a la primera ---------------------------------------------
// Es normal, le pasa a todo el mundo, y los mensajes de error suelen decirte
// dónde mirar.
//   - "gcc no se reconoce...": el compilador no está instalado, o la terminal
//     no lo encuentra. Ciérrala y ábrela de nuevo después de instalarlo.
//   - "No such file or directory": estás en otra carpeta o el archivo no
//     está donde dice el comando. Revisa que src/main.c exista.
//   - Un error que menciona ";": casi siempre falta un punto y coma en la
//     línea que indica el mensaje o en la anterior.
//
// 6) Ahora juega tú
// ------------------------------------------------------------ La mejor forma
// de aprender es cambiar cosas y ver qué pasa. No puedes romper nada: si algo
// sale mal, vuelves a escribirlo y ya.
//   a) Cambia "hola mundo" por tu nombre y vuelve a probar.
//   b) Agrega otra línea con otro printf y otro mensaje.
//   c) Quita el \n, prueba de nuevo y mira qué cambia.
//   d) Quita un ; a propósito y lee el error. Entender los errores es una
//      de las mejores habilidades que puedes ganar.
