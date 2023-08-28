##Exploracion Datos Fase comprension Oscar Pulido 


library(tibble)
library(readr)
library(dplyr)
library(knitr)
library(tidyr)
library(kableExtra)
library(ggplot2)

#Importacion de los datos
AutoComercial<-read_csv("comauto_pos.csv",col_names = TRUE)

str(AutoComercial)

#Exploracion de formatos

formatos <- AutoComercial %>%
  summarize_all(list(format = ~ toString(class(.))))


#Generacion de estadisiticas descriptivas

EstDesc<-summary(AutoComercial)

#Graficas exploratorias de la informacion

grafica1 <- ggplot(AutoComercial, aes(x = DevelopmentYear, y = IncurLoss_C)) +
  geom_line () + labs(title = "Gráfica de Línea",
                      x = "Anio de desarrollo",
                      y = "Montos incurridos")
print(grafica1)



grafica2 <- ggplot(AutoComercial, aes(x = DevelopmentYear, y = CumPaidLoss_C)) +
  geom_line () + labs(title = "Gráfica de Línea",
                      x = "Anio de desarrollo",
                      y = "Pagos acumulados")
print(grafica2)

grafica3 <- ggplot(AutoComercial, aes(x = AccidentYear, y = DevelopmentYear)) +
  geom_line () + labs(title = "Gráfica de Línea",
                      x = "Año de accidente",
                      y = "Año de desarrollo")
print(grafica3)

#Analisis de calidad de datos 

Nulos<-is.na(AutoComercial)

print(Nulos)

cantidad_nulos_por_columna <- colSums(Nulos)

print(cantidad_nulos_por_columna)

tabla_nulos <- data.frame(Variable = names(cantidad_nulos_por_columna),
                          ValoresNulos = cantidad_nulos_por_columna)
print(tabla_nulos)


