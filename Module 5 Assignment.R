A <- matrix(1:100, nrow=10)  
B <- matrix(1:1000, nrow=10)

#Transpose A and B  given a matrix or data.frame x, t returns the transpose of x.
A_T <- t(A)
B_T <- t(B)

#create two vectors (a and b)
#re-assign the vectors a and b to equal the number of rows of the column for the corresponding matrix
a <- 1:10
b <- 1:100

#multiply matrices by vectors
scale_A <- A_T*a
scale_B <- B_T*b

#Multiply the matrix by a matrix
#new_B <- matrix(scale_B, nrow=10, ncol=100)
#new_matrix <- scale_A%*%new_B
new_matrix <- scale_B%*%scale_A
new_matrix

#Inverse a matrix
S=matrix(2:5, nrow=2)
det(S)
solve(S)
