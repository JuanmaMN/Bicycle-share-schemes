# Upload packages ---------------------------------------------------------


pacman::p_load(readxl, lubridate, tidyverse, ggplot2, ggtext, hrbrthemes, gridExtra,patchwork, systemfonts, sysfonts,showtext, ggpubr,
               extrafont, systemfonts,circlepackeR,packcircles,viridis, ggflags, janitor,readr, scales)


# Graph -------------------------------------------------------------------

graph<- ggplot("data_source", aes(x=Day, y=total, fill = usertype)) +
  geom_bar(stat="identity",  width=0.4, position=position_dodge(width = 0.5)) +
  scale_y_continuous(breaks = seq(0, 2750000,by =500000),limits=c(0, 2750000), labels = c(" ","500,000","1,000,000","1,500,000","2,000,000", " "),
                     expand = c(.007, .007))+
  scale_fill_manual(values = c("#8fb9c9", "#c0d8c5")) +
  theme_ipsum_rc() +
  labs(y = "",
       title = "NYC's Official Bike Sharing System - Number of trips by day of the week",
       subtitle =  "Subscriber and Customer trip analysis in 2020",
       caption =  "Source: www.citibikenyc.com\nVisualization: JuanmaMN (Twitter @Juanma_MN)")  +
  theme(
    plot.title = element_text(margin = margin(b = 5), 
                              color = "#000000",face = "bold",size = 16,
                              hjust = 0,
                              family = font_labels),
    plot.subtitle = element_text(margin = margin(t=10, b = 5), 
                                 color = "#000000", size = 14, family = font_labels,
                                 hjust = 0),
    plot.caption =  element_text(margin = margin(t = 20, b = 10), 
                                 color = "#000000", size = 8, family = font_labels,
                                 hjust = 0.95),
    axis.title.x = element_blank(), 
    axis.title.y = element_blank(), 
    axis.text.y    = element_text(color = "#525252", size = 10, family = font_labels,margin = margin(r = 0)),
    axis.text.x = element_text(color = "#525252", size = 10, family = font_labels,margin = margin(r = 0)),  
    panel.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.margin = unit(c(2, 3, 2, 3), "cm"),
    plot.background = element_rect(fill = "#f7f7f7", color = NA),    # color removes the border,
    axis.ticks = element_blank(),
    legend.position = "bottom",
    legend.text=element_text(size=8, color = "#525252"),
    legend.key.size = unit(0.2, "cm"),
    legend.title = element_blank(),
    legend.key = element_blank(),
    legend.background=element_blank(),
    legend.margin=margin(t=1, b = 0.1, unit='cm')) +
  guides(fill = guide_legend(
    label.position = "bottom",
    nrow = 1,
    family = font_labels, 
    color = "#525252",
    keywidth = 3, keyheight = 0.5)) +
  geom_segment(aes(x=0.5,xend=7.5,y=0,yend=0),linetype="dotted",colour = "#525252") +
  geom_segment(aes(x=0.5,xend=7.5,y=500000,yend=500000),linetype="dotted",colour = "#525252")+
  geom_segment(aes(x=0.5,xend=7.5,y=1000000,yend=1000000),linetype="dotted",colour = "#525252") +
  geom_segment(aes(x=0.5,xend=7.5,y=1500000,yend=1500000),linetype="dotted",colour = "#525252") +
  geom_segment(aes(x=0.5,xend=7.5,y=2000000,yend=2000000),linetype="dotted",colour = "#525252")  +
  annotate("text", family = font_labels, y = 2650000, x = 6,  hjust = 0, size = 3.5, color = "#808080",
           label = "Customer = 24-hour pass or 3-day pass user")  +
  annotate("text", family = font_labels, y = 2750000, x = 6,  hjust = 0, size = 3.5, color = "#808080",
           label = "Subscriber = Annual Member")  +
  annotate("text", family = font_labels, y = 2750000, x = 5.96,  hjust = 0, size = 3.5, color = "#808080",
           label = "*") 