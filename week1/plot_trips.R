########################################
# load libraries
########################################

# load some packages that we'll need
library(tidyverse)
library(scales)

# be picky about white backgrounds on our plots
theme_set(theme_bw())

# load RData file output by load_trips.R
load('trips.RData')


########################################
# plot trip data
########################################

# plot the distribution of trip times across all rides (compare a histogram vs. a density plot)

#histogram
trips %>% 
    filter(tripduration < 3600) %>% 
    ggplot(aes(x=tripduration)) + 
        geom_histogram()

#density_plot
trips %>% 
    filter(tripduration < 3600) %>% 
    ggplot(aes(x=tripduration)) + 
        geom_density()

# plot the distribution of trip times by rider type indicated using color and fill (compare a histogram vs. a density plot)
#histogram
trips %>% 
    filter(tripduration <= 3600) %>% 
    group_by(usertype) %>% 
    ggplot(aes(x = tripduration, color = usertype, fill = usertype)) +  
       geom_histogram()

#density_plot
trips %>% 
    filter(tripduration <= 3600) %>% 
    group_by(usertype) %>% 
    ggplot(aes(x = tripduration, color = usertype)) +  
       geom_density()

# plot the total number of trips on each day in the dataset
trips %>% 
    filter(tripduration <= 3600) %>% 
    mutate(day = as.Date(ymd)) %>%
    group_by(day) %>% 
    ggplot(aes(x = day)) + 
        geom_histogram()

# plot the total number of trips (on the y axis) by age (on the x axis) and gender (indicated with color)
trips %>% 
    filter(tripduration <= 3600, birth_year >= 1940) %>% 
    ggplot(aes(x = birth_year, color = gender, fill = gender)) + 
        geom_histogram()

# plot the ratio of male to female trips (on the y axis) by age (on the x axis)
# hint: use the spread() function to reshape things to make it easier to compute this ratio
# (you can skip this and come back to it tomorrow if we haven't covered spread() yet)

########################################
# plot weather data
########################################
# plot the minimum temperature (on the y axis) over each day (on the x axis)
weather %>% 
    ggplot(aes(x = DATE, y = TMIN)) + 
       geom_line()


# plot the minimum temperature and maximum temperature (on the y axis, with different colors) over each day (on the x axis)
# hint: try using the gather() function for this to reshape things before plotting
# (you can skip this and come back to it tomorrow if we haven't covered gather() yet)

########################################
# plot trip and weather data
########################################

# join trips and weather
trips_with_weather <- inner_join(trips, weather, by="ymd")

# plot the number of trips as a function of the minimum temperature, where each point represents a day
# you'll need to summarize the trips and join to the weather data to do this

# repeat this, splitting results by whether there was substantial precipitation or not
# you'll need to decide what constitutes "substantial precipitation" and create a new T/F column to indicate this

# add a smoothed fit on top of the previous plot, using geom_smooth

# compute the average number of trips and standard deviation in number of trips by hour of the day
# hint: use the hour() function from the lubridate package

# plot the above

# repeat this, but now split the results by day of the week (Monday, Tuesday, ...) or weekday vs. weekend days
# hint: use the wday() function from the lubridate package
