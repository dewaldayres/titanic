
  library(plotly)

  passengers <- train

  # survival analysis by age, split by gender 
  
  ggplot(passengers, aes(Sex, Age, color=as.character(Survived))) + 
    geom_point() + 
    geom_jitter(width=0.4, height=0.4) + 
    ggtitle("Survival analysis by age") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) + 
    labs(color='Survived', x="Gender")
  
