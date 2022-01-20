library(tidyverse)
library(scales)
d <- read.delim("colony diamiter.txt", header = TRUE)
d_S76BKO <-  d [1:36,1:2]
library(ggplot2)
theme_set(theme_set(theme_classic() + theme(legend.position = "top")))
p_S76BKO <- ggplot(d_S76BKO, aes(x=strain, y=diameter))
p_S76BKO + geom_boxplot()

