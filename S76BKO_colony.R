library(tidyverse)
library(scales)
d <- read.delim("colony diamiter.txt", header = TRUE)
d_S76BKO <-  d [1:36,1:2]
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
p_S76BKO <- ggplot(d_S76BKO, aes(x=strain, y=diameter)) + geom_boxplot(width = 0.4)
p_S76BKO
p_S76BKO <- p_S76BKO + scale_x_discrete(limit=c('WT', 'E.IS76', '76BKO-6', '76BKO-8'))
p_S76BKO <- p_S76BKO + ylim(0,5.5)
p_S76BKO <- p_S76BKO + theme_classic()
p_S76BKO <- p_S76BKO + labs(
  y = "colony diameter [cm]", x= ""
  )+
  theme(
    axis.title = element_text(size = 14)
    )
p_S76BKO
library("ggsignif")
p2_S76BKO <- p_S76BKO + geom_signif(comparisons = list(c("WT", "E.IS76")),
                                    test = "wilcox.test",
                                    na.rm = FALSE,
                                    map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                    y_position = 4.7)
p2_S76BKO
p3_S76BKO <- p2_S76BKO + geom_signif(comparisons = list(c("WT", "76BKO-6")),
                                    test = "wilcox.test",
                                    na.rm = FALSE,
                                    map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                    y_position = 5.0)
p3_S76BKO
p4_S76BKO <- p3_S76BKO + geom_signif(comparisons = list(c("WT", "76BKO-8")),
                                     test = "wilcox.test",
                                     na.rm = FALSE,
                                     map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                     y_position = 5.3)
p4_S76BKO
p5_S76BKO <- p4_S76BKO + geom_signif(comparisons = list(c("E.IS76", "76BKO-6"), c("E.IS76", "76BKO-8")),
                                     test = "wilcox.test",
                                     na.rm = FALSE,
                                     map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                     y_position = 3.2)
p5_S76BKO
