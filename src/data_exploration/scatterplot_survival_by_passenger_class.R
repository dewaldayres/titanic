  
  library(plotly)
  
  passengers <- train

  # survival analysis by passenger class, split by gender 
  
  ggplot(passengers, aes(Sex, Pclass, color=as.character(Survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    ggtitle("Passenger class and gender survival analysis") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) + 
    scale_y_continuous(breaks = seq(min(passengers$Pclass), max(passengers$Pclass), by = 1)) + 
    labs(color='Survived', x="Gender", y="Passenger class")