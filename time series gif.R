# install.packages("gganimate")
# install.packages("hrbrthemes")
# install.packages("babynames")
# install.packages("viridis")
# install.packages("gifski")
# install.packages("installr")
# install.packages("plotly")
# install.packages("extrafontdb")
# library(installr)


setwd("C:/Users/kaven/OneDrive/Documents/King's course work/ADS 3864B/RLabs/practice")

library(gifski)
library(ggplot2)
library(gganimate)
library(ggridges)
library(plotly)
library(dplyr)
library(hrbrthemes)
library(babynames)
library(viridis)

# Create data for line plot
x <- c(15, 25, 35, 45, 55, 65, 75, 85)
y <- c(0, 6, 18, 11, 11, 3, 1,0)

# Create data frame
df <- data.frame(x, y)

# Generate line plot
ggplot(df, aes(x, y)) + geom_line() +
  geom_point(colour="red", size=3) + 
  labs(y="Frequency", x="Days") 

# Generate animated plot
a1 <- ggplot(df, aes(x, y)) +
  geom_line() +
  geom_point(size=3, aes(group = seq_along(x))) +
  geom_point(colour = "red", size = 3) +
  labs(y="Frequency", x = "Years",title = "Data") + 
  transition_reveal(x)
a1

#anim_save("polygon.gif", a1)

# Baby names
# Keep only 3 names
don <- babynames %>% 
  filter(name %in% c("Ashley", "Patricia", "Helen")) %>%
  filter(sex=="F")

# Plot
a2 <- ggplot(don, aes(x=year, y=n, group=name, color=name)) +
  geom_line(lwd=2) +
  geom_point() +
  theme_minimal()+
  scale_color_viridis(discrete = TRUE) +
  labs(title = "Popularity of baby names", y = "Number of Babies Born") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 16)) +
  transition_reveal(year)

a2

anim_save("babynames.gif", a2)
