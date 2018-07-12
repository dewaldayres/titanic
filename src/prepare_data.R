
# ===========
# pre-cleanup
# ===========

rm(list = ls())


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

train <- read.table("./src/data/train.csv", header=T, sep=",", stringsAsFactors=F)
test <- read.table("./src/data/test.csv", header=T, sep=",", stringsAsFactors=F)


# ================
# combine datasets 
# ================

train$Set <- "train"
test$Set <- "test"
test$Survived <- NA

passengers <- rbind(train, test)


# ===============
# column mappings 
# ===============

passengers <- column_mappings(passengers)


# =============
# data mappings 
# =============

passengers <- data_mapping_survived(passengers)
passengers <- data_mapping_embarkation_port(passengers)
passengers <- data_mapping_gender(passengers)


# ================
# data imputations
# ================

passengers <- data_imputation_fare(passengers)
passengers <- data_imputation_embarkation(passengers)
passengers <- data_imputation_age(passengers)


# ==================
# feature generation 
# ==================

passengers <- feature_generation_cabin_level(passengers)
passengers <- feature_generation_family_size(passengers)
passengers <- feature_generation_title(passengers)


# ============================
# mutate characters to factors 
# ============================

passengers <- passengers %>% mutate_if(is.character,as.factor)


# ============
# post-cleanup
# ============

# remove all objects except for the "passengers" dataset 
rm(list = ls()[ls()!="passengers"])








