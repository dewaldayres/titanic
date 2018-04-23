
# ================================
# family size distribution (facet)
# ================================

ggplot() +
  geom_histogram(data=passengers %>% filter(set=="train"), 
                 aes(x=family_size, fill=survived), 
                 alpha=0.5) + 
  facet_grid(survived~.) +  
  scale_x_continuous(breaks=seq(0,15,by=1)) + 
  scale_fill_manual(values=c("#ff6961", "#56B4E9"), 
                    labels=c("Deceased", "Survived")) + 
  labs(title="Family size distribution", 
       x="Family size", 
       y="Count") + 
  theme(plot.title=element_text(hjust=0.5), 
        strip.text.y=element_blank(), 
        legend.title=element_blank())