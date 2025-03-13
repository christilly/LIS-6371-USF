library(plyr)
library(dplyr)
library(ggplot2)

pulse_data <- read.csv("desktop/scripts/RepeatedPulse.csv", header=TRUE) #store pulse data in data frame

#First visualization: heart rate in the morning
#Create data frame with heart rate in the morning data
pulse_morning <- pulse_data %>% filter(Time == "morning") #removes all data that does not reference morning

#make plot
plot(pulse_morning$Pulse, main="Heart Rate in the Morning", xlab="Day", ylab="Heart Rate (bpm)", pch=21, ylim=c(60,80))


#Second visualization: comparison of heart rate in the morning vs evening
#Create data frame with evening heart rate data
pulse_night <- pulse_data %>% filter(Time == "evening") #data frame with evening heart rate
pulse_night$rownames <- seq_len(nrow(pulse_night)) #renumbers the rownames column in pulse_night to 
#start at 1 so the column matches with pulse_morning$rownames

#make plot
ggplot() +
  geom_point(data = pulse_morning, aes(x = rownames, y = Pulse, color = "Morning"), size = 3) +
  geom_point(data = pulse_night, aes(x = rownames, y = Pulse, color = "Evening"), size = 3) +
  scale_color_manual(values = c("Morning" = "blue", "Evening" = "red")) +  # Manually set colors
  labs(title = "Heart Rate Morning vs Evening",
       x = "Days", 
       y = "Heart Rate (bpm)", 
       color = "Time of Day") #Legend title

#Third visualization: heart rate throughout day 1, 2, 3, and 26
#data frames for days 1-3 and 26
day1 <- pulse_data %>% filter(Day == "Day1")
day1$rownames <- seq_len(nrow(day1)) #adjust rownames to 1-4

day2 <- pulse_data %>% filter(Day == "Day2")
day2$rownames <- seq_len(nrow(day2)) #adjust rownames to 1-4

day3 <- pulse_data %>% filter(Day == "Day3")
day3$rownames <- seq_len(nrow(day3)) #adjust rownames to 1-4

day26 <- pulse_data %>% filter(Day == "Day26")
day26$rownames <- seq_len(nrow(day26)) #adjust rownames to 1-4

#make plot
ggplot() +
  geom_point(data = day1, aes(x = rownames, y = Pulse, color = "Day 1"), size = 2) + 
  geom_line(data = day1, aes(x = rownames, y = Pulse, color = "Day 1"), linewidth = 1) +
  geom_point(data = day2, aes(x = rownames, y = Pulse, color = "Day 2"), size = 2) +
  geom_line(data = day2, aes(x = rownames, y = Pulse, color = "Day 2"), linewidth = 1) +
  geom_point(data = day3, aes(x = rownames, y = Pulse, color = "Day 3"), size = 2) +
  geom_line(data = day3, aes(x = rownames, y = Pulse, color = "Day 3"), linewidth = 1) +
  geom_point(data = day26, aes(x = rownames, y = Pulse, color = "Day 26"), size = 2) +
  geom_line(data = day26, aes(x = rownames, y = Pulse, color = "Day 26"), linewidth = 1) +
  scale_color_manual(values = c("Day 1" = "blue", "Day 2" = "red", "Day 3" = "green", "Day 26" = "pink")) +
  scale_x_discrete(limits = c("Morning", "Noon", "1 PM", "Evening")) + #change x from rownames numbers to time of day
  labs(title="Heart Rate Throughout the Day",
       x = "Time of Day",
       y = "Heart Rate (bpm)") +
  theme_classic() + #minimalist theme with no grid lines
  theme(plot.title = element_text(hjust = 0.5)) #center the title

  

