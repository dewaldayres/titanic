
  passengers <- train

  # =========================================
  # survival analysis by age, split by gender
  # =========================================  
  
  ggplot(passengers, aes(gender, age, color=as.character(survived))) + 
    geom_point() + 
    geom_jitter(width=0.3, height=0.3) + 
    labs(title="Survival analysis by age", color="Survived", x="Gender") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9"))

  
