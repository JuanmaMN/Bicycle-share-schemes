
# Packages ----------------------------------------------------------------


pacman::p_load(readxl, lubridate, tidyverse, ggplot2, ggtext, hrbrthemes, gridExtra,patchwork, systemfonts, sysfonts,showtext, ggpubr,
               extrafont, systemfonts,circlepackeR,packcircles,viridis, ggflags, janitor,readr, scales)



# Fonts -------------------------------------------------------------------

extrafont::loadfonts(device = "win", quiet = TRUE)

font_add_google("Lora")

font_labels <- "Lora"

showtext_auto()


# Graph -------------------------------------------------------------------

gboth_Day_Boston<- ggplot(data_source, aes(x=Day, y=total, fill = usertype)) +
  geom_bar(stat="identity",  width=0.4, position=position_dodge(width = 0.5)) +
  scale_y_continuous(breaks = seq(0, 300000,by = 50000),limits=c(0, 300000), labels = c(" ","50,000","100,000","150,000", "200,000", "250,000", " "),
                     expand = c(.007, .007))+
  scale_fill_manual(values = c("#8fb9c9", "#c0d8c5")) +
  theme_ipsum_rc() +
  labs(y = "",
       title = "Bluebikes Boston - Metro Boston's public bike share program",
       subtitle =  "Subscriber and Customer trip analysis in 2020 - Number of trips by day of the week",
       caption =  "Source: www.bluebikes.com\nVisualization: JuanmaMN (Twitter @Juanma_MN)")  +
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
  geom_segment(aes(x=0.5,xend=7.3,y=0,yend=0),linetype="dotted",colour = "#525252") +
  geom_segment(aes(x=0.5,xend=7.3,y=50000,yend=50000),linetype="dotted",colour = "#525252")+
  geom_segment(aes(x=0.5,xend=7.3,y=100000,yend=100000),linetype="dotted",colour = "#525252") +
  geom_segment(aes(x=0.5,xend=7.3,y=150000,yend=150000),linetype="dotted",colour = "#525252") +
  geom_segment(aes(x=0.5,xend=7.3,y=200000,yend=200000),linetype="dotted",colour = "#525252") +
  geom_segment(aes(x=0.5,xend=7.3,y=250000,yend=250000),linetype="dotted",colour = "#525252") +
  annotate("text", family = font_labels, y = 255000, x = 6.3,  hjust = 0, size = 3.5, color = "#808080",
           label = "Customer = Single Trip or Day Pass user")  +
  annotate("text", family = font_labels, y = 265000, x = 6.3,  hjust = 0, size = 3.5, color = "#808080",
           label = "Subscriber = Annual or Monthly Member")  +
  annotate("text", family = font_labels, y = 265000, x = 6.25,  hjust = 0, size = 3.5, color = "#808080",
           label = "*") 

