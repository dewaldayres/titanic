
passengers <- train

# ==========================
# passenger age distribution
# ==========================

ggplot() +
  geom_histogram(data=passengers,aes(x=age), fill = "blue", alpha = 0.5) + 
  labs(title="Passenger age distribution", x="Age", y="Count") + 
  theme(plot.title = element_text(hjust = 0.5))
