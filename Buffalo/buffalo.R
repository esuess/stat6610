library(rvest)
lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")

rating <- lego_movie %>% 
  html_nodes("strong span") %>%
  html_text() %>%
  as.numeric()
rating


buffalo <- read_html("https://www.wunderground.com/q/zmw:14201.1.99999?sp=KNYBUFFA70")
mean.temp <- buffalo %>% 
  html_nodes("div span") %>%
  html_text() %>%
  as.numeric()
mean.temp[48]


B <- 3

buffalo.data <- df()

buffalo.data <- seq(as.Date("2016/1/1"), as.Date("2016/12/31"), "days")





B <- 

buffalo.data <- numeric(B)

for (d in 1:B){
  
  d <- 1
  
buffalo <- read_html("https://www.wunderground.com/history/airport/KBUF/2016/01/01/DailyHistory.html")
  mean.temp <- buffalo %>% 
    html_nodes("div span") %>%
    html_text() %>%
    as.numeric()
  mean.temp[13]
  #buffalo.data[d] <- mean.temp[13]
}

buffalo.data


day <- 17:19


buffalo.data <- numeric(3)

buffalo <- read_html("https://www.wunderground.com/history/airport/KBUF/2016/01/01/DailyHistory.html")
mean.temp <- buffalo %>% 
  html_nodes("div span") %>%
  html_text() %>%
  as.numeric()
mean.temp
mean.temp[13]
buffalo.data[1] <- mean.temp[13]

buffalo <- read_html("https://www.wunderground.com/history/airport/KBUF/2016/01/02/DailyHistory.html")
mean.temp <- buffalo %>% 
  html_nodes("div span") %>%
  html_text() %>%
  as.numeric()
mean.temp
mean.temp[13]
buffalo.data[2] <- mean.temp[13]

buffalo <- read_html("https://www.wunderground.com/history/airport/KBUF/2016/01/03/DailyHistory.html")
mean.temp <- buffalo %>% 
  html_nodes("div span") %>%
  html_text() %>%
  as.numeric()
mean.temp
mean.temp[13]
buffalo.data[3] <- mean.temp[13]

buffalo.data

mean(buffalo.data)


buffalo.data <- numeric()

M <- 12
B <- 31

for (m in 1:M){
  for (d in 1:B){ 
    if (m == 2 & d > 29) break
    # if ( (m == 4 | m == 6 | m == 9 | m == 11 ) & d > 30) break
    if ( ( m %in% c(4,6,9,11) ) &  d > 30 ) break

    buffalo <- read_html(paste0("https://www.wunderground.com/history/airport/KBUF/2016/",m,"/",d,"/DailyHistory.html"))
    mean.temp <- buffalo %>% 
      html_nodes("div span") %>%
      html_text() %>%
      as.numeric()
    #mean.temp
    #mean.temp[13]
    buffalo.data <- c(buffalo.data,mean.temp[13])
  }
}

buffalo.data

buffalo.data <- as.vector(buffalo.data)

buffalo.date <- data.frame(seq(as.Date("2016/1/1"), as.Date("2016/12/31"), "days"))


library(dplyr)


buffalo.final <- bind_cols(buffalo.date, buffalo.data)

colnames(buffalo.final) <- c("date","temp")

summary(buffalo.final$temp)

plot(buffalo.final)

p <- ggplot(buffalo.final, aes(date,temp))
p + geom_point()
p + geom_point() + stat_smooth(method=lm, level=0.99)
p + geom_point() + stat_smooth()
p + geom_point() + stat_smooth(method=loess)

qplot(date, temp, data=buffalo.final)




