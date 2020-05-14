library(tidyverse)
load("rda/murders.rda")

murders %>% mutate(abb = reorder(abb, rate)) %>% 
  ggplot(aes(abb, rate)) +
  geom_bar(width = 0.5, stat = "identity", color = "black") +
  coord_flip()

# Use the command "ggsave" to save the generated file for use in a report or a presentation.
# Let's save plots to a directory called "figs"
# After creating that directory, we can add the following line:

ggsave("figs/barplot.png")
  