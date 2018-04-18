impute_fare <- function(df, param_embarked, param_passenger_class) {
  
	# all passengers from a specific embarkation port travelling under a specific passenger class with no fare
	no_fare <- subset(df, 
						embarked == param_embarked & 
						passenger_class == param_passenger_class & 
						fare == "0")


	# all passengers from a specific embarkation port travelling under a specific passenger class with valid fare
	valid_fare <- subset(df, 
						embarked == param_embarked & 
						passenger_class == param_passenger_class & 
						fare != "0")
					   
	df[no_fare$passenger_id,]$fare <- median(valid_fare$fare)
  
  return(df)
}
