library(tidyverse)
d_septa <- read.csv("cell_fusion.csv")
library(scales)
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
d_sep_whi2 <- d_septa[1:44,1:2] 
yRoof_sep_whi2 <- round(max(d_sep_whi2[,2])*1.2,1) 
p_sep_whi2 <- ggplot(d_sep_whi2, aes(x=strain, y=septa)) + geom_boxplot(width = 0.4)
p_sep_whi2 <- p_sep_whi2 + scale_x_discrete(limit=c('WT', 'whi2'))
p_sep_whi2 <- p_sep_whi2 + ylim(0,yRoof_sep_whi2)
p_sep_whi2 <- p_sep_whi2 + theme_classic()
p_sep_whi2 <- p_sep_whi2 + labs(
  y = "Number of septa [/mm]", x= ""
)+
  theme(
    axis.title = element_text(size = 14)
  )
p_sep_whi2
library("ggsignif")
p2_sep_whi2 <- p_sep_whi2 + geom_signif(comparisons = list(c("WT", "whi2")),
                                        test = "t.test",
                                        na.rm = FALSE,
                                        map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                        y_position = yRoof_sep_whi2*0.9)
p2_sep_whi2



d_sep_WT <- d_septa[1:22,1:2] 
d_sep_cs <- d_septa[45:66,1:2]
d_sep_csp6 <- d_sep_WT %>% full_join(d_sep_cs)
#merge two data frame
yRoof_sep_csp6 <- round(max(d_sep_csp6[,2])*1.2,1)
p_sep_csp6 <- ggplot(d_sep_csp6, aes(x=strain, y=septa)) + geom_boxplot(width = 0.4)
p_sep_csp6 <- p_sep_csp6 + scale_x_discrete(limit=c('WT', 'csp6'))
p_sep_csp6 <- p_sep_csp6 + ylim(0,yRoof_sep_csp6)
p_sep_csp6 <- p_sep_csp6 + theme_classic()
p_sep_csp6 <- p_sep_csp6 + labs(
  y = "Number of septa [/mm]", x= ""
)+
  theme(
    axis.title = element_text(size = 14)
  )
p_sep_csp6
library("ggsignif")
p2_sep_csp6 <- p_sep_csp6 + geom_signif(comparisons = list(c("WT", "csp6")),
                                        test = "t.test",
                                        na.rm = FALSE,
                                        map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                        y_position = yRoof_sep_csp6*0.9)
p2_sep_csp6