library(ggplot2)
library(dplyr)

data <- read.csv(file = "CASchools.csv")

data_f <- data.frame(data)

#1
dfsimple <-  data_f %>% group_by(grades) %>% summarize(average_mathscore = mean(math), .groups = "keep")

data_map <- ggplot(dfsimple, aes(grades, average_mathscore)) + geom_bar(stat = "identity") 

data_map

#2
data_map2 <- ggplot(data_f, aes(grades, math)) + geom_boxplot()

data_map2

#3
dfsimple3 <- data_f %>% group_by(county) %>% summarize(avg_student = mean(students), .groups = "keep")

data_map3 <- ggplot(dfsimple3, aes(county, avg_student)) + geom_point() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data_map3
