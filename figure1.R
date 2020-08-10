NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- transform(NEI, year = factor(year))
year_sum <- tapply(NEI$Emissions, NEI$year, FUN = sum)
png(file="year_total.png", width = 480, height = 480)
plot(c(1999, 2002, 2005, 2008),year_sum, type = "l", xlab = "year", ylab = "total PM2.5 emissions (tons)")
dev.off()



