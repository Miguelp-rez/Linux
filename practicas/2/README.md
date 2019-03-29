# Práctica 2: Manejo de Ramas en Git
````
Entrega: 31/03/2019
Hora límite: 23:59
````
El objetivo de esta práctica es impulsarlos a crear proyectos que se ramifican y combinan a menudo. Las personas que comprenden y dominan las ramas poseen una herramienta única y poderosa, que puede cambiar por completo la forma en que se desarrolla.

## ¿Cómo funcionan?
Para entender realmente cómo se ramifica en Git, debemos dar un paso atrás y examinar cómo se almacenan los datos en Git.
Cada vez que se guarda el estado de un proyecto (commit), Git básicamente toma una fotografía de todos los archivos del proyecto. Una rama en Git es simplemente un apuntador que se se mueve a través de las diferentes fotografías.

### Técncias de combinación
* Fast-Forward 
Se utiliza cuando el commit de la rama actual es un antecesor directo de la rama que se está fusionando. Debido a que no hay trabajo divergente para unir, Git simplifica las cosas moviendo el puntero de la rama actual hacia adelante.

* Merge commit
Se utiliza cuando el commit de la rama actual no es un antecesor directo de la rama que se está fusionando. Git tiene que hacer lo que se conoce como una combinación de tres vías.
En lugar de simplemente mover el puntero de la rama hacia adelante, Git crea una nueva fotografía que resulta de combinar las puntas de las ramas y el ancestro común de las dos (se crea automáticamente un nuevo commit).
En algunos casos la combinación puede presentar conflictos y es necesario arreglarlos manualmente.

## Actividad
Antes de comenzar con la actividad recuerden actualizar su repositorio con respecto al del curso.
```
git pull Miguelp-rez master
```
Dirigirse al directorio donde se entregará la práctica. En ese directorio deberán crear un hola mundo en su lenguaje de programación favorito. Cuando hayan terminado hagan commit y ejecuten el siguiente comando para revisar el historial de git.
```
git log --oneline --decorate --graph --all
```
* Tomar captura de pantalla
A continuación deberán crear un hola mundo en su segundo lenguaje de programacíon favorito. **Nota:** Deberán crear una nueva rama por si algo sale mal.
Se crea la rama
```
git branch mejora
```
Se cambia de rama
```
git checkout mejora
```
Cuando hayan terminado, comenten su código y hagan commit.

En este instante recuerdan que olvidaron comentar su primer código. **Nota:** Deberán crear una nueva rama por si algo sale mal.
Primero hay que regresar a la rama master y luego crear la rama
```
git checkout master
git checkout -b documentacion
```
**NOTA:** La segunda instrucción nos permite crear la rama 'documentación' y al colocarnos en ella al mismo tiempo.
Comenten su código y cuando hayan terminado hagan commit
Revisen el historial de git para ver cómo ha cambiado.
```
git log --oneline --decorate --graph --all
```
* Tomar captura de pantalla
Si no hubo ningún error combinen la rama 'documentacion' con la rama 'master'.
```
git merge documentacion
```
Verificar que se realizó un fast-forward.
Eliminar la rama 'documentacion'
```
git branch -d documentacion
```
Ahora combinen la rama 'mejora' con la rama 'master'.
```
git merge mejora
```
Verificar que se realizó un Merge commit.
Eliminar la rama 'mejora'
```
git branch -d mejora
```
Revisen el historial de git para ver cómo ha cambiado.
* Tomar captura de pantalla

Agregar las capturas de pantalla y al directorio de esta práctica y hagan commit.
Por último suban sus cambios a GitHub y entreguen su práctica realizando un pull request