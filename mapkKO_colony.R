d_mapk <-  d [90:165,1:2] 
d_mapk <- na.omit(d_mapk)
# omit N/A rows from data frame
yRoof_mapk <- round(max(d_mapk[,2])*1.3,1) 
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
p_mapk <- ggplot(d_mapk, aes(x=strain, y=diameter)) + geom_boxplot(width = 0.4)
p_mapk <- p_mapk + scale_x_discrete(limit=c('WT', 'mak2', 'so', 'proA', 'cdc25', 'veA'))
p_mapk <- p_mapk + ylim(1.5, yRoof_mapk)
p_mapk <- p_mapk + theme_classic()
p_mapk <- p_mapk + labs(
  y = "colony diameter [cm]", x= ""
)+
  theme(
    axis.title = element_text(size = 14)
  )
p_mapk
library("ggsignif")
p2_mapk <- p_mapk + geom_signif(comparisons = list(c("WT", "proA")),
                                test = "wilcox.test",
                                na.rm = FALSE,
                                map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                y_position = yRoof_mapk*0.85)
                              
p2_mapk
p3_mapk <- p2_mapk + geom_signif(comparisons = list(c("WT", "cdc25")),
                                test = "wilcox.test",
                                na.rm = FALSE,
                                map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                y_position = yRoof_mapk*0.8)
p3_mapk
p4_mapk <- p3_mapk + geom_signif(comparisons = list(c("WT", "mak2"), c("WT", "so"), c("WT", "veA")),
                                test = "wilcox.test",
                                na.rm = FALSE,
                                map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                y_position = yRoof_mapk*0.95)
p4_mapk
