# Dzień dobry R - wprowadzenie do R
# Informatyka 10.10.2021

# OPERATORY
5 + 7
3 * 4
3 ^ 2
3 ** 2
17 %% 5
17 %/% 5
17 / 5
abs(-5)
sqrt(4)
sqrt(-8)      # nie działa
sqrt(-8, 3)   # nie działa
?sqrt

floor(4.5)
floor(4)
ceiling(5.5)
ceiling(5)

# KOMENTOWANIE W SKRYPCIE R
# WBUDOWANE FUNKCJE
log10(100)
log(exp(4))

# PIPE OPERATOR - magrittr pakiet jest już zainstalowany
# załaduj pakiet magrittr - ręcznie (prawe dolne okno - wyszukaj w Packages i odznacz) bądź wpisując library(magrittr)
exp(4) %>% log()
exp(4) %>% log(.)

# trochę funkcji i ich wartości
sin(4)
sin(0)
print(pi, 15)
round(pi, 5)
pi
# R standardowo podaje 7 cyfr znaczących
cos(2 * pi)
sin(pi)

# LOGIKA
6 > 7
! (6 > 8)
6 > 7 & 1 < 2
6 > 7 && 1 < 2
6 > 7 | 1 < 2
# prawda czy fałsz?
65 %% 5 == 0

# "WEKTORY" nie takie jakie znamy z algebry, czyli jednak nie wektory
c(1, 2, 3, 8, 7, -7, 21, 3, 2, -4, 1)
# wyświetlił się ponownie w konsoli, ale gdy przypiszę go do wektor, to
# c pochodzi od combine
wektor <- c(10, 2, 3, 8, 7, -7, 21, 3, 2, -4, 1)
# dlaczego lepiej nie używać <<-?
names(wektor)
typeof(wektor)
length(wektor)
wektor %>% length()
wektor %>% length(.)
is.na(wektor)
# z brakującą wartością
wektorNa <- c(10, 2, 3, 8, 7, -7, 21, 3, 2, -4, 1, NA, NaN)
NA + 2
wektorNa %>% sum()
# sumowanie, co mówi pomoc, co z NA/NaN?
?sum
wektorNa %>% sum(., na.rm=FALSE)
wektorNa %>% sum(., na.rm=TRUE)
wektorNa %>% is.na()
wektorNa %>% is.na() %>% as.numeric()
wektorNa %>% is.na() %>% typeof()
wektorNa %>% is.na() %>% sum()
# czy to typ danych w wektor?
wektor[0]
# który to element
wektor[1]
wektor[3]
wektor[2:5]
# nie ma 50-tej wartości, co wtedy będzie?
wektor[50]

# nadajemy nazwy, to wygodne
wyniki <- c(rzutA = 1, rzutB = 22, rzutC = 7)
wyniki
names(wyniki)
wyniki["rzutA"]
wyniki[c("rzutA", "rzutB")]
wyniki[1]
wyniki[-c(1, 3)]
wyniki[-c("rzutA")] # nie działa
# dwa czy jeden zestaw nawiasów?
names(wyniki)[[2]] <- "rzutBB"
names(wyniki)[2] <- "rzutBB"
wyniki

# to nie są wektory
wynikiDwa <- 2 * wyniki
wynikiDwa
# nie uda się?
dodatek3 <- c(1, 1, 1)
dodatek4 <- c(1, 1, 1, 1)
dodatek3 + wynikiDwa
dodatek4 + wynikiDwa
wynikiDwa
2 + wynikiDwa
# uda się? dlaczego?
dodatek6 <- c(1, 2, 3, 4, 5, 6)
dodatek3 + dodatek6
probaA <- c(1, 2, 3, 4)
probaB <- c(1, 2)
probaA + probaB

# przydatne ciągi
?rep
jedynkiTrzy <- rep(1, 3)
jedynkiTrzy
# arytmetyczny
?seq
seq(from = 1, to = 50, by = 2.5)
seq(1, 50, 2.5)
seq(2, 4)
1:30
# po współrzędnych
wektor
wektor * wektor
wektor ^ 2
1/2 * wektor
wektor * 0.5
wektor / wektor
sqrt(wektor ^ 2)

