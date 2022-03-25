####Chapter 1: Data visualization with ggplot2

##########     Statistical Transformations

#Bar charts

#Bar charts seem simple, but they are interesting because they  
#reveal something subtle about plots

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

#As we can see in the data set diamonds, there isn't a column called
#count, but automatically the function makes the process of count
#the number of each cut inside the data set.

#The name of this process is called "stat" that is an abbreviation 
#for Statistical Transformation, we can know which process is used 
#in each geom inspecting the default value in "stat"

#Is important to know that every geom has a default stat, and every
#stat has a geom by default, so it wont be problem if we don't know
#which stat process we have to use.




################             #Exercises         ########


# 1.-What is the default geom associated with stat_summary()?
# How could you rewrite the previous plot to use that geom func-
# tion instead of the stat function?

#The default geom is: geom_pointrange()

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )


#####

ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary",fun.min = min,fun.max = max,fun = median)



#2.- What does geom_col() do? How is it different to geom_bar()?

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))  

ggplot(data = diamonds) +
  geom_col(mapping = aes(x = cut, y= price))  

#The stat is different, meanwhile in geom_bar is stat_count
#in geom_col is stat_identity() for that reason, geom_col()
#requires an specific y parameter to make the plot.



#3.-Most geoms and stats come in pairs that are almost always used
# in concert. Read through the documentation and make a list of
# all the pairs. What do they have in common?

#they have in common that sometimes the name of de the geom and 
#the stat is similar or has the same abrevation


# 5. In our proportion bar chart, we need to set group = 1. Why? In
# other words what is the problem with these two graphs?

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop..))

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = color, y = ..prop..)
  )


#Is because for the group, we need to adjust it



##########     Position Adjustments

#Long time ago I heard that the principal reason why the people don't
#like to use R is because the graphs that you can do sometimes are 
#ugly and I disagree with that opinion.

#color=cut
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))

#fill=cut
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))

#fill=clarity
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

#If you don't want a stacked bar chart, there are other options 
#like this:

#position=fill

#This is helpful when you want to know the proportion in the same bar

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "fill"
  )

#position= dodge

#In my personal opinion this one is my favorite

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
  )


################             #Exercises         ########

#1. What is the problem with this plot? How could you improve it?

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point()

#The problem is that some values are being rounded, and making that
#some values in the x-axis have more than one value in y-axis.

#You can solve it using position=jitter

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point(position = "jitter")


#2. What parameters to geom_jitter() control the amount of jittering?

#If you read the information in ?geom_jitter you can find
#that the parameters width and height control the amount of points for
#each observation

#3.Compare and contrast geom_jitter() with geom_count().

#Jitter
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter()
#Count
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_count()

#In the geom_count you can see in the legend in which spaces
#there are a bit concentration of data, but it  looks bad
#and i could say that is some parts is confused.


# 4. What's the default position adjustment for geom_boxplot()?
#   Create a visualization of the mpg data set that demonstrates it.


ggplot(data=mpg, mapping = aes(x=cty,y=hwy, colour=class)) +
  geom_boxplot()

