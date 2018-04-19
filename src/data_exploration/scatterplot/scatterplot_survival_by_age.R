
  passengers <- train

  # =========================================
  # survival analysis by age, split by gender
  # =========================================  
  
  ggplot() + 
    #geom_point() + 
    geom_jitter(data=passengers, mapping=aes(x=gender, y=age, color=as.character(survived)), width=0.2, height=0.2) + 
    labs(title="Survival analysis by age", color="Survived", x="Gender", y="Age") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) + 
    theme(plot.title = element_text(hjust = 0.5))
  
  

  
