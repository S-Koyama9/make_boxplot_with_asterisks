library(tidyverse)
library(scales)
d <- read.delim("colony diamiter.txt", header = TRUE)
d_S76BKO <-  d [1:36,1:2]
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
p_S76BKO <- ggplot(d_S76BKO, aes(x=strain, y=diameter)) + geom_boxplot()
p_S76BKO
p_S76BKO <- p_S76BKO + scale_x_discrete(limit=c('WT', 'E.IS76', '76BKO-6', '76BKO-8'))
p_S76BKO
p_S76BKO <- p_S76BKO + theme_classic()
p_S76BKO <- p_S76BKO + labs(
  y = "colony diameter [cm]", x= ""
  )+
  theme(
    axis.title = element_text(size = 14)
    )
p_S76BKO
