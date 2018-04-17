  
  library(plotly)  
  
  passengers <- train

  # survival analysis by fare, split by gender 
  
  ggplot(passengers, aes(Sex, Fare, color=as.character(Survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    ggtitle("Fare and gender survival analysis") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) +
    scale_y_continuous(breaks = seq(min(passengers$Fare), max(passengers$Fare), by = 50)) + 
    labs(color='Survived', x="Gender", y="Fare")