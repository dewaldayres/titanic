  
  survivors <- passengers %>% filter(set=="train") %>% filter(survived=="Yes")

  # =====================================================
  # survival analysis by passenger class, split by gender 
  # =====================================================
  
  ggplot() + 
    geom_point() + 
    geom_jitter(data=survivors, mapping=aes(x=gender, y=passenger_class, color=as.character(survived)), width=0.35, height=0.35) + 
    labs(title="Survival analysis by passenger class", color='Survived', x="Gender", y="Passenger class") + 
    scale_color_manual(values=c("#ff6961", "#56B4E9")) + 
    scale_y_continuous(breaks = seq(min(passengers$passenger_class), max(passengers$passenger_class), by = 1)) + 
    theme(plot.title = element_text(hjust = 0.5))
    