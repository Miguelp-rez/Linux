# Proyecto 1: Cifrado César
````
Entrega: 14/04/2019
Hora límite: 23:59
````
## Objetivos
* El alumno aprenderá a crear comandos a partir de shell script 
* El alumno aprenderá a crear un man page.

## Introducción
En criptografía, el cifrado César, también conocido como cifrado por desplazamiento, es una de las técnicas de cifrado más simples y más usadas. Es un tipo de cifrado por sustitución en el que una letra en el texto original es reemplazada por otra que se encuentra un número fijo de posiciones más adelante en el alfabeto. 

**Ejemplo**
Alfabeto: 'A-Za-z'
Desplazamiento: 4
Frase a cifrar: Hay una serpiente en mi bota
Frase cifrada: Lec yre wivtmirxi ir pm fsxe

## Desarrollo
El alumno deberá crear su propio comando para cifrar bash-scripts y debe implementar alguna técnica para que los scripts cifrados puedan ser ejecutados sin necesidad de tener su comando instalado. Además, el alumno deberá escribir el respectivo man page para que otras personas puedan entender perfectamente cómo utilizarlo.

Debe manejar las siguientes banderas:
-e esta opción será utilizada para cifrar
-d esta opción será utilizada para descifrar
-s esta opción permite utilizar un desplazamiento distinto al predeterminado (45)
-a esta opción permite utilizar un alfabeto distinto al predeterminado (ASCII imprimible)

**Consideraciones**
* El desplazamiento debe ser circular, es decir, en caso de llegar al final del alfabeto y que no se haya completado el desplazamiento, deberá continuar al principio del alfabeto.
* El comando debe implementar alguna forma para que los scripts cifrados puedan ser ejecutados de forma usual y sin necesidad de tener el comando instalado.

## Entrega
Agregar su script y el man page en un archivo comprimido al repositorio de GitHub en el directorio correspondiente.
Incluir un README.md para que otras personas puedan instalar su comando y el man page.
Incluir alguna licencia que ampare su trabajo (investigación)

## Punto extra
Se dará un punto extra sobre la calificación de su proyecto si agregan un script que instale su programa.

## En caso de plagio
Los involucrados no tendrán derecho a calificación
