data_mappings <- function(df) {
  
  df$Embarked[df$Embarked=="C"] <- "Cherbourg"
  df$Embarked[df$Embarked=="Q"] <- "Queenstown"
  df$Embarked[df$Embarked=="S"] <- "Southampton"
  
  df$Sex[df$Sex=="female"] <- "Female"
  df$Sex[df$Sex=="male"] <- "Male"
  
  return(df)
}


