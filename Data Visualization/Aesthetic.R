####Chapter 1: Data visualization with ggplot2

#Aesthetic Mapping and Common Problems

#install.packages("tidyverse")
library(tidyverse)

##Example
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))


##General Structure

# ggplot(data = <DATA>) +
#   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

##Exercises
mtcars
ncol(mtcars)
nrow(mtcars)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))

#####Using Aesthetics

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


# Top
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Bottom
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#Como solo puede darnos 6 figuras, el resto no las grafica


##
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")






################             #Exercises         ########


#1.- Whtas gone wrong with this code? Why are the points not blue?
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy, color = "blue")
  )

#The characteristic of colour must be outside of the "aes" function
#Blue is being treated as a categorical variable


#2.- Which variables in mpg are categorical? Which variables are
#continuous? 


#There are no function that give us a result like the one the answer requires,
#but we can define it by the type of each one of the columns in the
#tibble. It means that...

#The categorical variables are:
# manufacurer
# model
# trans
# drv
# fl
# class



# 3.-Map a continuous variable to colour, size, and shape. How do
# these aesthetics behave differently for categorical versus contin-
# uous variables?

#We're going to use the principal example and change it

#Color
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ))
#Size
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = displ))
#Shape
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = displ))  


#The principal difference is that a continuous variable has, theoretically
#infinitum values, and in that makes that the result becomes confuse
#other side a categorical variable in general has few elements, it 
#makes that the interpretation that a graphic give us it could be better.


##4.-Whet happens if you map the same variable to multiple aesthetics?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = displ, color = displ))

#It will give us a graphic but it will be just a line that says nothing



##5. What does the stroke aesthetic do? What shapes does it work
#with? (Hint: use ?geom_point.)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,  stroke= .5))


#changes the size of the points inside of the graphic


### 6. What happens if you map an aesthetic to something other than
# a variable name, like aes(color = displ < 5)?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,  color = displ < 5))


#It will give us a correct graphic but its going to be separated
#by the ones that complies with the rule.
