
  # =========================================
  # survival analysis by age, split by gender
  # =========================================  
  
  ggplot() + 
    geom_point() + 
    geom_jitter(data=passengers %>% filter(set=="train"), 
                mapping=aes(x=gender, y=age, color=as.character(survived)), 
                width=0.2, 
                height=0.2) + 
    labs(title="Survival analysis by age", 
         x="Gender", 
         y="Age") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9"), 
                       labels=c("Deceased", "Survived")) + 
    theme(plot.title = element_text(hjust = 0.5), 
          legend.title=element_blank())
  
  

  
