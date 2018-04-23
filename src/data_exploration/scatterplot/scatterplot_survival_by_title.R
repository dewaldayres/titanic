  
  # ===========================================
  # survival analysis by title, split by gender 
  # ===========================================
  
  ggplot() + 
    geom_point() + 
    geom_jitter(data=passengers %>% filter(set=="train"), 
                mapping=aes(x=gender, y=title, color=as.character(survived)), 
                width=0.35, 
                height=0.35) + 
    labs(title="Survival analysis by title", 
         x="Gender", 
         y="Title") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) + 
    theme(plot.title = element_text(hjust = 0.5))
    
  