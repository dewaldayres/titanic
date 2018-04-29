library(rpart) 
library(caret)


set.seed(415)

passengers <- passengers %>% mutate_if(is.character,as.factor)

train <- passengers %>% filter(set=="train")
test <- passengers %>% filter(set=="test")
test <- within(test, rm(survived))



model.single <- rpart(survived ~ passenger_class + gender + fare + family_size + title, 
                      data = train, method = "class")

predict.single <- predict(object = model.single, newdata = train, type = "class")

library(RGtk2)
library(cairoDevice)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(model.single)