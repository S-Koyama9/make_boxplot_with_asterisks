library(tidyverse)
d_frq_fusion <- read.csv("frq_cellfusion.csv")
library(scales)
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
yRoof_frq_fus <- round(max(d_frq_fusion[,2])*1.2,1) 
p_frq_fusion <- ggplot(d_frq_fusion, aes(x=strain, y=fusion)) + geom_boxplot(width = 0.4) +
  scale_x_discrete(limit=c('WT', 'Δfrq_5', 'Δfrq_8'))+
  ylim(0,yRoof_frq_fus)+
  theme_classic()+ 
  labs(y = expression(paste ("Number of cell-fusion ( / ", {  mm^2 }, ")", sep="  ") ), x= "")+
  theme(axis.title = element_text(size = 12)
  )
p_frq_fusion
library("ggsignif")
p2_frq_fusion <- p_frq_fusion + geom_signif(comparisons = list(c("WT", "Δfrq_5"), c("WT", "Δfrq_8")),
                                            test = "t.test",
                                            na.rm = FALSE,
                                            map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                            y_position = yRoof_frq_fus*0.9)
p2_frq_fusion