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
2^6 # Exponente
sqrt(144) # Raiz cuadrada
log(6) # Logaritmo natural
exp(6) # Funci?n exponencial

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
library(readxl) # Cargar el paquete readxl
datos <- read_excel('materia_org.xlsx') # Cargar datos
head(datos) # Ver las primeras seis filas
class(datos) # Ver el tipo de variable

## Importar datos de CSV
## Datos: https://www.kaggle.com/datasets/sumitm004/forest-fire-area

data.fuego <- read.csv('forestfires.csv', header = TRUE) # Cargar datos
head(data.fuego) # Ver las primeras seis filas
class(data.fuego) # Ver el tipo de variable

library(readr) # Cargar el paquete readr
data.fuego <- read_csv('forestfires.csv') # Cargar datos
head(data.fuego) # Ver las primeras seis filas
class(data.fuego) # Ver el tipo de variable

## Importar datos de texto plano
## Datos: https://archive-beta.ics.uci.edu/ml/datasets/abalone

haliotis <- read.csv('abalone.data', header = FALSE) # Cargar datos
head(haliotis) # Ver las primeras seis filas
colnames(haliotis) # Ver el nombre de las columnas
colnames(haliotis) <- c(
  'sexo','longitud','diametro','talla',
  'peso_completo','peso_sin_concha','peso_visceras',
  'peso_concha','anillos'
) # Cambiar nombre de las columnas

plot(haliotis[sample(0:1, nrow(haliotis), replace = T, prob = c(0.95,0.05)) == 1,]) # Graficar todas las variables con R Base

## Datos: http://www.ensembl.org/Mus_musculus/Info/Index
## Descomprimir el archivo con extensi?n .gz
genome <- read.csv('mus_musculus.GRCm39.Regulatory_Build.regulatory_features.20201021.gff', header = F, sep = '\t') # Cargar datos
head(genome) # Ver las primeras seis filas
dim(genome) # Ver las dimensiones de la tabla
genome <- genome[,1:5] # Ver solo las columnas de la 1 a la 5

# Remover tablas que no se utilizaran
rm(datos)

# 3. Estadisiticas basicas e inferencia estadistica

## Resumen de los datos

summary(data.fuego) # Resumen de datos.fuego
summary(haliotis) # Resumen de haliotis

## Suma de datos numericos
sum(data.fuego$area) # Suma de todas las areas incendiadas
sum(data.fuego$rain) # Total de precipitacion (en mm/m^2)

## Minimo y maximo

min(data.fuego$area) # Minima area incendiada
max(data.fuego$area) # Maxima area incendiada

## Promedio

mean(data.fuego$area)
mean(haliotis$peso_completo)

## Desviacion estandar
sd(data.fuego$area) # Muestral
sd(data.fuego$area)/sqrt(nrow(data.fuego)) # Error estandar
sd.population(data.fuego$area) # Poblacional

# #Desplegar resumen por datos categoricos

by(data.fuego, data.fuego['month'], summary)
by(haliotis, haliotis['sexo'], summary)

## Inferir datos a partir de datos ya existentes (ejemplo del tama?o del gen)

colnames(genome)[c(4,5)] <- c('inicio','final')
genome$size <- genome$final - genome$inicio
genome$size

## Borrar tabla

rm(genome)

# 4. Filtrar y reordenar

## Filtrar datos
data.fuego[data.fuego$area > 0,] # Solo areas incendiadas
data.fuego[data.fuego$month == 'aug',] # Solo datos del mes de agosto
data.fuego[data.fuego$month == 'aug' & data.fuego$area > 10,] # Solo datos del mes de agosto con areas incendiadas mayores a 10
haliotis[haliotis$sexo != 'I',] # Solo individuos adultos de ambos sexos

## Ordenar datos
data.fuego[order(data.fuego$RH, decreasing = F),] # De forma ascendente por el porcentaje de humedad relativa
data.fuego[order(data.fuego$RH, decreasing = T),] # De forma descendente por el porcentaje de humedad relativa

head(haliotis[order(haliotis$longitud, decreasing = F),]) # De forma ascendente por longitud de individuos

## Reordenar factores

haliotis$sexo <- factor(haliotis$sexo, levels = c('F','M','I')) # Convertir datos de sexo en un factor con niveles

meses <- c('jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec')
dias <- c('mon','tue','wed','thu','fri','sat','sun')
data.fuego$month <- factor(data.fuego$month, levels = meses) # Meses ordenados
data.fuego$day <- factor(data.fuego$day, levels = dias) # Dias de la semana ordenados

# 5. Tipos de graficos

## Grafico de barras

### Con los datos originales
ggplot(data = haliotis, aes(x = sexo, y = peso_completo)) +
  geom_bar(stat = 'identity')

### Usando dplyr
library(dplyr)

haliotis %>%
  group_by(sexo) %>%
  summarise(
    peso.prom = mean(peso_completo),
    es = sd(peso_completo)/sqrt(n())
    ) %>%
  ggplot(aes(x = sexo, y = peso.prom, fill = sexo)) +
  geom_bar(stat = 'identity') +
  geom_errorbar(aes(ymin = peso.prom - es, ymax = peso.prom + es), width = 0.2)

## Grafico de puntos

