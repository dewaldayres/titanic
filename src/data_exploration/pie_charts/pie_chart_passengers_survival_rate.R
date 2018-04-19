
passengers <- train %>% 
  group_by(survived) %>% 
  summarise(count = n()) %>% 
  arrange(desc(survived)) %>% 
  mutate(pos = cumsum(count)- count/2)

passengers$survived[passengers$survived=="1"] <- "Yes"
passengers$survived[passengers$survived=="0"] <- "No"
total <- sum(passengers$count)
passengers$percentage <- paste(format(round(passengers$count / total * 100, 2), nsmall = 2), "%")



ggplot(data=passengers) +
  geom_bar(stat="identity", width = 1, aes(x="", y=count, fill=survived)) +
  coord_polar("y", start=0) +
  theme_void() + 
  scale_fill_manual(values=c("#ff6961", "#56B4E9")) + 
  labs(fill="Survived", title="Passenger survival percentage") + 
  geom_text(aes(x="",y=pos, label=percentage)) + 
  theme(plot.title = element_text(hjust = 0.5))









