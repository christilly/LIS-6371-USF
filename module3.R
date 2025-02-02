#module 3 assignment 
#candidate describes the names of the candidates in the 2016 election
#ABC and CBS describe the political poll results for each candidate 
#respective to the source of the poll

candidate <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC <- c(4, 62, 51, 21, 2, 14, 15)
CBS <- c(12, 75, 43, 19, 1, 21, 19) 

poll_data <- data.frame(candidate, ABC, CBS) #create data frame of poll results
