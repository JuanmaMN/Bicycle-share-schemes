
# Fonts -------------------------------------------------------------------

extrafont::loadfonts(device = "win", quiet = TRUE)

font_add_google("Lora")

font_labels <- "Lora"

showtext_auto()



# Graph -------------------------------------------------------------------


top_10_graph <- data_source %>%ggplot() +
  geom_text(aes(x = 10, y = seq(-10,-1, by = 1), label = label_2), hjust = 0, 
            color = "#525252",  size = 4, 
            family = font_labels) +
  geom_text(aes(x = 10.1, y = seq(-10,-1, by = 1), label = comma_format()(total_2020)), hjust = 0.5, 
            color = "#525252",  size = 3.5, 
            family = font_labels) +
  geom_text(aes(x = 10.18, y = seq(-10,-1, by = 1), label = paste0(avg_trip_min, " ", "min")), hjust = 0.5, 
            color = "#525252",  size = 3.5, 
            family = font_labels) +
  geom_text(aes(x = 10.1, y = 0, label = "Number of trips"), hjust = 0.5, 
            color = "#525252",  size = 4, 
            family = font_labels) +
  geom_text(aes(x = 10.18, y = 0, label = "Avg. trip duration (minutes)"), hjust = 0.5, 
            color = "#525252",  size = 4, 
            family = font_labels) +
  scale_x_continuous(limits = c(10,10.2)) +
  scale_y_continuous(limits = c(-10.5,0))  +
  labs(y = "",
       title = " NYC's Official Bike Sharing System - Top 10 start station names in 2020",
       subtitle =  " ",
       caption =  "Source: www.citibikenyc.com\nVisualization: JuanmaMN (Twitter @Juanma_MN)") +
  theme(
    plot.title = element_text(margin = margin(b = 5), 
                              color = "#000000",face = "bold",size = 16,
                              hjust = 0.07,
                              family = font_labels),
    plot.subtitle = element_text(margin = margin(t=10, b = 5), 
                                 color = "#000000", size = 14, family = font_labels,
                                 hjust = 0),
    plot.caption =  element_text(margin = margin(t = 20, b = 10), 
                                 color = "#000000", size = 8, family = font_labels,
                                 hjust = 0.95),
    axis.title.x = element_blank(), 
    axis.title.y = element_blank(), 
    axis.text.y    = element_blank(),
    axis.text.x = element_blank(), 
    panel.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.margin = unit(c(2, 1, 1, 2), "cm"),
    plot.background = element_rect(fill = "#f7f7f7", color = NA),    # color removes the border,
    axis.ticks = element_blank())


top_10_graph