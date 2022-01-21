d_SDS_whi2 <-  d [257:286,1:2] 
yRoof_SDS_whi2 <- round(max(d_SDS_whi2[,2])*1.5,1) 
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
p_SDS_whi2 <- ggplot(d_SDS_whi2, aes(x=strain, y=diameter)) + geom_boxplot(width = 0.4)
p_SDS_whi2 <- p_SDS_whi2 + scale_x_discrete(limit=c('WT', 'whi2KO', 'whi2_G1', 'csp6KO', 'csp6_G2'))
p_SDS_whi2 <- p_SDS_whi2 + theme_classic()
p_SDS_whi2 <- p_SDS_whi2 + labs(
  y = "Change of colony diameter [cm]", x= ""
)+
  theme(
    axis.title = element_text(size = 14)
  )
p_SDS_whi2
library("ggsignif")
p2_SDS_whi2 <- p_SDS_whi2 + geom_signif(comparisons = list(c("WT", "whi2KO")),
                                        test = "wilcox.test",
                                        na.rm = FALSE,
                                        map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                        y_position = 1.15)
p3_SDS_whi2 <- p2_SDS_whi2 + geom_signif(comparisons = list(c("WT", "csp6KO")),
                                        test = "wilcox.test",
                                        na.rm = FALSE,
                                        map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                        y_position = 1.3)
p4_SDS_whi2 <- p3_SDS_whi2 + geom_signif(comparisons = list(c("WT", "whi2_G1"), c("WT", "csp6_G2")),
                                         test = "wilcox.test",
                                         na.rm = FALSE,
                                         map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                         y_position = 1.45)
p4_SDS_whi2