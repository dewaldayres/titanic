data_imputation <- function(df) {
  
  # embarkation port 
  df$Embarked[df$Embarked==""] <- "S"
  
  return(df)
}
