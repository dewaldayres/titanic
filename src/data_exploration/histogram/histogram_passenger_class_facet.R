
# ====================================
# passenger class distribution (facet)
# ====================================

ggplot() +
  geom_bar(data=passengers %>% filter(set=="train"), 
           aes(x=passenger_class, fill=survived), 
           alpha=0.5) + 
  facet_grid(survived~.) +  
  scale_fill_manual(values=c("#ff6961", "#56B4E9"), 
                    labels=c("Deceased", "Survived")) + 
  labs(title="Passenger class distribution", 
       x="Passenger class", 
       y="Count") + 
  theme(plot.title=element_text(hjust=0.5), 
        strip.text.y=element_blank(), 
        legend.title=element_blank())
