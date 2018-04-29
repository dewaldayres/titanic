library(rpart) 
library(caret)


set.seed(415)

passengers <- passengers %>% mutate_if(is.character,as.factor)
passengers <- passengers %>% mutate_if(is.integer,as.factor)

train <- passengers %>% filter(set=="train")
test <- passengers %>% filter(set=="test")
test <- within(test, rm(survived))



model.single <- rpart(survived ~ passenger_class + gender + fare + family_size + title,
                      data = train, method = "class")

predict.single <- predict(object = model.single, newdata = train, type = "class")


confusionMatrix(predict.single, train$survived)


submit <- data.frame(passenger_id=test$passenger_id, survived=predict.single)




submit <- submit %>% mutate_if(is.factor,as.character)
submit$survived[submit$survived=="Yes"] <- "1"
submit$survived[submit$survived=="No"] <- "0"
colnames(submit)[colnames(submit) == 'passenger_id'] <- 'PassengerId'
colnames(submit)[colnames(submit) == 'survived'] <- 'Survived'

write.csv(submit, file=paste("./src/submission/submission_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".csv",sep=""), row.names=FALSE, quote=FALSE)
 
library(RGtk2)
library(cairoDevice)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(model.single)