
  
  # ==========================================
  #           Import and prepare data 
  # 
  #
  #
  # ==========================================
  
  # 
  # Script functionality
  # 
  #   * loading training data
  #   * column mappings
  #   * data mappings 
  #   * data imputation
  #   * feature generation 
  #   * pre-and post-cleanup
  # 
  
  
  # ====================
  # source all functions
  # ====================
  
  source_path <- "./src/functions/"
  files <- list.files(source_path)
  
  for (f in files)
    source(paste(source_path,f, sep=""))
  
  
  # ===========
  # pre-cleanup
  # ===========
  
  if (exists("train"))        
    rm(train)


  # ============
  # loading data
  # ============
  
  train <- read.table("./src/data/train.csv", header = TRUE, sep = ",", stringsAsFactors = F)
  
  
  # ===============
  # column mappings 
  # ===============
  
  train <- column_mappings(train)
  
  
  # =============
  # data mappings 
  # =============
  
  train <- data_mapping_survived(train)
  train <- data_mapping_embarkation_port(train)
  train <- data_mapping_gender(train)
  
  
  # ===============
  # data imputation
  # ===============
  
  train <- data_imputation_fare(train)
  
  
  # ==================
  # feature generation 
  # ==================
  
  train <- feature_generation_cabin_level(train)
  train <- feature_generation_family_size(train)
  train <- feature_generation_title(train)


  # ============
  # post-cleanup
  # ============
  
  # remove all objects except for the "train" dataset 
  rm(list = ls()[ls()!="train"])

  
  
  




  
