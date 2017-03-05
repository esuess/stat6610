library(hts)

# Example 1
# The hierarchical structure looks like 2 child nodes associated with level 1,
# which are followed by 3 and 2 sub-child nodes respectively at level 2.

nodes <- list(2, c(3, 2))
abc <- ts(5 + matrix(sort(rnorm(500)), ncol = 5, nrow = 100))
x <- hts(abc, nodes)

# etc

fc <- forecast(x, h=10, fmethod="ets", parallel=TRUE, num.cores=2)

plot(fc)

# arima

fc <- forecast(x, h=10, fmethod="arima", parallel=TRUE, num.cores=4)

plot(fc)


# Example 2
# Suppose we've got the bottom names that can be useful for constructing the node
# structure and the labels at higher levels. We need to specify how to split them 
# in the argument "characters".

abc <- ts(5 + matrix(sort(rnorm(1000)), ncol = 10, nrow = 100))
colnames(abc) <- c("A10A", "A10B", "A10C", "A20A", "A20B",
                   "B30A", "B30B", "B40A", "B40B", "B40C")
y <- hts(abc, characters = c(1, 2, 1))

# etc

fc <- forecast(y, h=10, fmethod="ets", parallel=TRUE, num.cores=2)

plot(fc)

# arima

fc <- forecast(y, h=10, fmethod="arima", parallel=TRUE, num.cores=4)

plot(fc)


