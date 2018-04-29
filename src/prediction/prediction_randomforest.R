
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
passengers[test$passenger_id,]$survived <- prediction

# confusionMatrix(Prediction, test$survived)

submit <- passengers %>% 
  filter(set=="test") %>% 
  mutate_if(is.factor,as.character) %>% 
  select(passenger_id, survived)

submit$survived[submit$survived=="Yes"] <- "1"
submit$survived[submit$survived=="No"] <- "0"
colnames(submit)[colnames(submit) == "passenger_id"] <- "PassengerId"
colnames(submit)[colnames(submit) == "survived"] <- "Survived"

write.csv(submit, file=paste("./src/submission/submission_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".csv",sep=""), row.names=F, quote=F)

rm(list = ls()[ls()!="passengers"])




