

#
# randomforest prediction
#


set.seed(415)

passengers <- passengers %>% mutate_if(is.character,as.factor)

train <- passengers %>% filter(set=="train")
test <- passengers %>% filter(set=="test")
test <- within(test, rm(survived))



# fit <- randomForest(as.factor(survived) ~ passenger_class + gender + age + siblings_spouses + parents_children + fare + level + family_size + title, # 76.55
# fit <- randomForest(as.factor(survived) ~ passenger_class + gender + age + fare + level + family_size + title, # 77.03 
# fit <- randomForest(as.factor(survived) ~ passenger_class + gender + fare + family_size + title, # 80.38
# fit <- randomForest(as.factor(survived) ~ passenger_class + gender + family_size + title, # 78.94
# fit <- randomForest(as.factor(survived) ~ passenger_class + fare + title,                 # 78.46
fit <- randomForest(as.factor(survived) ~ age + fare + title + gender, 
                    data=train, 
                    importance=TRUE, 
                    ntree=2000)




varImpPlot(fit)

Prediction <- predict(fit, test)
submit <- data.frame(passenger_id=test$passenger_id, survived=Prediction)


submit <- submit %>% mutate_if(is.factor,as.character)
submit$survived[submit$survived=="Yes"] <- "1"
submit$survived[submit$survived=="No"] <- "0"
colnames(submit)[colnames(submit) == 'passenger_id'] <- 'PassengerId'
colnames(submit)[colnames(submit) == 'survived'] <- 'Survived'

write.csv(submit, file=paste("./src/submission/submission_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".csv",sep=""), row.names=FALSE, quote=FALSE)