ggplot(haliotis, aes(x = peso_completo, y = longitud)) +
  geom_point()

## Grafico de caja y bigotes

ggplot(haliotis, aes(x = sexo, y = longitud, fill = sexo)) +
  stat_boxplot(geom = 'errorbar', width = 0.2) +
  geom_boxplot()

## Histograma

ggplot(data.fuego, aes(x = RH)) +
  geom_histogram(bins = 10, color = 'black')

## Grafico de densidad

ggplot(data.fuego, aes(x = RH, fill = month)) +
  geom_density(color = 'black', alpha = 0.5)

## Contornos geograficos (bonus)
## Datos: https://www.diva-gis.org/gdata

library(sf) # Cargar libreria para datos geograficos

mapa_venezuela <- st_read('VEN_adm/VEN_adm1.shp')
head(mapa_venezuela)

ggplot() +
  geom_sf(data = mapa_venezuela) # Mapa basico

mapa_venezuela$valor <- runif(nrow(mapa_venezuela), 0, 100) # Crear datos para mapa coropletico

ggplot() +
  geom_sf(data = mapa_venezuela, aes(fill = valor), color = 'black')

# 6. Retocar graficos

## Cambiar titulos de los ejes

densidad.RH <- ggplot(data.fuego, aes(x = RH, fill = month)) +
  geom_density(color = 'black') # Guardar grafico en variable

densidad.RH # Ver grafico

densidad.RH + labs(x = 'Humedad relativa (%)', y = 'Densidad')

## Añadir titulo y subtitulo

densidad.RH + labs(title = 'Humedad relativa por mes', subtitle = 'Parque natural de Montesinho')

## Cambiar tamaño y tipo de fuente

densidad.RH + theme(
  axis.title = element_text(size = 20, family = 'serif')
)

## Mover o eliminar la leyenda

densidad.RH + theme(legend.position = 'top') # Arriba
densidad.RH + theme(legend.position = 'bottom') # Abajo
densidad.RH + theme(legend.position = 'right') # Derecha
densidad.RH + theme(legend.position = 'left') # Izquierda
densidad.RH + theme(legend.position = c(0.8,0.8)) # Posicion personalizada
densidad.RH + guides(fill = 'none') # Sin leyenda

## Añadir transparencia
ggplot(data.fuego, aes(x = RH, fill = month)) +
  geom_density(color = 'black', alpha = 0.5)

## Desplegar por categoria

densidad.RH + facet_wrap(month ~ ., ncol = 3)
densidad.RH + facet_grid(month ~ day)

## Cambiar colores

### Con RColorBrewer

library(RColorBrewer)
RColorBrewer::display.brewer.all()

densidad.RH + facet_wrap(month ~ ., ncol = 3) +
  scale_fill_manual(values = brewer.pal(n = 12, name = 'Set3'))

### Manualmente

paleta <- c(
  'aquamarine','cyan','red','orange','darkblue','gray',
  'gold','limegreen','violet','orangered','skyblue','salmon'
  )

densidad.RH + facet_wrap(month ~ ., ncol = 3) +
  scale_fill_manual(values = paleta)

# 7. Algunas pruebas de hipotesis

## Regresion

ggplot(haliotis, aes(x = peso_sin_concha, y = peso_completo)) +
  geom_point(color = 'salmon')

regresion <- lm(peso_completo ~ peso_sin_concha, data = haliotis) # Modelo de regresion lineal
summary(regresion) # Resumen del modelo
cor(haliotis$peso_sin_concha, haliotis$peso_completo) # Coeficiente de correlacion

ggplot(haliotis, aes(x = peso_sin_concha, y = peso_completo)) +
  geom_point(color = 'salmon') +
  geom_abline(intercept = 0.059072, slope = 2.141735) # Añadir línea de regresión

## t de Student

data.fuego.agosto <- data.fuego[data.fuego$month == 'aug',] # Solo datos de agosto
data.fuego.septiembre <- data.fuego[data.fuego$month == 'sep',] # Solo datos de septiembre

mean(data.fuego.agosto$area) # Promedio del area incendiada en agosto
mean(data.fuego.septiembre$area) # Promedio del area incendiada en septiembre

var.test(data.fuego.agosto$area, data.fuego.septiembre$area) # Prueba de igualdad de varianzas

t.test(data.fuego.agosto$area, data.fuego.septiembre$area, var.equal = F, conf.level = 0.95) # Prueba de t de Student

## ANOVA

hal.anova <- lm(longitud ~ sexo, haliotis) # Modelo lineal para el ANOVA
anova(hal.anova) # Prueba ANOVA

### Prueba de Tukey-Kramer

plot(TukeyHSD(aov(hal.anova)), las = 2)

## Chi-cuadrado de homogeneidad

archivo <- "http://www.sthda.com/sthda/RDoc/data/housetasks.txt"
housetasks <- read.delim(archivo, row.names = 1)

library(corrplot)
corrplot(as.matrix(housetasks), is.corr = F) # Grafico de correlacion

prueba.chi <- chisq.test(housetasks) # Prueba Chi-cuadrado de homogeneidad
prueba.chi
prueba.chi$expected # Valores esperados
corrplot(as.matrix(prueba.chi$expected), is.corr = F)