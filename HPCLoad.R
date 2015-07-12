HPC <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
dim(HPC)
attach(HPC)
subset <- Date=="1/2/2007" | Date=="2/2/2007"
HPC2 <- HPC[subset, ]
attach(HPC2)
x <- paste(Date, Time)

HPC2$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(HPC2) <- 1:nrow(HPC2)
dim(HPC2) 
attach(HPC2)
