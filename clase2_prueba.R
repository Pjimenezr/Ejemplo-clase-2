# Nota 1: Los acentos han sido omitidos intensionalmente para evitar problemas de codificacion (encoding)
#         entre los distintos sistemas operativos.
# Nota 2: Los comentarios en R se realizan con el caracter '#'



##### Caracteristicas de R:

#- Es un lenguaje de programacion orientado a objetos
#- Es un software no comercial (gratuito) de codigo abierto
#- Se distribuye bajo licencia GNU GPL
#- Esta disponible para los sistemas operativos Windows, Macintosh, Unix y GNU/Linux
#- Sin embargo, existe una alternativa online para otros sistemas (cloud.rstudio.com)
#- Puede integrarse con distintas bases de datos
#- Posee una gran capacidad grafica

###### Una primera sesion en R

# Nota 3: Las instrucciones en RStudio se ejecutan ejecutando la combinacion de teclas
#         Ctrl + Enter (Windows) o Cmd + Enter (Mac)

### Una primera recomendacion en una sesion de R es establecer la carpeta de trabajo, lugar que
#   contendra los archivos necesarios y se guardaran los archivos generados de nuestra sesion

getwd() # Muestra en pantalla la actual carpeta de trabajo

setwd("C:/Users/pablo/Dropbox") # Windows: Establezco la carpeta de trabajo
setwd("/Users/pablo/Dropbox")   # Linux/Mac: Establezco la carpeta de trabajo

getwd() # Volvemos a mostrar la actual carpeta de trabajo para verificr el cambio

### Una segunda recomendacion es eliminar cualquier objeto en memoria perteneciente a
#   una sesion anterior

ruta = getwd() # Guardo en el objeto ruta la actual carpeta de trabajo
dia = "Martes" # Guardo en el objeto dia el texto Martes

ls() # El comando ls lista los objetos existentes en memoria

rm(ruta) # rm Elimina el objeto ruta de la memoria

ls() # Verificamos que el objeto ha sido eliminado

# Como borramos toda la memoria?

ruta = getwd() # Vuelvo a crear el objeto ruta eliminado previamente

ls() # Chequeamos los objetos guardados

rm(list=ls()) # Esta instruccion borra todos los objetos en memoria (recomendado al inicio de toda sesion)

ls() # verificamos que los objetos han sido eliminados

### R como calculadora (aritmetica basica)

2+2
5-3
2*3
8/2
2^3
sqrt(9)  # Raiz cuadrada
abs(-10) # Valor absoluto
sin(45)  # Seno
cos(45)  # Coseno
tan(45)  # Tangente
exp(3)   # Numero de euler e elevado a una potencia
log(10)  # Logaritmo natural
log(10, base = 10)          # Logaritmo de otra base (en este ejemplo 10)
log( (4*(5+3))^3, base = 2) # Logaritmo de un calculo aritmetico con una base determinada

### El comando de ayuda

?log # Anteponer ? al nombre del comando para ver la ayuda

help(sqrt) # Una segunda opcion

apropos("cos") # Busca funciones que contengan el texto cos

### Objetos en R

# La manera mas comun de usar R es mediante objetos: estos pueden ser vectores, matrices,
# caracteres, factores, logicos

# Nota 4: La asignacion de objetos en R se realiza usando '<-', '=' o usando la funcion assign. Para
#         imprimirlos por pantalla solo basta tipear el nombre del objeto o bien utilizando la
#         funcion get
# Nota 5: En R el texto se representa entre comillas. De lo contrario R buscara un objeto

a = 2 # Guardo en el objeto a el numero 2
a     # Imprimo en pantalla el valor del objeto a

b <- 3 # Guardo en el objeto b el numero 3
b      # Imprimo en pantalla el valor del objeto b

4 -> c # Guardo en el objeto c el numero 4
c      # Imprimo en pantalla el valor del objeto c

assign("d", value = 5) # Guardo en el objeto d el numero 5
get("d")               # Imprimo en pantalla el valor del objeto d

rm(list=ls()) # Borramos la memoria

## Vectores

# Para definir un vector en R se utiliza la funcion c (concatenar)

x <- c(1, 2, 5, 7, 11) # Defino el objeto x como el vector (1, 2, 5, 7, 11)
x

# Existen comandos adicionales que facilitan la creacion de vectores largos

secuencia1 <- 1:5 # Genera una secuencia de 1 hasta 5
secuencia1

secuencia2 <- seq(from=1, to = 5, by = 1) # Genera una secuencia de 1 hasta 5
secuencia2

secuencia3 <- seq(from = 1, to = 5, by = 0.2) # Genera una secuencia de 1 hasta 5 con incrementos de 0.2
secuencia3 

rep(1, times = 4)  # Repito el 1 4 veces
rep(1, each  = 4)  # No es lo mismo que lo anterior

rep(1:3, times = 4)  # Repito el vector (1, 2, 3) 4 veces
rep(1:3, each  = 4)  # Repito cada elemento del vector (1, 2, 3) 4 veces

rep(1:3, each = 4, times = 2) # Repito cada elemento del vector (1, 2, 3) 4 veces, y repito la 
                              # secuencia en 2 oportunidades

rep1 <- rep(secuencia1, each = 2, times = 3) # Tambien puede ser utilizado sobre objetos y
                                             # guardado posteriormente
rep1

# Las operaciones aritmeticas pueden ser aplicadas sobre vectores y se ejecutan elemento a elemento

x

3*x
x^2
log(x)
exp(x)
sqrt(x)

x
secuencia1

