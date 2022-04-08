#Instalacion de la paqueteria principal
require(dplyr)
library(nycflights13)
library(tidyverse)




################## Dplyr: select()

# select() allows you to rapidly zoom in on a useful subset using operations 
# based on the names of the variables.

# first of all we have to mention that there are many ways to select variables 
# from a dataframe, some examples are this:

# By name
select(flights, year, month, day)

# Between one and another
select(flights,year:day)

# Everything except some columns
select(flights,-(year:day))


# select can be used in many situations, if we want to know the rows that 
# contains certain words at the begining, the end, in the middle, etc.
?select

#if you want to move at the start of the data frame you can use everything()

select(flights, time_hour, air_time, everything())



######################### Excercises

# 1. Brainstorm as many ways as possible to select dep_time,
# dep_delay, arr_time, and arr_delay from flights.

select(flights,dep_time,dep_delay,arr_time, arr_delay)

select(flights,(dep_time:arr_delay))

select(flights, 4, 6, 7, 9)

select(flights,starts_with("dep_"),starts_with("arr_"))

#I find this option in internet and its very interesting
select(flights, matches("^(dep|arr)_(time|delay)$"))

variables <- c("dep_time", "dep_delay", "arr_time", "arr_delay")
select(flights, !!variables)


# 2. What happens if you include the name of a variable multiple
# times in a select() call?

select(flights,dep_time,dep_time,arr_time)

# Nothing


# 3. What does the one_of() function do? Why might it be helpful
# in conjunction with this vector?
vars <- c("year", "month", "day", "dep_delay", "arr_delay")

select(flights,all_of(vars))

#the console give us a message that says its ambiguous, and recomend the use
# of all_of() something similar that what the excercises says.


# 4. Does the result of running the following code surprise you?
#    How do the select helpers deal with case by default? How can
#    you change that default?

select(flights, contains("TIME"))

# thi ssurprise me because it tought that the evaluation was going to be made 
# only in the df, not in the name of the columns


#if we use ?select, we find that the result by defult could be ignored, so to
# reapir this situation we can use tha parameter ignore.case
select(flights, contains("TIME", ignore.case = FALSE))




################# Dplyr:mutate()

# Besides selecting sets of existing columns, it's often useful to add
# new columns that are functions of existing columns. That's the job
# of mutate()


flights_sml <- select(flights,year:day,ends_with("delay"),
                      distance,air_time)

flights_sml

#With this comand you cand add the columns that youre creating
#at the end of the df
mutate(flights_sml,gain=arr_delay-dep_delay,
       speed=distance/air_time*60)
       

#If you just want to conserve the new columnstou just have to  use tansmute()

#Transmute has to be one of the most useful functions of dplyr, you can use it 
#with almost everythins

#Arithmetic Operatos
transmute(flights_sml,gain=arr_delay-dep_delay,
       speed=distance/air_time*60)

#Modular Arithmetic

transmute(flights,dep_time,hour=dep_time%/%100,minute=dep_time%%100)

# Logs, Offsets, Cumulative, Logical comparisons,ranking,etc.



############# Excercises

# 2. Compare air_time with arr_time - dep_time. What do you
# expect to see? What do you see? What do you need to do to fix
# it?

d2<-mutate(flights,ardep_time=arr_time-dep_time)

select(d2,air_time,ardep_time)


#I expected find that the two vectors where equal, but it looks that they're not
# the explanation abut this, so we need to reread again the information about
# the data, maybe we could find a explanation


# 4. Find the 10 most delayed flights using a ranking function. How
# do you want to handle ties? Carefully read the documentation
# for min_rank().

d3<-arrange(flights,desc(dep_delay))

head(d3)

# 5. What does 1:3 + 1:10 return? Why?
1:3+1:10

#In just make a sum of element to element, only that when the first vector has arrived
# to the end begin again.

# 6. What trigonometric functions does R provide?
cos(pi)
sin(pi)
tan(pi)
acos(pi)
asin(pi)
atan(pi)
acos(1)
asinpi(1)
atanpi(1)