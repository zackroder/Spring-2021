library(readxl)
library(astsa)
library(xts)

#read data from excel
data <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 333\\project\\EXPORTS_IMPORTS_MEX_CAN.xls")
data <- data.frame(data$CAN_EXPORTS, data$CAN_IMPORTS, data$MEX_EXPORTS, data$MEX_IMPORTS)

#convert to ts object
data_ts <- ts(data, start=1980, freq=12)

tsplot(data_ts)