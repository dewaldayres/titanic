  
  passengers <- train

  # survival analysis by passenger class, split by gender 
  
  ggplot(passengers, aes(gender, passenger_class, color=as.character(survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    ggtitle("Survival analysis by passenger class") + 
    labs(color='Survived', x="Gender", y="Passenger class") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) + 
    scale_y_continuous(breaks = seq(min(passengers$passenger_class), max(passengers$passenger_class), by = 1))
    