
  ggplot() + 
    geom_bar(data=passengers, aes(as.character(survived), fill=as.character(survived))) + 
    ggtitle("Survival analysis for passengers") + 
    labs(x="Survived", y="Number of passengers") + 
    scale_fill_manual(values=c("#ff6961", "#56B4E9")) + 
    guides(fill=FALSE)
  
  
  
  