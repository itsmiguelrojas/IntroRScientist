# Taller: Iniciacion en R para cientificos
# Autor: Miguel Rojas (Escuela de Biologia, Facultad de Ciencias, UCV)

# 1. Inicio. Conceptos basicos

## Vista general de RStudio:
  # Script: donde se escribe el codigo
  # Consola: comandos ejecutados en el script. Tambien se puede escribir
  # directamente en la consola
  # Entorno: es el lugar donde viven las variables y funciones
  # definidas por el usuario
  # Utilidades: lista de archivos, gráficos, lista de paquetes, ayuda y
  # visualizador

## Operaciones aritmeticas

12+25 # Suma
48-29 # Resta
4*16 # Producto
81/9 # Division
sqrt(144) # Raíz cuadrada
log(6) # Logaritmo natural

## Guardar variables

var.1 <- 12 # Guarda el valor 12 en la variable var.1
var.2 <- 25 # Guarda el valor de 25 en la variable var.2
var.1 + var.2 # Sumar ambas variables

var.1 <- 18 # Cambia el valor de var.1
var.1 + var.2 # Vuelve a sumar las variables

var.1 <- 'Texto' # Guarda var.1 como un texto
var.1 + var.2 # Error al sumar variables (tipos de variables diferentes)
class(var.1) # Clase de var.1: caracter
class(var.2) # Clase de var.2: numerica

## Borrar variables

rm(var.1, var.2) # Pasa todas las variables a borrar como argumentos de rm()

## Ver tablas

mtcars # Escribir el nombre de la tabla para mostrarla en consola
head(mtcars) # Muestra las seis primeras filas
tail(mtcars) # Muestra las seis ultimas columnas
View(mtcars) # Muestra la tabla en una pestaña nueva
colnames(mtcars) # Nombre de las columnas
rownames(mtcars) # Nombre de las filas
str(mtcars) # Estructura de la tabla
dim(mtcars) # Numero de filas y columnas
nrow(mtcars) # Numero de filas
ncol(mtcars) # Numero de columnas

## Instalar paquetes

# install.packages('ggplot2') # Instalación del paquete ggplot2 directamente
#desde CRAN. Descomentar para instalar

library(devtools)
# install_github('itsmiguelrojas/sdPop') #Instalación del paquete sdPop desde
# GitHub. Descomentar para instalar

## Usar paquetes

library(ggplot2)
library(sdPop)

## Citar paquetes

citation() # Citar R
citation('ggplot2') # Citar el paquete ggplot2

## Crear, visualizar y guardar gráficos

ggplot(data = mtcars, aes(x = wt, fill = factor(cyl))) +
  geom_density(alpha = 0.5)

  ### PNG
  png('cyl_d.png')
  ggplot(data = mtcars, aes(x = wt, fill = factor(cyl))) +
    geom_density(alpha = 0.5)
  dev.off()
  
  ### JPG
  jpeg('cyl_d.jpeg')
  ggplot(data = mtcars, aes(x = wt, fill = factor(cyl))) +
    geom_density(alpha = 0.5)
  dev.off()
  
  ### PDF
  pdf('cyl_d.pdf')
  ggplot(data = mtcars, aes(x = wt, fill = factor(cyl))) +
    geom_density(alpha = 0.5)
  dev.off()
  
  ### TIFF
  tiff('cyl_d.tiff')
  ggplot(data = mtcars, aes(x = wt, fill = factor(cyl))) +
    geom_density(alpha = 0.5)
  dev.off()

# 2. Importar datos de Excel, CSV y texto plano

## Importar datos de Excel

# install.packages('readxl')
library(readxl)
datos <- read_excel('materia_org.xlsx', header = TRUE)
head(datos)
class(datos)

## Importar datos de CSV
## Datos: https://www.kaggle.com/datasets/sumitm004/forest-fire-area

data.fuego <- read.csv('forestfires.csv', header = TRUE)
head(data.fuego)
class(data.fuego)

library(readr)
data.fuego <- read_csv('forestfires.csv', header = TRUE)
head(data.fuego)
class(data.fuego)

## Importar datos de texto plano
## Datos: https://archive-beta.ics.uci.edu/ml/datasets/abalone

haliotis <- read.csv('abalone.data', header = FALSE)
head(haliotis)
colnames(haliotis)
colnames(haliotis) <- c(
  'sexo','longitud','diametro','talla',
  'peso_completo','peso_sin_concha','peso_visceras',
  'peso_concha','anillos'
) # Cambiar nombre de las columnas

plot(haliotis[sample(0:1, nrow(haliotis), replace = T, prob = c(0.95,0.05)) == 1,]) # Graficar todas las variables con R Base

## Datos: http://www.ensembl.org/Mus_musculus/Info/Index


# 3. Estadisiticas basicas e inferencia estadistica



# 4. Filtrar y reordenar



# 5. Tipos de graficos



# 6. Retocar graficos



# 7. Algunas pruebas de hipotesis


