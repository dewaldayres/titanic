  
  passengers <- train

  # ======================================================
  # survival analysis by embarkation port, split by gender 
  # ======================================================
  
  ggplot(passengers, aes(gender, embarked, color=as.character(survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    labs(title="Survival analysis by embarkation port", color='Survived', x="Gender", y="Embarkation port") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9"))
