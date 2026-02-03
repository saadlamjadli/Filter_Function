base_r <- Filter( is.function , sapply(ls(baseenv()),get ,baseenv()))
#####################################################################
cust_filter <- function( f , x ) {
  
  f <- match.fun(f)
  ind <- as.logical(unlist(lapply(x,f)))
  x[which(ind)]
  
}

# Exemple : 1 

x <- c(-3,1,2,5,10,20)

cust_filter( function(v) v <= 5 , x )

# Exemple : 2 

is_even <- function(z) {
  z %% 2 == 0
}

cust_filter(is_even , x)

# Exemple : 3 

words <- c("apple", "banana", "fig" ,"killua")

cust_filter( function(r) nchar(r) > 5  , words)

# Exemple : 4 

genes <- c("HLA-A", "HLA-B", "IFN" , "TNF")

cust_filter( function(t) grepl("^I", t) , genes) 

# Exemple : 5 

obj <- list(1, TRUE, data.frame(x=1), FALSE)

cust_filter( is.logical , obj)

cust_filter


# match.fun + apply Vs Filtrer

x <- list(1, "a",3,TRUE)

cust_filter(is.numeric, x)
cust_filter("is.numeric", x)
cust_filter(quote(is.numeric) , x)

# Apply = itération , Filter = sélection 

lapply(list(5,"a",10,20,TRUE), is.numeric)
cust_filter(is.numeric,list(5,"a",10,20,TRUE))




