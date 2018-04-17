
  
  # ==========================================
  #           Import and prepare data 
  # ==========================================
  
  # 
  # Script functionality
  # 
  #   * loading training data
  #   * data imputation
  #   * data mappings 
  #   * feature generation 
  #   * pre-and post-cleanup
  # 
  
  
  # =======
  # imports
  # =======
  
  library(plyr)
  library(dplyr)
  library(stringr)
  
  
  # =======
  # sources 
  # =======
  
  source("./src/functions/data_mappings.R")
  source("./src/functions/feature_generation.R")
  source("./src/functions/data_imputation.R")
  
  
  # ===========
  # pre-cleanup
  # ===========
  
  if (exists("train"))        
    rm(train)


  # ============
  # loading data
  # ============
  
  train <- read.table("./data/train.csv", header = TRUE, sep = ",", stringsAsFactors = F)
  
  
  # ===============
  # data imputation
  # ===============
  
  # train <- data_imputation(train)
  
  
  
  
  
  
  
  
  # =============
  # data mappings 
  # =============
  
  train <- data_mappings(train)
  
  
  # ==================
  # feature generation 
  # ==================
  
  train <- feature_generation(train)
  
  
  # ============
  # post-cleanup
  # ============
  
  if (exists("data_mappings"))             
    rm(data_mappings)
  
  if (exists("feature_generation"))        
    rm(feature_generation)
  
  if (exists("data_imputation"))           
    rm(data_imputation)
  



  
