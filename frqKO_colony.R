d_frqKO <-  d [167:193,1:2]
yRoof_frq <- round(max(d[167:193,2])*1.5,1) 
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
p_frqKO <- ggplot(d_frqKO, aes(x=strain, y=diameter)) + geom_boxplot(width = 0.4)
p_frqKO <- p_frqKO + scale_x_discrete(limit=c('WT', 'frqKO-5', 'frqKO-8'))
p_frqKO <- p_frqKO + ylim(0,yRoof_frq)
p_frqKO <- p_frqKO + theme_classic()
p_frqKO <- p_frqKO + labs(
  y = "colony diameter [cm]", x= ""
)+
  theme(
    axis.title = element_text(size = 14)
  )
p_frqKO
library("ggsignif")
p2_frqKO <- p_frqKO + geom_signif(comparisons = list(c("WT", "frqKO-5"), c("WT", "frqKO-8")),
                                  test = "wilcox.test",
                                  na.rm = FALSE,
                                  map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                  y_position = yRoof_frq*0.9,
                                  tip_length=0.3)
p2_frqKO
