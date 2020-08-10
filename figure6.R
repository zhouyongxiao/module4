NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC$SCC <- as.character(SCC$SCC)
mobile_code <- SCC$SCC[grepl("Mobile", SCC$EI.Sector, perl = TRUE)]
NEI_b <- NEI[NEI$fips == "24510",]
NEI_mobile_b <- NEI[1,]
for (i in 1:1773){
        NEI_mobile_b<-rbind(NEI_mobile_b,NEI_b[NEI_b$SCC==mobile_code[i],])
}
NEI_mobile_b <- NEI_mobile_b[-1,]

NEI_l <- NEI[NEI$fips == "06037",]
NEI_mobile_l <- NEI[1,]
for (i in 1:1773){
        NEI_mobile_l<-rbind(NEI_mobile_l,NEI_l[NEI_l$SCC==mobile_code[i],])
}
NEI_mobile_l <- NEI_mobile_l[-1,]

year_sum_b <- tapply(NEI_mobile_b$Emissions, NEI_mobile_b$year, FUN = sum)
year_sum_l <- tapply(NEI_mobile_l$Emissions, NEI_mobile_l$year, FUN = sum)
png(file = "figure6.png", width = 480, height = 480)
par(mfrow=c(1,2))
plot(c(1999, 2002, 2005, 2008),year_sum_b, type = "l", xlab = "year",
     ylab = "Baltimore mobile related PM2.5 emissions (tons)", col = "red")
plot(c(1999, 2002, 2005, 2008),year_sum_l, type = "l",xlab = "year",
     ylab = "LA mobile related PM2.5 emissions (tons)", col = "blue")
dev.off()