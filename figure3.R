
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
NEI_b <- NEI[NEI$fips == "24510",]
b_result <- (xtabs(formula=Emissions~type + year, data=NEI_b))
png(file="figure3.png", width = 480, height = 480)
f3 = ggplot(data = NEI_b, aes(x = year, y = Emissions, 
                              color = type)) + geom_point()
f3+geom_smooth(method = "lm")
dev.off()