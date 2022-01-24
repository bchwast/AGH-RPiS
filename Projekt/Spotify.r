# Przygotowanie danych do analizy

library(ggplot2)
library(ggcorrplot)
library(moments)
library(nortest)
library(grid)
library(gridExtra)
library(hrbrthemes)
library(rstudioapi)

setwd(dirname(getActiveDocumentContext()$path))

filePath <- "data.csv"
data <- read.csv(filePath)
dataSet <- as.data.frame(cbind(data$danceability, data$energy, data$loudness, 
                               data$tempo, data$audio_valence))
colnames(dataSet)[1] <- "danceability"
colnames(dataSet)[2] <- "energy"
colnames(dataSet)[3] <- "loudness"
colnames(dataSet)[4] <- "tempo"
colnames(dataSet)[5] <- "valence"
attach(dataSet)
write.csv(dataSet, "./dataSet.csv", row.names = TRUE)

# Podstawowa analiza danych

summary(dataSet)

# Zmienna danceability

histogram <- ggplot(dataSet, aes(x = danceability), xlab="danceability") + 
  geom_histogram(binwidth=0.03, color="black", fill="darkmagenta") + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Histogram 'danceability'")
histogram

boxplot <- ggplot(dataSet, aes(x = danceability), xlab="danceability") + 
  geom_boxplot(color="black", fill="darkmagenta", alpha=0.5, outlier.size=5) + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Boxplot 'danceability'")
boxplot

range(danceability)
mean(danceability)
quantile(danceability, c(0.25, 0.5, 0.75)) 
var(danceability)
sd(danceability) 
skewness(danceability)
kurtosis(danceability)

qqnorm(danceability)
qqline(danceability)
lillie.test(danceability)

# Zmienna energy

histogram <- ggplot(dataSet, aes(x = energy), xlab="energy") + 
  geom_histogram(binwidth=0.03, color="black", fill="orangered2") + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Histogram 'energy'")
histogram

boxplot <- ggplot(dataSet, aes(x = energy), xlab="energy") + 
  geom_boxplot(color="black", fill="orangered2", alpha=0.5, outlier.size=5) + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Boxplot 'energy'")
boxplot

range(energy)
mean(energy)
quantile(energy, c(0.25, 0.5, 0.75)) 
var(energy)
sd(energy)
skewness(energy)
kurtosis(energy)

qqnorm(energy)
qqline(energy)
lillie.test(energy)

# Zmienna loudness

histogram <- ggplot(dataSet, aes(x = loudness), xlab="loudenss") + 
  geom_histogram(binwidth=1, color="black", fill="green1") + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Histogram 'loudness'")
histogram

boxplot <- ggplot(dataSet, aes(x = loudness), xlab="loudness") + 
  geom_boxplot(color="black", fill="green1", alpha=0.5, outlier.size=5) + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Boxplot 'loudness'")
boxplot

range(loudness)
mean(loudness)
quantile(loudness, c(0.25, 0.5, 0.75)) 
var(loudness)
sd(loudness)
skewness(loudness)
kurtosis(loudness)

qqnorm(loudness)
qqline(loudness)
lillie.test(loudness)

# Zmienna tempo

histogram <- ggplot(dataSet, aes(x = tempo), xlab="tempo") + 
  geom_histogram(binwidth=5, color="black", fill="lightblue1") + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Histogram 'tempo'")
histogram

boxplot <- ggplot(dataSet, aes(x = tempo), xlab="tempo") + 
  geom_boxplot(color="black", fill="lightblue1", alpha=0.5, outlier.size=5) + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Boxplot 'tempo'")
boxplot

range(tempo)
mean(tempo)
quantile(tempo, c(0.25, 0.5, 0.75)) 
var(tempo)
sd(tempo)
skewness(tempo)
kurtosis(tempo)

qqnorm(tempo)
qqline(tempo)
lillie.test(tempo)

# Zmienna valence

histogram <- ggplot(dataSet, aes(x = valence), xlab="valence") + 
  geom_histogram(binwidth=0.03, color="black", fill="yellow1") + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Histogram 'valence'")
histogram

boxplot <- ggplot(dataSet, aes(x = valence), xlab="valence") + 
  geom_boxplot(color="black", fill="yellow1", alpha=0.5, outlier.size=5) + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Boxplot 'valence'")
boxplot

range(valence)
mean(valence)
quantile(valence, c(0.25, 0.5, 0.75)) 
var(valence)
sd(valence)
skewness(valence)
kurtosis(valence)

qqnorm(valence)
qqline(valence)
lillie.test(valence)

# Macierze kowariancji i korelacji dla wszystkich zmiennych

cov(dataSet[,c(1,2,3,4,5)])
cor(dataSet[,c(1,2,3,4,5)])

ggcorrplot(cor(dataSet[,c(1,2,3,4,5)]))

# Zale¿noœæ miêdzy energy a loudneess

plotle <- ggplot(dataSet, aes(x = loudness, y = energy), xlab="loudness", 
                 ylab="energy") + 
  geom_point() + 
  geom_smooth(formula = y ~ x, method = "lm") + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Zale¿noœæ 'energy' od 'loudness'")
plotle

# Zale¿noœæ miêdzy danceability a valence

plotvd <- ggplot(dataSet, aes(x = valence, y = danceability), xlab="valence", 
                 ylab="danceability") +
  geom_point() +
  geom_smooth(formula = y ~ x, method = "lm") +
  theme_ipsum(base_family = 'sans') +
  labs(title="Zale¿noœæ 'danceability' od 'valence'")
plotvd

# Regresja liniowa

reg <- lm(danceability ~ valence)
summary(reg)

# Zale¿noœæ miêdzy energy a valence

plotve <- ggplot(dataSet, aes(x = valence, y = energy), xlab="valence", 
                 ylab="energy") + 
  geom_point() + 
  geom_smooth(formula = y ~ x, method = "lm") + 
  theme_ipsum(base_family = 'sans') + 
  labs(title="Zale¿noœæ 'energy' od 'valence'")
plotve
