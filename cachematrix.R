## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse,
## stores the matrix and its inverse, and provides methods to get and set the values
makeCacheMatrix <- function(x = matrix()) {
  
  inverse <- NULL
  
  set <- function(y) {
    x <<- y 
    inverse <<- NULL
  }
  get <- function() x
  setInverse <- function(inv) inverse <<- inv
  getInverse <- function() inverse
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}




## Write a short comment describing this function
## This function computes the inverse of the special "matrix" object returned by makeCacheMatrix
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  
  if (!is.null(inv)) {
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  
  x$setInverse(inv)
  
  return(inv)
  
}
