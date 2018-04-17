subset <- subset(train, 
                 Embarked == "Southampton" & 
                   Pclass == "1" & 
                   Fare == "0")



update <- subset(train, 
                 Embarked == "Southampton" & 
                   Pclass == "1" & 
                   Fare != "0")


subset(train, Embarked == "Southampton" & Pclass == "2" & Fare != "0")
subset(train, Embarked == "Southampton" & Pclass == "3" & Fare != "0")

median(subset$Fare)

train[subset$PassengerId,]$Fare <- 0.1234

