#install.packages("randomForest")
#library(randomForest)


set.seed(415)

passengers <- passengers %>% mutate_if(is.character,as.factor)

train <- passengers %>% filter(set=="train")
train <- na.omit(train)


test <- passengers %>% filter(set=="test")
test <- within(test, rm(survived))
test <- na.omit(test)








str(train) 
str(test)

fit <- randomForest(as.factor(survived) ~ passenger_class + gender + age + siblings_spouses + parents_children + fare +
                      level + family_size + title,
                    data=train, 
                    importance=TRUE, 
                    ntree=2000)




# https://stats.stackexchange.com/questions/29446/random-forest-how-to-handle-new-factor-levels-in-test-set?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa



varImpPlot(fit)

Prediction <- predict(fit, test)
submit <- data.frame(passenger_id = test$passenger_id, survived = Prediction)



  
submit$survived[submit$survived=="Yes"] <- "1"
submit$survived[submit$survived=="No"] <- "0"
colnames(submit)[colnames(submit) == 'passenger_id'] <- 'PassengerId'
colnames(submit)[colnames(submit) == 'survived'] <- 'Survived'



write.csv(submit, file = "./src/data/submit.csv", row.names = FALSE)








install.packages('party')
library(party)



set.seed(415)
fit <- cforest(as.factor(Survived) ~ Pclass + Sex + Age + SibSp + Parch + Fare +
                   Embarked + Title + FamilySize + FamilyID,
                 data = train, 
                 controls=cforest_unbiased(ntree=2000, mtry=3))




Prediction <- predict(fit, test, OOB=TRUE, type = "response")