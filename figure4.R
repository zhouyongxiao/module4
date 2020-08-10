NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC$SCC <- as.character(SCC$SCC)
coal_code <- SCC$SCC[grepl("(?=.*Comb)(?=.*Coal)", SCC$EI.Sector, perl = TRUE)]
NEI_coal <- NEI[1,]
for (i in 1:99){
        NEI_coal<-rbind(NEI_coal,NEI[NEI$SCC==coal_code[i],])
}
NEI_coal <- NEI_coal[-1,]
year_sum <- tapply(NEI_coal$Emissions, NEI_coal$year, FUN = sum)
png(file = "figure4.png", width = 480, height = 480)
plot(c(1999, 2002, 2005, 2008),year_sum, type = "l", xlab = "year", ylab = "total coal related
     PM2.5 emissions (tons)")
dev.off()