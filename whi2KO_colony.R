library(tidyverse)
library(scales)
d <- read.delim("colony diamiter.txt", header = TRUE)
d_whi2 <-  d [196:231,1:2]
yRoof_whi2 <- round(max(d[196:231,2])*1.5,1) 
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
p_whi2 <- ggplot(d_whi2, aes(x=strain, y=diameter)) + geom_boxplot(width = 0.4)
p_whi2 <- p_whi2 + scale_x_discrete(limit=c('WT', 'whi2KO', 'whi2KO_G1'))
p_whi2 <- p_whi2 + ylim(0,yRoof_frq)
p_whi2 <- p_whi2 + theme_classic()
p_whi2 <- p_whi2 + labs(
  y = "colony diameter [cm]", x= ""
)+
  theme(
    axis.title = element_text(size = 14)
  )
p_whi2
p2_whi2 <- p_whi2 + geom_signif(comparisons = list(c("WT", "whi2KO")),
                                test = "wilcox.test",
                                na.rm = FALSE,
                                map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                y_position = yRoof_whi2*0.8,
                                tip_length=0.3)
p3_whi2 <- p2_whi2 + geom_signif(comparisons = list(c("WT", "whi2KO_G1")),
                                test = "wilcox.test",
                                na.rm = FALSE,
                                map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                y_position = yRoof_whi2*0.9,
                                tip_length=0.3)
p3_whi2
