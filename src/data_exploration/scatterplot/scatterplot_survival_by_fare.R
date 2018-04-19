  
  passengers <- train

  # ==========================================
  # survival analysis by fare, split by gender
  # ==========================================  
  
  ggplot(passengers, aes(gender, fare, color=as.character(survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    labs(title="Survival analysis by fare", color='Survived', x="Gender", y="Fare") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) +
    scale_y_continuous(breaks = seq(min(passengers$fare), max(passengers$fare), by = 50))
    