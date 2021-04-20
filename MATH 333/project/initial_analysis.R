library(readxl)
library(astsa)
library(xts)

#read data from excel
data <- read_excel("C:\\Users\\zackr\\Desktop\\Spring-2021\\MATH 333\\project\\EXPORTS_IMPORTS_MEX_CAN.xls")
data <- data.frame(data$observation_date, data$CAN_EXPORTS, data$CAN_IMPORTS, data$MEX_EXPORTS, data$CAN_IMPORTS)

data$observation_date <- as.Date(data$observation_date)

data_ts <- xts(c(data$CAN_EXPORTS, data$CAN_IMPORTS, data$MEX_EXPORTS, data$MEX_IMPORTS), data$observation_date)