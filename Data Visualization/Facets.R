####Chapter 1: Data visualization with ggplot2

#Aesthetic Mapping and Common Problems

#######  Facets


#The facets will be helpful when we want to make a graphic of discrete variables

#
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)
##For the combination fo 2 variables
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)



################             #Exercises         ########


###1. What happens if you facet on a continuous variable?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ cty, nrow = 2)

#It could work if there aren't so much data, but if its not the case, 
#it will give you a lot of graphics

###2. What do the empty cells in a plot with facet_grid(drv ~ cyl)
#mean? How do they relate to this plot?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl))

#The interpretation willl be that threre are not any data that has both values
#at the same time

#3. What plots does the following code make? What does . do?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(cyl ~ .)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid( .~ cyl)

#It changes the direction of the facet, the first use the y-axis
#to put the values of cyl, and the second use the x-axis


#4.- Take the first faceted plot in this section:

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

# What are the advantages to using faceting instead of the colour
# aesthetic? What are the disadvantages? How might the balance
# change if you had a larger dataset?

#The principal advantage is that you can make a good comparison 
#between one and another, the disadvantage is that if the number
#of variables in the dataset is large, the facet could become confusing


###### Geometric Objects

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))


###
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

#To discplay multiple geoms in the same plot

#This is the clasic mode
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
#The diference is that the mapping si going to be constant
#in this other way to make the graph

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()


##Another combination
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()




############          Exercises   ##########################

# 1. What geom would you use to draw a line chart? A boxplot? A
# histogram? An area chart?

#An histogram

# 2. Run this code in your head and predict what the output will
# look like. Then, run the code in R and check your predictions:

  ggplot(
    data = mpg,
    mapping = aes(x = displ, y = hwy, color = drv)
  ) +
  geom_point() +
  geom_smooth(se = F)

#the only thing i didnt expect i was going to see was the use
#of points and lines at the same time



# 4. What does the se argument to geom_smooth() do?

#The function draw a line across ecah kind of points,it represents
#the media of each kind of data


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
  ) +
  geom_smooth(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
  )


#6. Re-create the R code necessary to generate the following graphs.

#You can find the original images of the data in the page 21 of the book

#1
ggplot(dat=mpg, mapping= aes(x=displ, y=hwy )) +
  geom_point()+
  geom_smooth(se=F)
#2
ggplot(data=mpg, mapping = aes(x=displ, y=hwy, group=drv)) +
  geom_point()+
  geom_smooth(se=F)
#3
ggplot(data=mpg, mapping = aes(x=displ, y=hwy, color=drv)) +
  geom_point()+
  geom_smooth(se=F)
#4
ggplot(dat=mpg, mapping= aes(x=displ, y=hwy,)) +
  geom_point(mapping=aes(color=drv))+
  geom_smooth(se=F)
#5
ggplot(dat=mpg, mapping= aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(color=drv))+
  geom_smooth(mapping= aes(x=displ, y=hwy, linetype=drv),se=F)
#6
ggplot(data=mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(color=drv))
