library(readxl)
library(dplyr)
library(tidyr)
titanic3 <- read_excel("titanic3.xls")
titanic3_clean <- titanic3

#replace NA values in embarked
titanic3_clean$embarked[is.na(titanic3$embarked)] <- "S"

# calculate mean age
mean_age <- mean(titanic3_clean$age, na.rm = TRUE)

#replace age NAs with mean age
titanic3_clean$age[is.na(titanic3_clean$age)] <- mean_age

#other ways to calculate replacement age for NA?
  #median: might reduce influence of any outliers?

#create dummy value for empty boat values
titanic3_clean$boat[is.na(titanic3_clean$boat)] <- "none"

#it doesn't make sense to fill in a false cabin number, it's not statistically intersesting

#create binary has_cabin_number column
i = 1

while (i < nrow(titanic3_clean)) {
  if (!is.na(titanic3_clean$cabin)[i] == TRUE) {
    titanic3_clean[i, "has_cabin_number"] <- 1
  } else {
    titanic3_clean[i, "has_cabin_number"] <- 0
  }
  i <- i + 1
}

# write.csv(titanic3_clean, "titanic_clean.csv")
