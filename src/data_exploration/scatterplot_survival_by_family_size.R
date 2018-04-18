  
  library(plotly)
  
  passengers <- train

  # survival analysis by family size, split by gender 
  
  ggplot(passengers, aes(Sex, FamilySize, color=as.character(Survived))) + 
    geom_point() + 
    geom_jitter(width=0.35, height=0.35) + 
    ggtitle("Survival analysis by family size") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) +
    scale_y_continuous(breaks = seq(min(passengers$FamilySize), max(passengers$FamilySize), by = 1)) + 
    labs(color='Survived', x="Gender", y="Family Size")