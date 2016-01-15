library(weatherData)
library(weathermetrics)

data_okay <- checkDataAvailability("OAK", "2016-01-14")

data_okay <- checkSummarizedDataAvailability("OAK","2010-01-01","2015-01-01")

getCurrentTemperature(station_id = "LAX")
getCurrentTemperature(station_id = "SFO")
getCurrentTemperature(station_id = "OAK")
getCurrentTemperature(station_id = "SEA")

wSFO <- getDetailedWeather("SFO", "2016-01-15", opt_all_columns=T)
wSFO

attach(wSFO)

ggplot(data = wSFO, aes(x=Wind_SpeedMPH, y=WindDirDegrees, color=Wind_Direction)) + geom_point(size=3)



