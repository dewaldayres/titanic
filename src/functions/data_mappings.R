
# ====================
# map embarkation port 
# ====================

data_mapping_embarkation_port <- function(df) {
  
  df$embarked[df$embarked=="C"] <- "Cherbourg"
  df$embarked[df$embarked=="Q"] <- "Queenstown"
  df$embarked[df$embarked=="S"] <- "Southampton"
  
  return(df)
}


# ==========
# map gender 
# ==========

data_mapping_gender <- function(df) {
  
  df$gender[df$gender=="female"] <- "Female"
  df$gender[df$gender=="male"] <- "Male"
  
  return(df)
}


