
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

answers <- read.table("./src/data/answers.csv", header=T, sep=",", stringsAsFactors=T)
test <- passengers %>% filter(set=="test") %>% mutate_if(is.factor,as.character)


# ===============
# column mappings 
# ===============

answers <- column_mappings(answers)


# =============
# data mappings 
# =============

answers <- data_mapping_survived(answers)
answers <- data_mapping_embarkation_port(answers)
answers <- data_mapping_gender(answers)


# ============================
# mutate characters to factors 
# ============================

answers <- answers %>% mutate_if(is.factor,as.character)
test <- test %>% mutate_if(is.factor,as.character)




validate <- left_join(test, answers, by=c("name"="name"))
