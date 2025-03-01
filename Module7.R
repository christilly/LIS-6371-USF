#Download any type of data (from the web or use datasets package) or create your own set

E1 <- read.csv("desktop/scripts/E1.csv")

#clean version of data
E1_clean <- data.frame(
  ID = c("A", "B", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"),
  measurement = c(6.317, 0, 3.543, 6.471, 5.701,  4.006, 6.163, 1.695, 4.468, 6.626, 9.245, 2.619, 5.855, 0, 3.390, 4.622, 
                  3.852, 8.475, 5.701, 0, 5.701, 2.003, 0, 3.544, 0)
)
E1_clean

#test out generic functions on data
head(E1_clean) #prints first 6 rows
summary(E1_clean) #mins/max/median/quartiles 
sum(E1_clean$measurement) #sum of measurements column should be close to 100
E1_clean[order(E1_clean$measurement), ] #order values from least to greatest

#assign S3 and S4 to dataset
#S3
class(E1_clean$ID) <- "character"
class(E1_clean$measurement) <- "numeric"

class(E1_clean$ID)
class(E1_clean$measurement)

#custom S3 print function
print.concentration <- function(x, ...) { #x represents data passed in, ... represents additional arguments
  cat("concentration values summary:\n")
  summary(x) #prints summary information for concentration data
}
print.concentration(E1_clean$measurement)

#New data frame for S4
E1_2 <- E1_clean

#S4
#Define S4 class
setClass(
  "aminoAcidConcentration",
  slots = list(
    ID = "character",
    measurement = "numeric"
  )
)

#create S4 object
E1_S4 <- new("aminoAcidConcentration", ID=E1_2$ID, measurement=E1_2$measurement)
class(E1_S4)

# Define custom print method for the S4 class
setMethod(
  "print", 
  "aminoAcidConcentration", 
  function(x) {
    cat("Custom Print for aminoAcidConcentration:\n")
    cat("ID:\n")
    print(x@ID)  # Access 'ID' slot
    cat("Measurement:\n")
    print(x@measurement)  # Access 'measurement' slot
  }
)

# Test the custom print method for S4 object
print(E1_S4)  # This will invoke your custom print method 