  
  passengers <- train

  # ===========================================
  # survival analysis by title, split by gender 
  # ===========================================
  
  ggplot(passengers, aes(gender, title, color=as.character(survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    labs(title="Survival analysis by title", color='Survived', x="Gender", y="Title") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9"))
    
  