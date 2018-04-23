
# ===================================
# map column names to be more uniform
# ===================================

column_mappings <- function(df) {
  
  colnames(df)[colnames(df) == 'PassengerId'] <- 'passenger_id'
  colnames(df)[colnames(df) == 'Survived'] <- 'survived'
  colnames(df)[colnames(df) == 'Pclass'] <- 'passenger_class'
  colnames(df)[colnames(df) == 'Name'] <- 'name'
  colnames(df)[colnames(df) == 'Sex'] <- 'gender'
  colnames(df)[colnames(df) == 'Age'] <- 'age'
  colnames(df)[colnames(df) == 'SibSp'] <- 'siblings_spouses'
  colnames(df)[colnames(df) == 'Parch'] <- 'parents_children'
  colnames(df)[colnames(df) == 'Ticket'] <- 'ticket'
  colnames(df)[colnames(df) == 'Fare'] <- 'fare'
  colnames(df)[colnames(df) == 'Cabin'] <- 'cabin'
  colnames(df)[colnames(df) == 'Embarked'] <- 'embarked'
  colnames(df)[colnames(df) == 'Set'] <- 'set'
  
  return(df)
}