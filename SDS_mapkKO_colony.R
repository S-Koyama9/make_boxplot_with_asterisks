d <- read.delim("colony diamiter.txt", header = TRUE)
d_SDS_mapk <-  d [392:427,1:2] 
max(d_SDS_mapk[,2])
yRoof_SDS_mapk <- round(max(d_SDS_mapk[,2])*1.5,1) 
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
p_SDS_mapk <- ggplot(d_SDS_mapk, aes(x=strain, y=diameter)) + geom_boxplot(width = 0.4)
p_SDS_mapk <- p_SDS_mapk + scale_x_discrete(limit=c('WT', 'mak2', 'so', 'proA', 'cdc25', 'veA'))
p_SDS_mapk <- p_SDS_mapk + theme_classic()
p_SDS_mapk <- p_SDS_mapk + labs(
  y = "Change of colony diameter [cm]", x= ""
)+
  theme(
    axis.title = element_text(size = 14)
  )
p_SDS_mapk <- p_SDS_mapk + ylim(-0.25, yRoof_SDS_mapk)
library("ggsignif")
p2_SDS_mapk <- p_SDS_mapk + geom_signif(comparisons = list(c("WT", "mak2"), c("WT", "so"), c("WT", "cdc25"), c("WT", "veA")),
                                        test = "wilcox.test",
                                        na.rm = FALSE,
                                        map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                        y_position = yRoof_SDS_mapk*0.9)
p3_SDS_mapk <- p2_SDS_mapk + geom_signif(comparisons = list(c("WT", "proA")),
                                        test = "wilcox.test",
                                        na.rm = FALSE,
                                        map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                        y_position = yRoof_SDS_mapk*0.75)
p3_SDS_mapk
