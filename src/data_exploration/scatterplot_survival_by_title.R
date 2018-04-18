  
  library(plotly)

  passengers <- train

  # survival analysis by title, split by gender 
  
  ggplot(passengers, aes(Sex, Title, color=as.character(Survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    ggtitle("Survival analysis by title") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) +
    labs(color='Survived', x="Gender", y="Title")
  