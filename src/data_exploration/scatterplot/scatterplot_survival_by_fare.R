  
  # ==========================================
  # survival analysis by fare, split by gender
  # ==========================================  
  
  ggplot() + 
    geom_point() + 
    geom_jitter(data=passengers %>% filter(set=="train"), 
                mapping=aes(x=gender, y=fare, color=as.character(survived)), 
				        width=0.35, 
				        height=0.35) + 
    labs(title="Survival analysis by fare", 
         x="Gender", 
         y="Fare") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9"), 
                       labels=c("Deceased", "Survived")) + 
    theme(plot.title = element_text(hjust = 0.5), 
          legend.title=element_blank())
    