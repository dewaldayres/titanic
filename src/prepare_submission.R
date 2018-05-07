
# ==================
# prepare submission
# ==================

submit <- passengers %>% 
  filter(set=="test") %>% 
  mutate_if(is.factor,as.character) %>% 
  select(passenger_id, survived)


# ============
# prepare data
# ============

submit$survived[submit$survived=="Yes"] <- "1"
submit$survived[submit$survived=="No"] <- "0"
colnames(submit)[colnames(submit)=="passenger_id"] <- "PassengerId"
colnames(submit)[colnames(submit)=="survived"] <- "Survived"


# ===========
# create .csv
# ===========

write.csv(submit, file=paste("./src/data/submission/submission_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".csv",sep=""), row.names=F, quote=F)


# =======
# cleanup  
# =======

rm(list = ls()[ls()!="passengers"])