# PRAWDZIWE WEKTORY I MACIERZE
matrixA <- seq(from = 1, by = 3, len = 6)
matrixA
dim(matrixA) <- c(3, 2)
matrixA
# jak się działa na wektorach i macierzach?

# PĘTLE
for (i in 1:20) {print(i)}

for (i in 1:20) {
  cat(i, " ")
}
# print i cat, jaka jest różnica?
# bierz elementy prosto ze źródła
indeksy <- seq(2, 50, by = 2)
for (i in indeksy) {
  print(i - 1)
}

?if

for (i in 1:100) {
  if (i %% 2 == 0 && i %% 3 == 0) {
    cat(i, "\n")
  }
  else {
    cat(i, "nie jest liczbą podzielną przez dwa jak i przez trzy", "\n")
  }
}

dane <- c(1, 3, 4, 5)
# co zrobi pętla?
wynik <- 0
for (i in dane) {
  wynik <- wynik + i
}
wynik

# PIERWSZA FUNKCJA
sumaR <- function(x) {
  wynik <- 0
  for (i in x) {
    wynik <- wynik + i
  }
  wynik
}
sumaR(dane)
sum(dane)

sumaSredniaR <- function(x) {
  wynik <- 0
  l <- length(x)
  for (i in 1:l) {
    wynik <- wynik + x[i]
  }
  c(wynik, wynik/l)
}
sumaSredniaR(dane)
# ale chcę wiedzieć wyświetlając wynik co jest czym - nadam nazwy
sumaSredniaRn <- function(x) {
  wynik <- 0
  l <- length(x)
  for (i in x) {
    wynik <- wynik + i
  }
  c(suma = wynik, srednia = wynik / l)
}
sumaSredniaRn(dane)

# GENEROWANIE PSEUDOLOSOWYCH, ILE WYJDZIE PARZYSTYCH?
runif(100, min = 0, max = 26) %>% floor()

# często chcemy dostać wektor i na nim działać
czyParzysta <- function(x) {
  x %% 2 == 0
}

runif(100, min = 0, max = 26) %>% floor() %>% czyParzysta()
pomocnicze <- runif(100, min = 0, max = 26) %>% floor() %>% czyParzysta()
pomocnicze
runif(100, min = 0, max = 26) %>% floor() %>% czyParzysta() %>% sum()
pomocnicze %>% sum()

# a gdyby tak powtórzyć ten eksperyment?
sample <- rep(NA, 100)
for (j in 1:100) {
  x <- runif(100, min = 0, max = 26)
  sample[j] <- x %>% floor() %>% czyParzysta() %>% sum()
}
sample
# szybkie podsumowanie
summary(sample)
# wydobywanie wyników
minimalna <- summary(sample)[1]
minimalna
srednia <- summary(sample)["Mean"]
srednia
# co narysowałem? co mam na osiach? jak zinterpretować wynik?
plot(sample)
# dorysuję poziomą prostą reprezentującą średnią
?abline
abline(h = srednia, col = "red", lwd = 2)
# obliczając wariancję sumuję kwadraty pewnych różnic, gdzie są odcinki reprezentujące te różnice?
var(sample)
# boxplot, gdzie jest ... obserwacji?
boxplot(sample)
# histogram, a jakie on ma opcje?
hist(sample)
?hist

# FUNKCJE jednej zmiennej
fun1 <- function(x) {2 * x + 2}
fun2 <- function(x) {x ** 2}

fun3 <- function(x) {
  if (x < 0) {-x} else {x ^ 2}
}
fun3(-3)
fun3(6)

# RYSUNEK KRZYWEJ
curve(fun1, from = -1, to = 10, xlab = "argumenty", ylab = "wartości", col = "red")
curve(fun2, from = -1, to = 10, xlab = "x", ylab = "y", col = "blue", lwd = 4, add = TRUE)
# czy się narysuje?
curve(fun3, from = -10, to = 10, xlab = "x", ylab = "y", col = "red", lwd = 3)
?curve