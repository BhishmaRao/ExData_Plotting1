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

source("HPCLoad.R")
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
hist(Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
dev.off()
