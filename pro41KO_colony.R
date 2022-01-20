d <- read.delim("colony diamiter.txt", header = TRUE)
d[40:87,1:2]
d_pro41 <- d[40:87, 1:2]
d_pro41
library("ggplot2")
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
p_pro41 <- ggplot(d_pro41, aes(x=strain, y=diameter)) + geom_boxplot(width = 0.4)
p_pro41
p_pro41 <- p_pro41 + scale_x_discrete(limit=c('WT', 'pro41KO-2', 'pro41KO-3', 'pro41_G11'))
p_pro41
p_pro41 <- p_pro41 + ylim(0, 3.5)
p_pro41
p_pro41 <- p_pro41 + theme_classic()
p_pro41 <- p_pro41 + labs(
  y = "colony diameter [cm]", x= ""
)+
  theme(
    axis.title = element_text(size = 14)
  )
p_pro41
library("ggsignif")
p2_pro41 <- p_pro41 + geom_signif(comparisons = list(c("WT", "pro41KO-2"), c("WT", "pro41KO-3")),
                                  test = "wilcox.test",
                                  na.rm = FALSE,
                                  map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05))
p2_pro41
p3_pro41 <- p2_pro41 + geom_signif(comparisons = list(c("WT", "pro41_G11")),
                                   test = "wilcox.test",
                                   na.rm = FALSE,
                                   map_signif_level = c("****" = 0.0001, "***" = 0.001, "**" = 0.01, "*" = 0.05),
                                   y_position = 3.2)
p3_pro41
