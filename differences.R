### Heatmap
bball <- read.csv("http://datasets.flowingdata.com/ppg2008.csv", header=TRUE)

# Ordering
bball <- bball[order(bball$PTS),]
bball_byfgp <- bball[order(bball$FGP, decreasing=TRUE),]

row.names(bball) <- bball$Name
bball <- bball[,2:20]
bball_matrix <- data.matrix(bball)

bball_heatmap <- heatmap(bball_matrix, Rowv=NA, Colv=NA, col = cm.colors(256), scale="column", margins=c(5,10))
bball_heatmap <- heatmap(bball_matrix, Rowv=NA, Colv=NA, col = heat.colors(256), scale="column", margins=c(5,10))

# Custom colors
red_colors <- c("#ffd3cd", "#ffc4bc", "#ffb5ab", "#ffa69a", "#ff9789", "#ff8978", "#ff7a67", "#ff6b56", "#ff5c45", "#ff4d34")
bball_heatmap <- heatmap(bball_matrix, Rowv=NA, Colv=NA, col = red_colors, scale="column", margins=c(5,10))

library(RColorBrewer)
bball_heatmap <- heatmap(bball_matrix, Rowv=NA, Colv=NA, col = brewer.pal(9, "Blues"), scale="column", margins=c(5,10))


### Chernoff
library(aplpack)
bball <- read.csv("http://datasets.flowingdata.com/ppg2008.csv", header=TRUE)
bball[1:5,]
faces(bball[,2:16])
faces(bball[,2:16], labels=bball$Name)


### Stars
crime <- read.csv("http://datasets.flowingdata.com/crimeRatesByState-formatted.csv")
stars(crime)
row.names(crime) <- crime$state
crime <- crime[,2:7]
stars(crime, flip.labels=FALSE, key.loc = c(15, 1.5))
stars(crime, flip.labels=FALSE, key.loc = c(15, 1.5), full=FALSE)
stars(crime, flip.labels=FALSE, key.loc = c(15, 1.5), draw.segments=TRUE)

### Parallel Coordinates Plot
education <- read.csv("http://datasets.flowingdata.com/education.csv", header=TRUE)
education[1:10,]

library(lattice)
parallel(education)
parallel(education, horizontal.axis=FALSE)
parallel(education[,2:7], horizontal.axis=FALSE)
parallel(education[,2:7], horizontal.axis=FALSE, col="#000000")

# Quartiles
summary(education)

# Color by reading SAT
reading_colors <- c()
for (i in 1:length(education$state)) {
	
	if (education$reading[i] > 523) {
		col <- "#000000"	
	} else {
		col <- "#cccccc"	
	}
	reading_colors <- c(reading_colors, col)
}
parallel(education[,2:7], horizontal.axis=FALSE, col=reading_colors)

# Color by dropout rate
dropout_colors <- c()
for (i in 1:length(education$state)) {
	
	if (education$dropout_rate[i] > 5.3) {
		c <- "#000000"	
	} else {
		c <- "#cccccc"	
	}
	dropout_colors <- c(dropout_colors, c)
}
parallel(education[,2:7], horizontal.axis=FALSE, col=dropout_colors)


### Multidimensional scaling
ed.dis <- dist(education[,2:7], method="euclidean")
ed.mds <- cmdscale(ed.dis)
x <- ed.mds[,1]
y <- ed.mds[,2]
plot(x,y)

plot(x, y, type="n")
text(x, y, labels=education$state)
text(x, y, labels=education$state, col=dropout_colors)
text(x, y, labels=education$state, col=reading_colors)

# Clustering
library(mclust)
ed.mclust <- Mclust(ed.mds)
par(mfrow=c(2,2))
plot(ed.mclust, data=ed.mds)