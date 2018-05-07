
#                 
# randomforest prediction
#

set.seed(415)


train <- passengers %>% filter(set=="train")
test <- passengers %>% filter(set=="test")
test <- within(test, rm(survived))


 fit <- randomForest(survived ~ passenger_class + gender + age + fare + family_size + title, # 80.38
                    data=train, 
                    importance=TRUE, 
                    ntree=2000)

# varImpPlot(fit)

prediction <- predict(fit, test)
test$survived <- prediction
passengers[test$passenger_id,]$survived <- prediction

# confusionMatrix(prediction, test$survived)






