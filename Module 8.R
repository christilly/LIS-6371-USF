#Install necessary packages including pryr
install.packages("pryr")
install.packages("plyr")
install.packages("data.table")
install.packages("boot")
install.packages("ISLR")

library(pryr)
library(ISLR)
library(boot)
library(plyr)
library(data.table)

#Step 1: download Assignment 6 Dataset file 
studentData <- read.table("desktop/scripts/Assignment 6 Dataset.txt", header = TRUE, sep = ",")

StudentAverage = ddply(studentData,"Sex",transform,Grade.Average=mean(Grade)) #transform makes new/modified columns in data frame
StudentAverage

sex = StudentAverage$Sex
mean(sex) #returns NA because sex is composed of male and female as values

write.table(StudentAverage, "Student_Average.csv", sep=",")


#Step 2 Convert the data set to a dataframe for names whos' name contains the letter i, 
#then create a new data set with those names, Write those names to a file separated by comma’s (CSV)

StudentNames = subset(studentData,grepl("[iI]", studentData$Name))
StudentNames
write.table(StudentNames,"NamesWithI.csv",sep=",")





