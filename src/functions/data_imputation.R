
# ===========
# impute fare
# ===========

data_imputation_fare <- function(prm_df) {
  
  # obtain a list of all embarkation ports and passenger classes with no fare
  x <- prm_df %>% 
    filter(is.na(fare) | fare=="0") %>% 
    distinct(embarked, passenger_class) %>%
    select(embarked, passenger_class) %>%
    arrange(embarked, passenger_class)
  
  # process list and update median fare 
  for (i in 1:nrow(x))
  {
    prm_df <- calculate_median_fare(prm_df, x[i,1], x[i,2])
  }
  
  return(prm_df)
}



calculate_median_fare <- function(prm_df, prm_embarked, prm_passenger_class) { 

  # all passengers from a specific embarkation port travelling under a specific passenger class with no fare
  no_fare <- prm_df %>% 
    filter(embarked == prm_embarked,  
           passenger_class == prm_passenger_class, 
           is.na(fare) | fare=="0")
  
  # all passengers from a specific embarkation port travelling under a specific passenger class with valid fare
  valid_fare <- prm_df %>% 
    filter(embarked == prm_embarked,  
           passenger_class == prm_passenger_class, 
           !is.na(fare) | fare!="0")
  
  # update fare with median 				   
  prm_df[no_fare$passenger_id,]$fare <- median(valid_fare$fare)
  
  return(prm_df) 
}



# =======================
# impute embarkation port 
# =======================

data_imputation_embarkation <- function(df) {
  
  # all passengers with no embarkation port 
  no_embarkation_port <- df %>% 
    filter(embarked=="")
  
  # update embarkation port with Southampton 				   
  df[no_embarkation_port$passenger_id,]$embarked <- "Southampton"
  
  return(df)
}



# ==========
# impute age 
# ==========

data_imputation_age <- function(df) { 
  
  # all passengers with no age 
  no_age <- df %>% 
    filter(is.na(age))
  
  # update age with median 
  df[no_age$passenger_id,]$age <- 29.81
  
  return(df)
  
}




