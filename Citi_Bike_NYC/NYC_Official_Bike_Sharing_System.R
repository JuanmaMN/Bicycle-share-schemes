
# Upload packages ---------------------------------------------------------


pacman::p_load(readxl, lubridate, tidyverse, ggplot2, ggtext, hrbrthemes, gridExtra,patchwork, systemfonts, sysfonts,showtext, ggpubr,
               extrafont, systemfonts,circlepackeR,packcircles,viridis, ggflags, janitor,readr, scales)


# First graph -------------------------------------------------------------

data_all_2_first_graph <-"data_source" %>% 
  ggplot(aes(x = month, y = year)) +
  geom_tile(aes(fill = total), color = "#2b2b2b") +
  geom_text(aes(label = comma_format(accuracy = 1)(total)), color = "#22292F",size = 3.5,family = font_labels)+
  scale_fill_gradient(low = "#ececc2", high = "#20b2aa")+
  scale_y_continuous(breaks = c(2013,2014,2015,2016,2017,2018,2019,2020)) +
  scale_x_discrete(position = "bottom") +
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

data_all_3_first_graph  <- "data_source"%>% 
  ggplot(aes(x = year, y = Total_Trips,fill = Total_Trips)) +
  geom_bar(stat="identity", width=0.8) +
  geom_text(aes(label = comma_format()(Total_Trips)), color = "#22292F",family = font_labels,hjust=-0.2, size = 3.5) +
  coord_flip()+
  scale_fill_gradient(low = "#ececc2", high = "#20b2aa")+
  scale_y_continuous(limit = c(0, 23551697), expand=c(0,1)) +
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
  )+annotate("text", x = 2014, y = 12000000, hjust = 0, vjust = 1,fontface=3, size = 3, colour = "#22292F",
             family = font_labels, label =  str_wrap("Note: This data has been processed to remove trips that 
                                                                               are taken by staff as they service and inspect the system, 
                                                                               trips that are taken to/from any of our test stations 
                                                                               (which we were using more in June and July 2013), 
                                                                               and any trips that were below 60 seconds in length 
                                                                               (potentially false starts or users trying to re-dock a 
                                                                               bike to ensure it's secure)."))


# Patchwork ---------------------------------------------------------------


patchworkNYC <- data_all_2_first_graph | data_all_3_first_graph


PNYC <- patchworkNYC + plot_annotation(title = "Citi Bike NYC",
                                       subtitle = " NYC's Official Bike Sharing System - monthly trip numbers",
                                       caption = "Source: www.citibikenyc.com\nVisualization: JuanmaMN (Twitter @Juanma_MN)",
                                       theme = theme(plot.title = element_text(margin = margin(t=10,b = 5), 
                                                                               color = "#000000",face = "bold",size = 14,
                                                                               hjust = 0.5,
                                                                               family = font_labels),
                                                     plot.subtitle = element_text(margin = margin(t=10, b = 5), 
                                                                                  color = "#000000", size = 10, family = font_labels,
                                                                                  hjust = 0.5),
                                                     plot.caption =  element_text(margin = margin(t = 20, b = 10), 
                                                                                  color = "#000000", size = 8, family = font_labels,
                                                                                  hjust = 0.95),
                                                     plot.background = element_rect(fill = "#f7f7f7"),
                                                     panel.border = element_blank()))
