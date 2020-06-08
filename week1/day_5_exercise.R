#Exercise 12.2.1)

#2) Compute the rate for table2, and table4a + table4b. You will need to perform four operations:

#1) Extract the number of TB cases per country per year.
#2) Extract the matching population per country per year.
#3) Divide cases by population, and multiply by 10000.
#4) Store back in the appropriate place.
# Which representation is easiest to work with? Which is hardest? Why?

#table2)
table2 %>% pivot_wider(names_from = type, values_from = count) %>% mutate(cases = (cases/population) * 10000)

#table4a + table4b
first_table <- table4a %>% pivot_longer(names_to = "year", values_to = "cases", c('1999','2000'))
second_table <- table4b %>% pivot_longer(names_to = "year", values_to = "population", c('1999','2000'))
last_table4 <- inner_join(first_table,second_table)
last_table4 %>% mutate(cases = (cases / population) * 10000)

# Table 2 is the easiest to work with because the others had more functions to call and more work to do to come to the same result. 


#12.3.3 Exercises
#1) Why are pivot_longer() and pivot_wider() not perfectly symmetrical?
# Carefully consider the following example:
  stocks <- tibble(
    year   = c(2015, 2015, 2016, 2016),
    half  = c(   1,    2,     1,    2),
    return = c(1.88, 0.59, 0.92, 0.17)
  )
stocks %>% 
  pivot_wider(names_from = year, values_from = return) %>% 
  pivot_longer(`2015`:`2016`, names_to = "year", values_to = "return")

# (Hint: look at the variable types and think about column names.)
# pivot_longer() has a names_ptype argument, e.g. names_ptype = list(year = double()). What does it do?

# They are not symmetrical because pivot_wider organizes all the values under the same key whereas pivot_longer has all the keys under the same column. 
# pivot_longer goes through all the column keys and iterates again for all the rows. 


#3) What would happen if you widen this table? Why? How could you add a new column to uniquely identify each value?
people <- tribble(
  ~name,             ~names,  ~values,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45,
  "Phillip Woods",   "height",   186,
  "Phillip Woods",   "age",       50,
  "Jessica Cordero", "age",       37,
  "Jessica Cordero", "height",   156
)
# This doesn;t work because there are duplicate values for the same row or observation. 
# people %>% group_by(names,name) %>% mutate(new = row_number()) %>% pivot_wider(names, name)

