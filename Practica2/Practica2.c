#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

/**
 * Metodo para obtener la media aritmetica de un arreglo de float's
 */
float media_aritmetica(float datos[], int n){
  float total =0;
  for(int i = 0; i < n; i++){
    total = total + datos[i];
  }
  return total / n;
}

/**
 * Metodo para obtener la media armonica de un arreglo de float's
 */
float media_armonica(float datos[], int n){
  float total = 0;
  for(int i = 0;  i < n; i++){
    total = total + 1/datos[i];
  }
  return n/total;
}

/**
 * Metodo para obtener la media geometrica de un arreglo de float's
 */
float media_geometrica(float datos[], int n){
  float total = 1;
  float supp = 1.0 / (float)n;
  for(int i = 0; i < n; i++){
    total = total * datos[i];
  }
  return pow(total, supp);
}

/**
 * Metodo para facilitar  la selección de la media a usar y el switch case
 * A = 0;
 * H = 2;
 * G = 3
 * 0 si no se puede usar;
 */
int escoger_operacion(char *var){
  if(strcmp(var, "A") == 0){
    printf("Obtenido %c\n", *var);
    return 1;
  }
  if(strcmp(var, "H") == 0){
    printf("Obtenido %c\n", *var);
    return 2;
  }
  if(strcmp(var, "G") == 0){
    printf("Obtenido %c\n",*var);
    return 3;
  }
  printf("Obtenido %c\n", *var);
  return 0;
  
}

/**
 * Metodo main
 */
int main(int argc, char *argv[]){
  if(argc < 3){
    printf("Formato erroneo. %d argumentos\n",  argc);
    return 0;    
  }
  int i;
  char *op = argv[1];
  float values[argc - 2];
  for(i = 2; i < argc; i++){
    values[i-2] =  atof(argv[i]);
  }
  // 1 = A, 2 = H, 3 = G, def = 0
  switch(escoger_operacion(op)){
  case 1:
    printf("%f\n" ,media_aritmetica(values, argc-2));
    break;
  case 2:
    printf("%f\n" ,media_armonica(values, argc-2));
    break;
  case 3:
    printf("%f\n" ,media_geometrica(values, argc-2));
    break;  
}
}
