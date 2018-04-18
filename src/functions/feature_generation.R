
# ======================
# generate title feature 
# ======================

feature_generation_title <- function(df) {
  
  df$title <- gsub('(.*, )|(\\..*)', '', df$name)
  
  return(df)
}


# ============================
# generate family size feature 
# ============================

feature_generation_family_size <- function(df) {
  
  df$family_size <-  df$siblings_spouses + df$parents_children + 1 

  return(df)
}


# ============================
# generate cabin level feature 
# ============================

feature_generation_cabin_level <- function(df) {
  
  df$level <- substr(df$cabin,1,1)
  
  return(df)
}

