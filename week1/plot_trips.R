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
trips %>% mutate(age = 2014 - birth_year) %>%
    filter(tripduration <= 3600) %>% 
    ggplot(aes(x = age, color = gender, fill = gender)) + 
    geom_histogram()

# plot the ratio of male to female trips (on the y axis) by age (on the x axis)
# hint: use the spread() function to reshape things to make it easier to compute this ratio
# (you can skip this and come back to it tomorrow if we haven't covered spread() yet)
trips %>% 
    mutate(age = 2014 - birth_year) %>% 
    group_by(age, gender) %>% 
    summarize(count = n()) %>% 
    pivot_wider(names_from = gender, values_from = count) %>% 
    mutate(ratio = Male/Female) %>% 
    ggplot(aes(x=age, y=ratio)) + 
        geom_point()

########################################
# plot weather data
########################################
# plot the minimum temperature (on the y axis) over each day (on the x axis)
weather %>% 
    ggplot(aes(x = ymd, y = tmin)) + 
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
trips_with_weather %>% 
    group_by(ymd,tmin) %>% 
    summarize(count = n()) %>% 
    ggplot(aes(x = tmin, y= count, color = ymd)) + 
        geom_point()

# repeat this, splitting results by whether there was substantial precipitation or not
# you'll need to decide what constitutes "substantial precipitation" and create a new T/F column to indicate this
trips_with_weather %>% 
    mutate(sub_prcp = (prcp >= 0.3)) %>% 
    group_by(sub_prcp,ymd,tmin) %>% 
    summarize(count = n()) %>% 
    ggplot(aes(x = tmin, y= count, color = ymd, shape = sub_prcp)) + 
       geom_point()

# add a smoothed fit on top of the previous plot, using geom_smooth
trips_with_weather %>% 
    mutate(sub_prcp = (prcp >= 0.3)) %>% 
    group_by(sub_prcp,ymd,tmin) %>% 
    summarize(count = n()) %>% 
    ggplot(aes(x = tmin, y= count,shape = sub_prcp, color = ymd)) +
        geom_point() + 
        geom_smooth(method = 'lm')

# compute the average number of trips and standard deviation in number of trips by hour of the day
# hint: use the hour() function from the lubridate package
trips_with_weather %>% 
    mutate(hr = hour(starttime)) %>% 
    group_by(ymd, hr) %>% 
    summarize(count = n()) %>% 
    group_by(hr) %>% 
    summarize(mean_rides = count/24, sd_rides = sd(count))

# plot the above
trips_with_weather %>% 
    mutate(hr = hour(starttime)) %>% 
    group_by(ymd, hr) %>% 
    summarize(count = n()) %>% 
    group_by(hr) %>% 
    summarize(mean_rides = count/24, sd_rides = sd(count)) %>%
    ggplot(aes(x = hr, y = mean_rides, color = sd_rides)) + 
        geom_point()

# repeat this, but now split the results by day of the week (Monday, Tuesday, ...) or weekday vs. weekend days
# hint: use the wday() function from the lubridate package
trips_with_weather %>% 
    mutate(week = wday(ymd)) %>% 
    mutate(hr = hour(starttime)) %>% 
    group_by(ymd, hr, week) %>% 
    summarize(count = n()) %>% group_by(hr) %>% 
    summarize(mean_rides = mean(count), sd_rides = sd(count)) %>% 
    ggplot(aes(x = hr, y = mean_rides, color = week)) + 
        geom_point()
