
# Packages ----------------------------------------------------------------


pacman::p_load(readxl, lubridate, tidyverse, ggplot2, ggtext, hrbrthemes, gridExtra,patchwork, systemfonts, sysfonts,showtext, ggpubr,
               extrafont, systemfonts,circlepackeR,packcircles,viridis, ggflags, janitor,readr, scales)



# Fonts -------------------------------------------------------------------

extrafont::loadfonts(device = "win", quiet = TRUE)

font_add_google("Lora")

font_labels <- "Lora"

showtext_auto()


# Graph -------------------------------------------------------------------

First_graph_hour<-data_source %>% 
  ggplot(aes(x = hour, y = Day)) +
  geom_tile(aes(fill = total), color = "#2b2b2b") +
  geom_text(aes(label = comma_format(accuracy = 1)(total)), color = "#22292F",size = 3.5,family = font_labels)+
  scale_fill_gradient(low = "#ececc2", high = "#20b2aa")+
  scale_x_discrete(position = "top") +
  labs(x = "",y = "",
       title = "",
       subtitle = "",
       caption = "") +
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
    plot.margin = unit(c(0.5, 2, 0.2, 0.8), "cm"),
    axis.ticks = element_blank()
  ) 


PBoston_graph<- First_graph_hour + plot_annotation(title = "Bluebikes Boston - Metro Boston's public bike share program",
                                                  subtitle = "Total number of trips by day and hour in 2020",
                                                  caption = "Source: www.bluebikes.com\nVisualization: JuanmaMN (Twitter @Juanma_MN)",
                                                  theme = theme(plot.title = element_text(margin = margin(t=20,b = 5), 
                                                                                          color = "#000000",face = "bold",size = 14,
                                                                                          hjust = 0.06,
                                                                                          family = font_labels),
                                                                plot.subtitle = element_text(margin = margin(t=10, b = 5), 
                                                                                             color = "#000000", size = 10, family = font_labels,
                                                                                             hjust = 0.05),
                                                                plot.caption =  element_text(margin = margin(t = 20, b = 10), 
                                                                                             color = "#000000", size = 8, family = font_labels,
                                                                                             hjust = 0.995),
                                                                plot.background = element_rect(fill = "#f7f7f7"),
                                                                panel.border = element_blank()))