
  # ======================================================
  # survival analysis by embarkation port, split by gender 
  # ======================================================
  
  ggplot() + 
    geom_point() + 
    geom_jitter(data=passengers %>% filter(set=="train"), 
                mapping=aes(x=gender, y=embarked, color=as.character(survived)), 
                width=0.35, 
                height=0.35) + 
    labs(title="Survival analysis by embarkation port", 
         x="Gender", 
         y="Embarkation port") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9"), 
                       labels=c("Deceased", "Survived")) + 
    theme(plot.title = element_text(hjust = 0.5), 
          legend.title=element_blank())
