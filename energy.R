library(data.table)
library(tidyverse)
#(https://www.kaggle.com/unitednations/international-energy-statistics/data)

energy <- fread("https://s3-ap-southeast-2.amazonaws.com/koki25ando/all_energy_statistics.csv", data.table = FALSE)


library(rvest)
library(stringr)
library(magrittr)

ccountry.page <- read_html("http://www.nationsonline.org/oneworld/country_code_list.htm")
tab <- ccountry.page %>% html_table(header = TRUE)
country.code <- tab %>% extract2(3)
country.code <- country.code[,2:4]
names(country.code) <- c("Country name", "code_2digit","code_3digit")
country.code <- country.code[-1,]

energy.country <- merge(energy, country.code, by.x = "country_or_area", by.y = "Country name", all=T)


dim(energy)
dim(energy.country)

write.csv(country.code, file = "country.code.csv", row.names=FALSE)
write.csv(country.code, file = "country.code.csv", row.names=FALSE)
