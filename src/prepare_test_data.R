
  
  # ==========================================
  #           Import and prepare data 
  # ==========================================
  
  # 
  # Script functionality
  # 
  #   * loading test data
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
  
  getwd()
  
  # =======
  # sources 
  # =======
  
  source("./src/functions/data_mappings.R")
  source("./src/functions/feature_generation.R")
  source("./src/functions/data_imputation.R")
  
  
  # ===========
  # pre-cleanup
  # ===========
  
  if (exists("test"))        
      rm(test)

  
  # ============
  # loading data
  # ============
  
  test <- read.table("./data/test.csv", header = TRUE, sep = ",", stringsAsFactors = F)

  
  # ===============
  # data imputation
  # ===============
  
  # test <- data_imputation(test)
  
  
  # =============
  # data mappings 
  # =============
  
  test <- data_mappings(test)
  
  
  # ==================
  # feature generation 
  # ==================
  
  test <- feature_generation(test)
  
  
  # ============
  # post-cleanup
  # ============
  
  if (exists("data_mappings"))             
    rm(data_mappings)
  
  if (exists("feature_generation"))        
    rm(feature_generation)
  
  if (exists("data_imputation"))          
    rm(data_imputation)
  



  
