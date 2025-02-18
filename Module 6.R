A <- matrix(c(2,0,1,3), ncol=2)
B <- matrix(c(5,2,4,-1), ncol=2)

#Find A+B
C1 <- A + B
C1
#Find A - B
C2 <- A - B
C2

#Using the diag() function to build a matrix of size 4 with the following values in the diagonal 4,1,2,3.
d <- diag(c(4, 1, 2, 3))
d

#Generate the following matrix:
## [,1] [,2] [,3] [,4] [,5]
## [1,] 3 1 1 1 1
## [2,] 2 3 0 0 0
## [3,] 2 0 3 0 0
## [4,] 2 0 0 3 0
## [5,] 2 0 0 0 3

e <- diag(3, 4, 4)
f <- rbind(1, e)
g <- cbind(2, f)
g[1, 1] <- 3
g
