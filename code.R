# No 1
X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

# 1a
selisih <- Y-X
standar_deviasi <- sd(selisih)
cat("Standar deviasi : ", standar_deviasi, "\n")

# 1b
hasil <- t.test(X, Y, paired = TRUE)
cat("P-value : ", hasil$p.value, "\n")


# No 2
library(BSDA);

pop_mean <- 25000
sam_mean <- 23500
sam_sd <- 3000
n <- 100

# 2c
hasil <- zsum.test(mean.x=sam_mean, sigma.x=sam_sd, n.x=n, mu=pop_mean, 
                   alternative="greater")
cat("P-value : ", hasil$p.value, "\n")


# No 3
library(mosaic)

n1 <- 20
x1 <- 3.64
s1 <- 1.67
n2 <- 27
x2 <- 2.79
s2 <- 1.5

# 3b
hasil <- tsum.test(x1, s1, n1, x2, s2, n2, var.equal = TRUE)
print(hasil)

# 3c
plotDist(dist = 't', df = 2)

# 3d
kiri_crit <- qt(p = 0.025, df = 2)
kanan_crit <- qt(p = 0.025, df = 2, lower.tail = FALSE)
cat("Nilai kritikal : ", kiri_crit, " & ", kanan_crit, "\n")


# No 4
library(ggplot2)
library(stats)
library(dplyr)

data <- data.frame(
  tipe = c("A", "A", "A", "B", "B", "B", "C", "C", "C", "A", "A", "A", "B", "B",
           "B", "C", "C", "C", "A", "A", "A", "B", "B", "B", "C", "C", "C"),
  temp = c(100, 100, 100, 100, 100, 100, 100, 100, 100, 125, 125, 125, 125, 125, 
           125, 125, 125, 125, 150, 150, 150, 150, 150, 150, 150, 150, 150),
  cahaya = c(580, 568, 570, 550, 530, 579, 546, 575, 599, 1090, 1087, 1085, 1070,
             1035, 1000, 1045, 1053, 1066, 1392, 1380, 1386, 1328, 1312, 1299, 
             867, 904, 889)
)

# 4a
ggplot(data, aes(x = tipe, y = cahaya, color = factor(temp))) +
  geom_point() +
  labs(x = "Tipe", y = "Cahaya", color = "Temperatur") +
  ggtitle("Pengaruh Suhu dan Jenis Kaca pada Keluaran Cahaya") +
  theme_minimal()

# 4b
hasil <- aov(cahaya ~ tipe + temp + tipe:temp, data = data)
sum_hasil = summary(hasil)
print(sum_hasil)

# 4c
summary_table <- data %>% group_by(tipe, temp) %>% 
  summarize(
    mean = mean(cahaya),
    sd = sd(cahaya)
  )

print(summary_table)
