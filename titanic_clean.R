library(readxl)
library(dplyr)
library(tidyr)
titanic3 <- read_excel("titanic3.xls")
titanic3_clean <- titanic3

#replace NA values in embarked
titanic3_clean$embarked[is.na(titanic3$embarked)] <- "S"
