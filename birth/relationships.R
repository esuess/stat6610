# Comparison of the birth-rate data by year.

# Histogram matrix
library(lattice)
birth_yearly <- read.csv('http://datasets.flowingdata.com/birth-rate-yearly.csv')
histogram(~ rate | year, data=birth_yearly, layout=c(10,5))

# nicer plot, remove outlier and add years to the title bar for each plot
# changing the order of the year from 1960 to 2008

# find the outlier

summary(birth_yearly)

# remove the outlier

birth_yearly.new <- birth_yearly[birth_yearly$rate < 132,]

# change lable to charater values

birth_yearly.new$year <- as.character(birth_yearly.new$year)

# new histogram matrix

h <- histogram(~ rate | year, data=birth_yearly.new, layout=c(10,5))

plot(h)

# change order, left to right and top to bottom

update(h, index.cond=list(c(41:50, 31:40, 21:30, 11:20, 1:10)))



