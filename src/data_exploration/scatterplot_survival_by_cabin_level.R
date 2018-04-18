  
  library(plotly)  
    
  passengers <- train

  # survival analysis by cabin level, split by gender 
  
  ggplot(passengers, aes(Sex, Level, color=as.character(Survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    ggtitle("Survival analysis by cabin level") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) +
    labs(color='Survived', x="Gender", y="Cabin level")