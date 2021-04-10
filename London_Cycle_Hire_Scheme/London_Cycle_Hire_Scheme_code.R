
# Upload packages ---------------------------------------------------------


pacman::p_load(readxl, lubridate, tidyverse, ggplot2, ggtext, hrbrthemes, gridExtra,patchwork, systemfonts, sysfonts,showtext, ggpubr,
               extrafont, systemfonts,circlepackeR,packcircles,viridis, ggflags, janitor,readr, scales)




# First graph -------------------------------------------------------------


London_bike_third_graph <-"London_bike_3" %>% 
  ggplot(aes(x = month2, y = Year)) +
  geom_tile(aes(fill = total_bikes), color = "#2b2b2b") +
  geom_text(aes(label = comma_format()(total_bikes)), color = "#22292F",size = 3.5)+
  scale_fill_gradient(low = "#ececc2", high = "#20b2aa")  +
  scale_x_discrete(position = "bottom")   +
  guides(fill = NULL) +
  theme(
    legend.position = "none",
    legend.title = element_blank(),
    strip.background = element_blank(),
    strip.text.x = element_blank(),
    axis.title.x = element_blank(),
    axis.text.x    = element_text(color = "#22222b", margin = margin(t = 15),family = font_labels),
    axis.text.y    = element_text(color = "#22222b",family = font_labels),
    axis.title.y = element_blank(),
    panel.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(), 
    panel.border = element_blank(),
    plot.background = element_rect(fill = "#f7f7f7", color = NA),
    plot.margin = unit(c(1, 0, 0, 1), "cm"),
    axis.ticks = element_blank()
  ) 






# Second graph ------------------------------------------------------------



London_bike_fourth_graph <- London_bike_4 %>% 
  ggplot(aes(x = Year, y = total_bikes,fill = total_bikes)) +
  geom_bar(stat="identity", width=0.8) +
  geom_text(aes(label = comma_format()(total_bikes)), color = "#22292F",hjust=-0.2, size = 3.5) +
  coord_flip()+
  scale_fill_gradient(low = "#ececc2", high = "#20b2aa") +
  scale_y_continuous(limit = c(0, 13000000), expand=c(0,1)) +
  guides(fill = NULL) +
  theme(
    axis.title.x =  element_blank(),
    axis.title.y =  element_blank(),
    legend.position = "none",
    axis.text.x    =  element_blank(),
    axis.text.y    =  element_blank(),
    panel.background = element_blank(),
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.background = element_rect(fill = "#f7f7f7", color = NA),
    plot.margin = unit(c(0, 2.8, 0, 0), "cm"),
    axis.ticks = element_blank(),
    strip.background = element_blank(),
    strip.text.x = element_blank()
  ) 






# Patchwork ---------------------------------------------------------------


patchworkLondon2<- London_bike_third_graph  | London_bike_fourth_graph


PLondon2 <- patchworkLondon2 + plot_annotation(title = "London Cycle Hire Scheme",
                                               subtitle = "Number of Bicycle Hires - 2010 to 2020",
                                               caption = "Source: data.london.gov.uk\nVisualization: JuanmaMN (Twitter @Juanma_MN)",
                                               theme = theme(plot.title = element_text(margin = margin(t=15,b = 8), 
                                                                                       color = "#000000",face = "bold",size = 14,
                                                                                       hjust = 0.5,
                                                                                       family = font_labels),
                                                             plot.subtitle = element_text(margin = margin(t=10, b = 25), 
                                                                                          color = "#000000", size = 10, family = font_labels,
                                                                                          hjust = 0.5),
                                                             plot.caption =  element_text(margin = margin(t = 20, b = 10), 
                                                                                          color = "#000000", size = 8, family = font_labels,
                                                                                          hjust = 0.95),
                                                             plot.background = element_rect(fill = "#f7f7f7"),
                                                             panel.border = element_blank()))




PLondon2


