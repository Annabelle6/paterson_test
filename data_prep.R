library(tidyverse)
library(readxl)

x <- read_excel("Summary_of_NZ_Wines.xlsx")
names(x) <- c("Category", paste0("y", 2009:2018))
write_rds(x, path = "nz_wine/wine.rds")
