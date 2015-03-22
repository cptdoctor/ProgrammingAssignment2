## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

        s <- NULL 
        ## Intialize the 'S' variable to NULL.
        
        set <- function(y) { 
                ## 'y' is the matrix arg passed into 'makeCacheMatrix'.
                x <<- y
                ## Set 'x' for the function environment to 'y'.
                s <<- NULL
                ## Set 's' for the makeCacheMatrix' environment to NULL.
        }
        
        get <- function() x
        ## Create a function 'get' in the 'makeCacheMatirx' parent 
        ## and assigns a matrix to it.  
        setsolve <- function(solve) s <<- solve
        ## Takes a solve ('the inverse of the matrix') and sets it to the
        ## solve of 's' in the 'makeCacheMatrix' frame.
        getsolve <- function() s
        ## Returns the solve of 's' from the 'makeCacheMatrix' frame.
        list(set=set, get=get, 
             setsolve = setsolve,
             getsolve = getsolve)
        ## Lists out the values of the functions in the 'makeCacheMatrix' frame.
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s <- x$getsolve()
        # Goes to the'x' environment and assigns the 
        # 's' value from that environment to this one.
        
        if(!is.null(s)) {
                # If the 'x' environment has been evaluated 
                # before, the function prints the message and
                # the value of m (the cached solve).
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        # If this particular 'x' has never been
        # evaluted before, pull the matrix'x' into a
        # local varaible called 'data'.
        s <- solve(data, ...)
        # Compute the inverse of the matrix 'x' by calling
        # 'solve' function on the data local variable.
        x$setsolve(s)
        # Assign the computed inverse of the matrix 'x'
        # environment using the 'setsolve' function.
        s
        ## Display the inverse of the matrix 'x'
}