x + secuencia1
x*secuencia1

# Algunas funciones especiales utiles sobre funciones

z <- c(2, 8, 1, 4)
z

length(z)  # Cuenta el numero de elementos de un vector
max(z)     # Calcula el valor maximo de un vector
min(z)     # Calcula el valor minimo de un vector
sum(z)     # Calcula la sumatoria de un vector
cumsum(z)  # Calcula la suma acumulada en un vector
prod(z)    # Calcula la productoria de un vector
cumprod(z) # Calcula la productoria acumulada de un vector
sort(z)    # Ordena los elementos de un vector de menor a mayor
sort(z, decreasing = TRUE) # Ordena los elementos de un vector de mayor a menor

# Un vector no necesariamente debe ser de numeros, puede ser de cualquier tipo

# Nota 6: Los logicos TRUE y FALSE pueden ser abreviados simplemente por T y F, respectivamente
# Nota 7: Existen elementos especiales en R. Estos son NA (Not available), NaN (Not a Number),
#         Inf (Infinite), NULL (nulo)

v_numerico   <- z                     # Copio el objeto z en el objeto v_numerico
v_caracteres <- c("a", "b", "c", "d") # Genero un vector de caracteres
v_logico     <- c(FALSE, TRUE, T, F)  # Genero un vector logico
v_especiales <- c(NA, NaN, Inf, -Inf) # Genero un vector que contiene elementos especiales

v_numerico
v_caracteres
v_logico
v_especiales

### Matrices

# Usualmente se definen mediante la funcion matrix, y por defecto se completan por culumnas desde un vector

Matriz1 <- matrix(1:16, nrow = 4, ncol = 4) # Genero una matriz de 4x4 con los elementos de 1:16
Matriz1

Matriz2 <- matrix(1:16, nrow = 4, ncol = 4, byrow = TRUE) # Genero una matriz de 4x4 con los elementos
                                                          #  de 1:16 completada por filas
Matriz2

# Nota 8: La multiplicacion matricial en R se define por %*%. Usar simplemente * efectuara una
#         multiplicacion elemento a elemento

A <- matrix(c(2,3,5,7,11,13,17,19,23), nrow = 3, ncol = 3)
A
B <- matrix(c(1,3,6,8,5,6,2,1,1), nrow =3, ncol = 3)
B

A + B # Suma de matrices
A - B # Sustraccion de matrices
2*A   # Multiplicacion de un escalar por una matriz
A*B   # Multiplicacion elemento a elemento (producto Hadamard)
A%*%B # Multiplicacion matricial
t(A)  # Traspuesta de una matriz
diag(A) # Extrae la diagonal de una matriz
diag(c(1,3,5)) # Genera una matriz diagonal
solve(A) # Matriz inversa
dim(A) # Dimension de una matriz (filas x columnas)
nrow(A) # Numero de filas
ncol(A) # Numero de columnas

### Extraccion de elementos de un vector

A
A[2, 3] # Extrae el elemento de la fila 2 columna 3
A[1,]   # Extrae todos los elementos de la fila 1
A[,1]   # Extrae todos los elementos de la columna 1
A[c(1,2), c(1,2)] # Extrae una submatriz dada por las primeras 2 filas y primeras 2 columnas
A[-1, ] # Quita la primera fila
A[, -1] # Quita la primera columna
A[-c(1,3), -2] # Quita la primera y tercer fila. Ademas quita la 2 columna

#### Elementos de programacion en R
#### Condicionales (if/else) - ciclos (for/while) - funciones

### Condicionales if/else

### Caracteres usados en condicionales

# == : "iguales"
# != : "diferentes"
# <  : "menor"
# <= : "menor o igual"
# >  : "mayor"
# >= : "mayor o igual


color <- "azul"

if(color == "azul"){
  print("El color es azul")
}

###

color <- "azul"

if(color == "azul"){
  print("El color es azul")
} else{
  print("El color NO es azul")
}

color <- "verde"

if(color == "azul"){
  print("El color es azul")
} else{
  print("El color NO es azul")
}

###

color <- "blanco"

if(color == "azul"){
  print("el color es azul")
} else if(color == "verde"){
  print("el color es verde")
} else if(color == "rojo"){
  print("el color es rojo")
} else{
  print("el color no es ni azul, ni verde ni rojo")
}

# Uso de and y or:
# and: &
# or: |
# negacion: !

color <- "azul"

if((color=="blanco")|(color=="azul")){
  print("El color es azul o blanco")
}

### Formule una condicional que mencione si la solución a una ec. cuadrática tiene 2, 1 o 0 soluciones en los reales
###  Ax^2 + Bx + C = 0

A <- 1
B <- 4
C <- 3

discriminante <- B^2 - 4*A*C
discriminante

if(discriminante > 0){
  print("La ecuacion tiene 2 soluciones reales")
} else if(discriminante == 0){
  print("La ecuacion tiene 1 solucion real")
} else{
  print("La ecuacion no tiene solucion real")
}

### Ciclos

# Ciclo for

vector <- c(1,2,3,5,7,11,13,17,19,23)
vector

for(i in vector){
  print(i)
}

# Ciclo while

contador <- 0

while(contador < 20){
  print(contador)
  contador <- contador + 1
}

### Funciones

potencia <- function(base = 2, exponente = 3){
  resultado <- base ^ exponente
  return(resultado)
}

potencia(base = 2, exponente = 3)

potencia()

milog <- function(valor, ...){
  resultado <- log(valor, ...)
  return(resultado)
}

a <- milog(10, base = 10)
a
