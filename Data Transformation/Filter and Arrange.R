#Instalacion de la paqueteria principal
require(dplyr)
library(nycflights13)
library(tidyverse)


# I have to mention something before we start, this is of those chapters thta
# I would like to know before, because it could helped me a lot in the school
# and in general making some analysis.

################## Dplyr: filter()

#filter allows you to subset observations based on their values.

filter(flights,month==1,day==1)

jan1<-filter(flights, month == 1, day == 1)

#######  Logical Operators

#The sintaxys of the R structures sometimes will need that we have to make more
#exact conditions

#as you can see in this syntax we have to rewrite the field month, wich could 
#be a little anoying
a1<-filter(flights, month == 11 | month == 12)

#On the othehand we can use this kind of declaration wich isn't intuitive but 
#its more practical
nov_dec <- filter(flights, month %in% c(11, 12))


######## Missing Values

x <- NA

is.na(x)

#Something really important that we have to consider is that filter() only 
#includes rows where the condition is TRUE. If you want to preserve missing
#values, ask for them explicitly:

df<-tibble(x=c(1,NA,3))

filter(df,x>1)

#We can see that the second value is not being evaluated, this could be some
#confusing but even when the condition is not being complete we can't just 
#forgive it, or if it will be in that way we have to be concious of that

filter(df, is.na(x) | x>1)



############### Excercises

#1. find all flights that:

#a.Had an arrival delay of two more hours

d2<-filter(flights, flights$arr_delay>=120)

#Flew to Houston

Houston<-filter(flights, flights$dest=="IAH" |flights$dest=="HOU")

#Where operated by United, American or Delta
d3<-filter(flights, flights$carrier=="AA" | flights$carrier=="UA" |flights$carrier=="DL" )

#Departed in summer (july, august, september)

filter(flights, month == 7 | month == 8 | month == 9)
filter(flights,between(month,7,9))

#Arrived more than two hours late, but didn't leave late

filter(flights, arr_delay > 120 & dep_delay<=0)

#Were delayed by at least an hour, but made up over 30 minutes in flight

filter(flights, arr_delay >60 & (dep_delay- arr_delay)>30)

#3.-How many flights have a missing dep_time? What other variables
#   are missing? What might these rows represent?


a<-filter(flights,dep_time==NA)
length(a)
summary(flights$dep_time)


################## Dplyr: arrange()

# Arrange is a function that mtakes a data frame and a set of 
# column names (or more complicated expressions) to order by.

arrange(flights,dep_time)

# If you provide more than one column name, each additional 
# column will be used to break ties in the values of preceding 
# columns

arrange(flights, dep_time, day)


# The function desc() is to reorder by a column in descending order:

arrange(flights,desc(dep_time))


# Missing values are always sorted at the end

df<-tibble(x=c(5,2,NA))
#
arrange(df,x)
#
arrange(df,desc(x))


############## Excercises

# 1.How could you use arrange() to sort all missing values to the
#   start? (Hint: use is.na().)

arrange(flights,desc(is.na(flights)))

# 2.Sort flights to find the most delayed flights. Find the flights
#   that left earliest.


#Most delayed
arrange(flights,dep_delay)
#Left earliest
arrange(flights,desc(dep_delay))



# 3.Sort flights to find the fastest flights

#Fastest
arrange(flights, air_time)
#Most slow
arrange(flights, desc(air_time))



# 4.Which flights traveled the longest? Which traveled the shortest?

#Longest

arrange(flights,distance)

#shortest
arrange(flights,desc(distance))
