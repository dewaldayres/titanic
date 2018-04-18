

  passengers <- train
  
  plot_ly(passengers, x = ~age, type = "histogram")
  
  
  survivors <- passengers %>% filter(survived=="1")
  deceased <- passengers %>% filter(survived=="0")
  
  
  plot_ly(alpha = 0.6) %>%
    add_histogram(x=~survivors$age) %>%
    add_histogram(x=~deceased$age) %>%
    layout(barmode = "overlay")
  
  
  ggplot(passengers,aes(x=age)) +
    geom_histogram(data=subset(passengers,survived == '0'),fill = "red", alpha = 0.5) +
    geom_histogram(data=subset(passengers,survived == '1'),fill = "blue", alpha = 0.5) 
    
    
    ggplot(data=subset(passengers,survived == '1'),aes(x=age)) + 
      geom_histogram()