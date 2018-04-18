
# ======================
# generate title feature 
# ======================

feature_generation_title <- function(df) {
  
  df$Title <- gsub('(.*, )|(\\..*)', '', df$Name)
  
  return(df)
}


# ============================
# generate family size feature 
# ============================

feature_generation_family_size <- function(df) {
  
  df$FamilySize <- df$SibSp + df$Parch + 1 

  return(df)
}


# ============================
# generate cabin level feature 
# ============================

feature_generation_cabin_level <- function(df) {
  
  df$Level <- substr(df$Cabin,1,1)
  
  return(df)
}

