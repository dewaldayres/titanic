  
  passengers <- train

  # =================================================
  # survival analysis by cabin level, split by gender
  # =================================================
  
  ggplot(passengers, aes(gender, level, color=as.character(survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    labs(title="Survival analysis by cabin level", color='Survived', x="Gender", y="Cabin level") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9"))
