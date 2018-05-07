
# ====================
# source all functions
# ====================

source_path <- "./src/functions/"
files <- list.files(source_path)

for (f in files)
  source(paste(source_path,f, sep=""))


# ============
# loading data
# ============

answers <- read.table("./src/data/answers.csv", header=T, sep=",", stringsAsFactors=F)
test <- passengers %>% filter(set=="test") %>% mutate_if(is.factor,as.character)


# ============================
# mutate factors to characters 
# ============================

answers <- answers %>% mutate_if(is.factor,as.character)
test <- test %>% mutate_if(is.factor,as.character)


# =============
# data mappings 
# =============

answers <- data_mapping_survived(answers)
answers <- data_mapping_embarkation_port(answers)
answers <- data_mapping_gender(answers)


# ==============================
# join test dataset with answers
# ==============================

validate <- left_join(test, answers, by=c("name"="name"))



# =====================
# remove duplicate rows 
# =====================

validate <- validate[-c(2,8),]


# 
# 
# 

matched <- validate %>% filter(survived.x==survived.y)  %>% select(survived.x, survived.y)
non.matched <- validate %>% filter(survived.x!=survived.y) %>% select(survived.x, survived.y)


validate <- validate %>% 
  mutate(matched=if_else(survived.x==survived.y,"matched","novalue"))

x <- validate %>% filter(matched=="novalue")




