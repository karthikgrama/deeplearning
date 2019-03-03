res1 <- read.table("C:/Users/Karthik/Documents/Projects/NMT/res3.csv", stringsAsFactors = F, sep = ',', header = T)

require(reshape2)
require(ggplot2)

p <- ggplot(dat = melt(res1[,c(1,2,4)], id.var="epoch"), aes(x=epoch, y=value)) + 
  geom_line(aes(colour=variable, group=variable)) + 
  geom_point(aes(colour=variable, shape=variable, group=variable), size=4) +
  xlab("Epochs") +
  ylab("Accuracy - Training and Validation") + 
  theme_light()

ggsave("plot_acc.svg", p)

p <- ggplot(dat = melt(res1[,c(1,3,5)], id.var="epoch"), aes(x=epoch, y=value)) + 
  geom_line(aes(colour=variable, group=variable)) + 
  geom_point(aes(colour=variable, shape=variable, group=variable), size=4) +
  xlab("Epochs") +
  ylab("Loss - Training and Validation") + 
  theme_light()

ggsave("plot_loss.svg", p)
