pnorm(26500, 26572, 2*sqrt(89)*sqrt(73))

waga <- rnorm(292, 70, 8)
waga_bagazu <- rnorm(292, 21, 5)

hist(waga, probability = TRUE)
hist(waga_bagazu)

pasazer <- waga + waga_bagazu

hist(pasazer)

sum(pasazer)

qqnorm(pasazer)

waga_poisson <- rpois(292, 2)

qqnorm(waga_poisson)

hist(waga_poisson)