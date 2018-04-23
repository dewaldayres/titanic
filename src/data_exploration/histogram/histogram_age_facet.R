
# ========================
# age distribution (facet)
# ========================

ggplot() +
  geom_histogram(data=passengers %>% filter(set=="train"), 
                 aes(x=age, fill=survived), 
                 alpha=0.5) + 
  facet_grid(survived~.) +  
  scale_x_continuous(limits=c(0,85), 
                     breaks=seq(0,85,by=10)) + 
  scale_y_continuous(limits=c(0,55), 
                     breaks=seq(0,55,by=10)) + 
  scale_fill_manual(values=c("#ff6961", "#56B4E9"), 
                    labels=c("Deceased", "Survived")) + 
  labs(title="Age distribution", 
       x="Age", 
       y="Count") + 
  theme(plot.title=element_text(hjust=0.5), 
        strip.text.y=element_blank(), 
        legend.title=element_blank())