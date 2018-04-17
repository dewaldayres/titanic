feature_generation <- function(df) {
  
  # title
  df$Title <- gsub('(.*, )|(\\..*)', '', df$Name)
  
  # family size 
  # calculated by adding all parents and siblings, and the passenger
  df$FamilySize <- df$SibSp + df$Parch + 1 
  
  # cabin level 
  df$Level <- substr(df$Cabin,1,1)
  
  return(df)
}
