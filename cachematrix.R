##  Set Of Functions That Inverse A Matrix

## The functions that are written below are able to compute an inverse of a matrix as well as cache the results. This could be beneficial, since matrix inversion is  
## normally pretty costly and incovenient. If the inverse of matrices can be cached, rather than having to repeatedly compute them, it could be very beneficial. 

## The first function, makeCacheMatrix, creates a special "matrix" object that is able to cahce it's inverse. 

makeCacheMatrix <- function(x = matrix()) {
  mat_inverse<-NULL
  set<- function(y) {
     x<<-y
  mat_inverse<<-NULL
 
}
get<- function()x 
 setinverse <- function(solve) mat_inverse <<-solve 
 getinverse <- function() mat_inverse
   list (set=set, get=get,
         setinverse=setinverse,
         getinverse=getinverse)
}


## The second function, cacheSolve, is able to compute the inverse of the special "matrix" that is returned by the makeCacheMatrix function. If there is a result available 
## in the cache for the inverse of the matrix which has been solved before, the CacheSolve function will retrieve it. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
mat_inverse <- x$getinverse()
  if (! is.null(mat_inverse)) {
  message ("retrieving data from cache")
       return(mat_inverse) 
}
mat_data <- x$get()
mat_inverse <- solve(mat_data, ...)
  x$setinverse(mat_inverse)
      mat_inverse
}
