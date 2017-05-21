# A function that creates a matrix object, and returns it as a list

  makeCacheMatrix <- function(x = numeric ()) {
    
    #initializing the inverse matrix: 
    matrix_inverse <- NULL
    
    #Giving new values to the matrix: 
    set <- function(x1){
      x <<- x1
      #every time we make a new matrix, the inverse must be reset:
      matrix_inverse <<- NULL
    }
    
    #function that returns the matrix x
    get<- function() x
    #manually setting the inverse:
    setinv<- function(inverse)
      matrix_inverse<<- inverse
    #function that returns the inverse of matrix x
    getinv<- function()matrix_inverse
    #returning a matrix object as a list: 
    list(set = set, get=get, setinv=setinv,getinv=getinv)
  }



  # A function that returns the inverse of a matrix. If the iverse was computed before,
  # we can access the value (cached value) without computing it again
  
  cacheSolve = function(x, ...){
    i <- x$getinv()
    # if the inverse has been calculated before, we get the cached inverse:
    if(!is.null(i)){
      message("getting cached data")
      return(i)
    }
    #we get to this part of the code if cached inverse does not exist
    # access the matrix objec, and then calculate inverse by the function 
    # solve()
    mymatrix <- x$get()
    i <- solve(mymatrix,...)
    x$setinv(i)
    #returns the inverse of a matrix:
    i
  }
  
  

