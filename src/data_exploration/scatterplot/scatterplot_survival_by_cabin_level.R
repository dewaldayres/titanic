  
  passengers <- train

  # =================================================
  # survival analysis by cabin level, split by gender
  # =================================================
  
  ggplot() + 
    geom_point() + 
    geom_jitter(data=passengers, mapping=aes(x=gender, y=level, color=as.character(survived)), width=0.35, height=0.35) + 
    labs(title="Survival analysis by cabin level", color='Survived', x="Gender", y="Cabin level") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) + 
    theme(plot.title = element_text(hjust = 0.5))
