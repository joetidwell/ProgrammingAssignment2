####~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### Invert and Cache a Matrix
###
### Purpose
###  * Provide functions to invert a matrix and cache the result
###
### Functions
###  * makeCacheMatrix(x)
###    * Purpose   : Provide inverted matrix
###    * Arguments : x - an invertible matrix
###    * Returns   : a list containing the following functions
###      - get()               : returns the argument x
###      - setInverse(inv.mat) : assigns inv.mat to mat, in the parent 
###                              environment
###      - getInverse()        : returns(mat)
###  * cacheSolve(x, ...)   
###    * Arguments : x - list object generated by makeCacheMatrix(x)
###    * Returns   : mat - inverted matrix; solves for inverse and caches 
###                  if not cached; otherwise returns cached inverse
####~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


## Provides functions for caching and retrieving inverted matrix

makeCacheMatrix <- function(x = matrix()) {
  mat <- NULL
  get <- function() x
  setInverse <- function(inv.mat) mat <<- inv.mat
  getInverse <- function() mat
  list(get = get,
       setInverse = setInverse,
       getInverse = getInverse)  
}


## Generates inverted matrix. Solves for inverse if not cached, otherwise
## provides cached value

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  mat <- x$getInverse()
  if(!is.null(mat)) {
          message("getting cached data")
          return(mat)
  }
  data <- x$get()
  mat <- solve(data, ...)
  x$setInverse(mat)
  mat
}

