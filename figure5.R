NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC$SCC <- as.character(SCC$SCC)
mobile_code <- SCC$SCC[grepl("Mobile", SCC$EI.Sector, perl = TRUE)]
NEI_b <- NEI[NEI$fips == "24510",]
NEI_mobile <- NEI[1,]
for (i in 1:1773){
        NEI_mobile<-rbind(NEI_mobile,NEI_b[NEI_b$SCC==mobile_code[i],])
}
NEI_mobile <- NEI_mobile[-1,]
year_sum <- tapply(NEI_mobile$Emissions, NEI_mobile$year, FUN = sum)
png(file = "figure5.png", width = 480, height = 480)
plot(c(1999, 2002, 2005, 2008),year_sum, type = "l", xlab = "year", 
     ylab = "total mobile related PM2.5 emissions (tons)")
dev.off()