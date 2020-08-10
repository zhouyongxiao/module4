NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_b <- NEI[NEI$fips == "24510",]
year_sum <- tapply(NEI_b$Emissions, NEI_b$year, FUN = sum)
png(file="figure2.png", width = 480, height = 480)
plot(c(1999, 2002, 2005, 2008),year_sum, type = "l", xlab = "year", ylab = "total PM2.5 emissions (tons)")
dev.off()