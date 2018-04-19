  
  passengers <- train
  
  # =================================================
  # survival analysis by family size, split by gender 
  # =================================================
  
  ggplot(passengers, aes(gender, family_size, color=as.character(survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    labs(title="Survival analysis by family size", color='Survived', x="Gender", y="Family Size") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) +
    scale_y_continuous(breaks = seq(min(passengers$family_size), max(passengers$family_size), by = 1))
