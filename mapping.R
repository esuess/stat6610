library(maps)

# Plain points
# costcos <- read.csv("http://book.flowingdata.com/ch08/geocode/costcos.txt", sep="\t")
costcos <- read.csv("http://book.flowingdata.com/ch08/geocode/costcos-geocoded.csv", sep=",")
map(database="state")
symbols(costcos$Longitude, costcos$Latitude, circles=rep(1, length(costcos$Longitude)), inches=0.05, add=TRUE)
symbols(costcos$Longitude, costcos$Latitude, circles=rep(1, length(costcos$Longitude)), inches=0.03, add=TRUE)

map(database="world", col="#cccccc")
symbols(costcos$Longitude, costcos$Latitude, bg="#e2373f", fg="#ffffff", lwd=0.3, circles=rep(1, length(costcos$Longitude)), inches=0.03, add=TRUE)

map(database="state", col="#cccccc")
symbols(costcos$Longitude, costcos$Latitude, bg="#e2373f", fg="#ffffff", lwd=0.5, circles=rep(1, length(costcos$Longitude)), inches=0.05, add=TRUE)

map(database="state", region=c("California", "Nevada", "Oregon", "Washington"), col="#cccccc")
symbols(costcos$Longitude, costcos$Latitude, bg="#e2373f", fg="#ffffff", lwd=0.5, circles=rep(1, length(costcos$Longitude)), inches=0.05, add=TRUE)

# Connections
faketrace <- read.csv("http://book.flowingdata.com/ch08/points/fake-trace.txt", sep="\t")
map(database="world", col="#cccccc")
lines(faketrace$longitude, faketrace$latitude, col="#bb4cd4", lwd=2)
symbols(faketrace$longitude, faketrace$latitude, lwd=1, bg="#bb4cd4", fg="#ffffff", circles=rep(1, length(faketrace$longitude)), inches=0.05, add=TRUE)

map(database="world", col="#cccccc")
for (i in 2:length(faketrace$longitude)-1) {
	lngs <- c(faketrace$longitude[8], faketrace$longitude[i])
	lats <- c(faketrace$latitude[8], faketrace$latitude[i])
	lines(lngs, lats, col="#bb4cd4", lwd=2)
}


map(database="state", col = "#cccccc")
lines(costcos$Longitude[1:10], costcos$Latitude[1:10], col="#e2373f")

#costcos <- read.csv("points/costcos0.txt", sep="\t")
#map(database="state", col = "#cccccc")
#numcostcos = length(costcos.sorted[,1])
#attach(costcos.sorted)
#for (i in 1:numcostcos) {
#	if (i == 1) {
#		next
#	}		
#	alphaval = 1 - i / numcostcos
	# lines(c(lng[i-1], lng[i]), c(lat[i-1], lat[i]), col=rgb(0,0,0, alpha=alphaval))
	# readline("Press <Enter> to continue")
#	lines(c(Longitude[i-1], Longitude[i]), c(Latitude[i-1], Latitude[i]), col=rgb(0,0,0, alpha=alphaval))
#}
#detach(costcos.sorted)

# Scaled circles
fertility <- read.csv("http://book.flowingdata.com/ch08/points/adol-fertility.csv")
map('world', fill = FALSE, col = "#cccccc")
symbols(fertility$longitude, fertility$latitude, circles=sqrt(fertility$ad_fert_rate), add=TRUE, inches=0.15, bg="#93ceef", fg="#ffffff")