date()

# install.packages("quantmod", dependencies = TRUE)

########################################################################
library(quantmod)

# To output to a .pdf file.
# pdf("stocks00.pdf")

getSymbols("GS", src="yahoo",from="2000-01-01")
tail(GS)
chartSeries(GS)

barChart(GS,theme='white.mono',bar.type='hlc')
candleChart(GS,multi.col=TRUE,theme='white')
candleChart(GS,subset='2007-12::2008')
lineChart(GS,line.type='h',TA=NULL)
chartSeries(GS,theme="white",TA="addVo();addBBands();addCCI()")
chartSeries(GS,TA="addVo();addBBands();addCCI();addDEMA();addZLEMA()")

chartSeries(GS,theme="white") #draw the chart
chartSeries(GS)
addBBands() #add Bollinger Bands
addCCI() #add Commodity Channel Index

# close the file
# dev.off()


########################################################################
# last 2 years = 366*5 days of data

d = Sys.Date() - 366*2
d

portfolio = c("GOOG","DOW","F","MSFT","DTO")
#portfolio = c("GOOG","DOW","F","GM","MSFT")

# To output to a .pdf file.
# pdf("stocks01.pdf")

getSymbols(portfolio, src="yahoo", from=d)

tail(GOOG)
chartSeries(GOOG)
addBBands() #add Bollinger Bands

tail(DOW)
chartSeries(DOW)
addBBands() #add Bollinger Bands

tail(F)
chartSeries(F)
addBBands() #add Bollinger Bands

tail(MSFT)
chartSeries(MSFT)
addBBands() #add Bollinger Bands

tail(DTO)
chartSeries(DTO)
addBBands() #add Bollinger Bands

########################################################################
# last 30 days of data

d = Sys.Date() - 30
d

getSymbols(portfolio, from=d)

tail(GOOG)
chartSeries(GOOG,theme="white")

tail(DOW)
chartSeries(DOW,theme="white")

tail(F)
chartSeries(F,theme="white")

tail(MSFT)
chartSeries(MSFT,theme="white")

tail(DTO)
chartSeries(DTO,theme="white")

# close the file
# dev.off()




