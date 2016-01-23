## Submitted by Anup Sasturkar


## makeCacheMatrix function creates a list of functions


makeCacheMatrix <- function(x = matrix()) {

## Creating a matrix "i" having NAs and dimensions of "x" matrix
	
		i<-matrix(nrow=nrow(x),ncol=ncol(x))

## set function changes matrix stored in main function 	
		set<- function(y=matrix){
		
		x<<-y
		i<<-matrix(nrow=nrow(x),ncol=ncol(x))
		
		}
## get functions returns matrix "x" from main function
	get<-function() x

## setinverse & getinverse function stores value of "i" in main function
	setinverse<- function(inverse) i<<-inverse
	getinverse<- function() i

## list- creates a list of functions
	list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)


}

cacheSolve <- function(makeCacheMatrix) {

## check cache for value of "i" matrix and check if first element is NA    
	i<-makeCacheMatrix$getinverse()

	if(!is.na(i[1,1])) {
		message("getting cached data")
		return(i)
	}

## using get function store matrix x into "data" matrix	
	data<-makeCacheMatrix$get()

## find inverse of data using Solve()
	i<-solve(data)

## store in "i" matrix in makeCacheMatrix 
	makeCacheMatrix$setinverse(i)

	print(i)


}



