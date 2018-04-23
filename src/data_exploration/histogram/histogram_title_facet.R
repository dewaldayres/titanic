
# ================================
# family size distribution (facet)
# ================================

ggplot() +
  geom_bar(data=passengers %>% filter(set=="train"), 
                 aes(x=title, fill=survived), 
                 alpha=0.5) + 
  facet_grid(survived~.) +  
  scale_fill_manual(values=c("#ff6961", "#56B4E9"), 
                    labels=c("Deceased", "Survived")) + 
  labs(title="Title distribution", 
       x="Title", 
       y="Count") + 
  theme(plot.title=element_text(hjust=0.5), 
        strip.text.y=element_blank(), 
        legend.title=element_blank(),
        axis.text.x=element_text(angle=90,hjust=1))