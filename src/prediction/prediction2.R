
set.seed(415)

passengers <- passengers %>% mutate_if(is.character,as.factor)

train <- passengers %>% filter(set=="train")
test <- passengers %>% filter(set=="test")
test <- within(test, rm(survived))



install.packages('party')
library(party)



set.seed(415)
fit <- cforest(as.factor(survived) ~ passenger_class + gender + age + siblings_spouses + parents_children + fare +
                 embarked + title + family_size,
               data = train, 
               controls=cforest_unbiased(ntree=2000, mtry=3))




Prediction <- predict(fit, test, OOB=TRUE, type = "response")
submit <- data.frame(passenger_id=test$passenger_id, survived=Prediction)

submit <- submit %>% mutate_if(is.factor,as.character)
submit$survived[submit$survived=="Yes"] <- "1"
submit$survived[submit$survived=="No"] <- "0"
colnames(submit)[colnames(submit) == 'passenger_id'] <- 'PassengerId'
colnames(submit)[colnames(submit) == 'survived'] <- 'Survived'


write.csv(submit, file = "./src/data/submit.csv", row.names=FALSE, quote=FALSE)











cTreeMod <- ctree (survived ~ ., data = train)  # fit cTree with 'Class' as dependent

actuals <- test$survived # actuals

predicted <- predict(cTreeMod, newdata = testData) # predicted

table(true = actuals, pred = predicted) # confusion matrix

mean (testData$Class != predicted) # Misclassification Error %