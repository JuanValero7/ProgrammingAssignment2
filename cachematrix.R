## This is the makeCacheMatrix ##
# Fist create a function that takes a matrix of numeric objets,
# the name of the matrix that we want to see if the Inverse was calculated
# and the name of this operation, if it exist and with it do 5 things.
# *Establish value of the inverse matrix in the makeCacheMatrix
#  enviroment equals to NULL
# *Set the value of x looking in other enviroments using the <<- technique and
# the name of the matrix that that you want to reproduce
# *Get and store the value of x 
# *SetInv look in every enviroment if the value of the Inverse matrix was 
# already solve and get that value to the Inv variable, using the name that
# you previously assign to this command function
# *GetInv get the value of the variable Inv if is already exist as a matrix
# Finally it return a list with this four functions

makeCacheMatrix<-function(x=matrix(),y,solve=NULL){
	Inv<-NULL
	set<-function(y){
		x<<-y
		Inv<<-NULL
}
	get<-function(){ 
	x
	}
	setInv<-function(solve){ 
	Inv <<- solve
	}
	getInv<-function(){ 
	Inv
	}
list(set = set(y), get = get,
             setInv = setInv(solve),
             getInv = getInv)
}

## This is the cacheSolve matrix ##
#This function see if the value of the Inv variable is not equal to NULL if
#this happens it returns the value of Inv that is already in the cache
#If this value does not exist it calculates the value using the command solve
#and return this value as the result of Inv


cacheSolve<-function(x,...){
	Inv<-x$getInv()
	if(!is.null(Inv)){
		print("getting cached data")
		return(Inv)
}
	Datos<-x$get()
	Inv<-solve(Datos,...)
	x$getInv()
	Inv	
}
