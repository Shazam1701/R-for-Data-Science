####Chapter 1: Data visualization with ggplot2

##########     Coordinate Systems

#Coordinate systems are probably the most complicated part of
#ggplot2. 


#if you want to switch the x and y axes you use cord_flip()

#Normal
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

#swich Axes
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()

#To use polar cords you can use cord_polar()

bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    show.legend = FALSE,
    width = 1
  ) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

#Cartesian system
bar + coord_flip()
#Polar system
bar + coord_polar()



################             #Exercises         #####


#1. Turn a stacked bar chart into a pie chart using coord_polar().


a1<-ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

a1+coord_polar()




#2. What does labs() do? Read the documentatio

#You can modify the axis, legends and plot labels

a1+labs(x="Eje X", y="Eje Y", title="Ejemplo de labs()" )


# 3. What's the difference between coord_quickmap() and
# coord_map()?
  
a2<-ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

a2+coord_quickmap()
a2+coord_map()


#It looks that is just the format of printing


#4. 4. What does the following plot tell you about the relationship
# between city and highway mpg? Why is coord_fixed() impor-
# tant? What does geom_abline() do?

  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point(position="jitter") +
  geom_abline() +
  coord_fixed()

#The plot is telling that there is a positive correlation between
#the city and the highway if the city has a big number
#the highway is going to be in the same way and viceversa

#The importance of coord_fixed and geom_abline is mora than
  #anything for the aestetic of the plot
  
#You can give a better and more exact interpretation of the data if you have
#a plot that provides you the infromation the clearest possible.
  
  
  
  


