#!/bin/bash
#
# add your solution after each of the 10 comments below
#

# count the number of unique stations
cut -d, -f4 201402-citibike-tripdata.csv|sort|uniq -c|wc -l

# count the number of unique bikes
cut -d, -f12 201402-citibike-tripdata.csv|sort|uniq -c|wc -l

# count the number of trips per day
cut -d, -f3 201402-citibike-tripdata.csv|cut -d' ' -f1|sort|grep [0-9]|uniq -c

# find the day with the most rides
cut -d, -f2 201402-citibike-tripdata.csv|cut -d' ' -f1|sort|grep [0-9]|uniq -c|sort -nr

# find the day with the fewest rides
cut -d, -f2 201402-citibike-tripdata.csv|cut -d' ' -f1|sort|grep [0-9]|uniq -c|sort -n

# find the id of the bike with the most rides
cut -d, -f12 201402-citibike-tripdata.csv|cut -d' ' -f1|sort|grep [0-9]|uniq -c|sort -nr

# count the number of rides by gender and birth year
cut -d, -f14,15 201402-citibike-tripdata.csv|grep [0-9]|sort|uniq -c 

# count the number of trips that start on cross streets that both contain numbers (e.g., "1 Ave & E 15 St", "E 39 St & 2 Ave", ...)
cut -d, -f5 201402-citibike-tripdata.csv|grep -E '[0-9],*&.*[0-9]'|wc -l

# compute the average trip duration
awk -F"," 'BEGIN{sum=0; counter=-1}{sum=sum+$1; counter=counter+1}END{print sum/counter}' 201402-citibike-tripdata.csv  
