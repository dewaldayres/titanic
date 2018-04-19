

  passengers <- train
  survivors <- passengers %>% filter(survived=="1")
  deceased <- passengers %>% filter(survived=="0")
  
  
  # ==========================
  # passenger age distribution
  # ==========================
  
  ggplot(passengers,aes(x=age)) +
    geom_histogram(fill = "red", alpha = 0.5) + 
    scale_x_continuous(limits = c(0, 85), breaks = seq(0, 85, by = 10)) + 
    scale_y_continuous(limits = c(0, 80), breaks = seq(0, 80, by = 10))

  # =========================
  # survivor age distribution
  # =========================
  
  ggplot(survivors,aes(x=age)) +
    geom_histogram(fill = "#56B4E9", alpha = 0.5) + 
    scale_x_continuous(limits = c(0, 85), breaks = seq(0, 85, by = 10)) + 
    scale_y_continuous(limits = c(0, 80), breaks = seq(0, 80, by = 10))
  
  # =========================
  # deceased age distribution
  # =========================
  
  ggplot(deceased,aes(x=age)) +
    geom_histogram(fill = "#ff6961", alpha = 0.5) + 
    scale_x_continuous(limits = c(0, 85), breaks = seq(0, 85, by = 10)) + 
    scale_y_continuous(limits = c(0, 80), breaks = seq(0, 80, by = 10))
  
  # =========================
  # combined age distribution
  # =========================
  
  ggplot(passengers) +
    geom_histogram(data=deceased, aes(x=age, fill = "#ff6961"), alpha = 0.5) +
    geom_histogram(data=survivors, aes(x=age, fill = "#56B4E9"), alpha = 0.5) +
    scale_x_continuous(limits = c(0, 85), breaks = seq(0, 85, by = 10)) + 
    scale_y_continuous(limits = c(0, 80), breaks = seq(0, 80, by = 10)) + 
    scale_fill_manual(name="", values=c("#ff6961","#56B4E9"),labels=c("Deceased","Survived")) 

    