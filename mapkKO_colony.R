d_mapk <-  d [90:165,1:2] 
d_mapk <- na.omit(d_mapk)
# omit N/A rows from dataframe
yRoof_mapk <- round(max(d_mapk[,2])*1.5,1) 
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
p_mapk <- ggplot(d_mapk, aes(x=strain, y=diameter)) + geom_boxplot(width = 0.4)
p_mapk <- p_mapk + scale_x_discrete(limit=c('WT', 'mak2', 'so', 'proA', 'cdc25', 'veA'))
p_mapk <- p_mapk + ylim(0,yRoof_mapk)
p_mapk <- p_mapk + theme_classic()
p_mapk <- p_mapk + labs(
  y = "colony diameter [cm]", x= ""
)+
  theme(
    axis.title = element_text(size = 14)
  )
p_mapk
