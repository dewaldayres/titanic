
df <- passengers %>% 
  filter(set=="train") %>% 
  group_by(survived) %>% 
  summarise(count = n()) %>% 
  arrange(desc(survived)) %>% 
  mutate(pos = cumsum(count)- count/2)

total <- sum(df$count)
df$percentage <- paste(format(round(df$count / total * 100, 2), nsmall = 2), "%")



ggplot(data=df) +
  geom_bar(stat="identity", width = 1, aes(x="", y=count, fill=survived)) +
  coord_polar("y", start=0) +
  theme_void() + 
  scale_fill_manual(values=c("#ff6961", "#56B4E9")) + 
  labs(fill="Survived", title="Passenger survival percentage") + 
  geom_text(aes(x="",y=pos, label=percentage)) + 
  theme(plot.title = element_text(hjust = 0.5))









