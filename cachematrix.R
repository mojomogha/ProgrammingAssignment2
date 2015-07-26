## MakeCacheMatrix create a cached matrix inverse
## And CacheMatrix returns the matrix inverse from cache if it already exists otherwise
## calls the MakeCacheMatrix which creates and caches the inverse of the matrix

## the following function creates inverse of the supplied matrix and saves it in the Cache

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(invrse) m <<- invrse
        getInverse <- function() m
        list(set = set, get = get, setInverse = setInverse,
             getInverse = getInverse)

}


## Following function returns the cached inverse of the supplied matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- Sovle(data, ...)
        x$setInverse(m)
        m
}
