
deceased <- passengers %>% filter(survived=="No")

# =========================
# deceased age distribution
# =========================

ggplot() +
  geom_histogram(data=deceased,aes(x=age), fill = "#ff6961", alpha = 0.5) + 
  scale_x_continuous(limits = c(0, 85), breaks = seq(0, 85, by = 10)) + 
  scale_y_continuous(limits = c(0, 55), breaks = seq(0, 55, by = 10)) + 
  labs(title="Deceased age distribution", x="Age", y="Count") + 
  theme(plot.title = element_text(hjust = 0.5))
  


    