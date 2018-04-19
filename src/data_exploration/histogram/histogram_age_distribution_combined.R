
survivors <- train %>% filter(survived=="1")
deceased <- train %>% filter(survived=="0")

# =========================
# combined age distribution
# =========================

ggplot() +
  geom_histogram(data=deceased, aes(x=age, fill = "#ff6961"), alpha = 0.5) +
  geom_histogram(data=survivors, aes(x=age, fill = "#56B4E9"), alpha = 0.5) +
  scale_x_continuous(limits = c(0, 85), breaks = seq(0, 85, by = 10)) + 
  scale_y_continuous(limits = c(0, 55), breaks = seq(0, 55, by = 10)) + 
  scale_fill_manual(name="", values=c("#56B4E9", "#ff6961"),labels=c("Survived","Deceased")) + 
  labs(title="Combined age distribution", x="Age", y="Count") + 
  theme(plot.title = element_text(hjust = 0.5), legend.position="none")


  


    