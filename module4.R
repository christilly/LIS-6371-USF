freq <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
bloodp <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
first <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)
second <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)
finaldecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)

par(mfrow = c(1, 3)) #three box plots in one row, three column layout
#create box plot representing blood pressure
boxplot(bloodp, 
        names=c("blood pressure"), 
        main="Patient blood pressures")
#create box plot representing frequency of visits
boxplot(freq,
        names=c("frequency"),
        main="Frequency of visits")
#create box plot representing professional evaluation of patients
boxplot(first, second, finaldecision,
        na.rm=TRUE,
        names=c("first", "second", "final"),
        main="Patient evaluation")

par(mfrow = c(1, 2)) #two histograms in one row, two column layout
#histogram representing blood pressure
hist(bloodp, 
     main="Patient Blood Pressure",
     xlab="blood pressure")
#histogram of frequency of patient visits
hist(freq, 
     main="Patient Visit Frequencies",
     xlab="visit frequencies")


#histogram of patient evaluations
par(mfrow = c(1, 3)) #plot three histograms in one row, three column layout
hist(first, 
     breaks=c(-0.5, 0.5, 1.5), 
     xlab="0-good 1-bad", 
     main="general doctor evaluation")
hist(second, 
     breaks=c(-0.5, 0.5, 1.5), 
     xlab="0-good 1-bad",
     main="external doctor evaluation")
hist(finaldecision, breaks=c(-0.5, 0.5, 1.5), 
     xlab="0-low need 1-high need", 
     main="emergency unit assessment")
par(mfrow = c(1, 1)) #reset layout to default



