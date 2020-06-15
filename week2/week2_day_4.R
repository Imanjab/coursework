# 5.5. EXERCISES 253

# 5.20 Body measurements, Part III. Exercise 5.13 introduces data on shoulder girth and
# height of a group of individuals. The mean shoulder girth is 108.20 cm with a standard deviation
# of 10.37 cm. The mean height is 171.14 cm with a standard deviation of 9.41 cm. The correlation
# between height and shoulder girth is 0.67.

# (a) Write the equation of the regression line for predicting height.
# b1 = (Sheight/Sshoulder)* R^2 = (9.14/10.37)*0.67 = 0.590
# y - y0 = b1(x - x0) => y - 171.14 = 0.590(x - 108.20) => y = 0.590x + 107.302

# (b) Interpret the slope and the intercept in this context.
# The slope indicates for every cm increase in shoulder girth, their is an increase of 0.590cm in height.
# The inerecept says that if there was no shoulder girth, there would be a height of about 107.302cm.

# (c) Calculate R2 of the regression line for predicting height from shoulder girth, and interpret it in the context of the application.
# R^2 = 0.67, About 67% of height in cm is explained by shoulder girt(in cm).

# (d) A randomly selected student from your class has a shoulder girth of 100 cm. Predict the height of this student using the model.
# y = 0.590(100) + 107.302 = 166.301

# (e) The student from part (d) is 160 cm tall. Calculate the residual, and explain what this residual means.
# 166.301 - 160 = 6.301. This means that the estimate value is 6 cm higher than the actual value.

# (f) A one year old has a shoulder girth of 56 cm. Would it be appropriate to use this linear model to predict the height of this child?
# No, it wouldn't be appropriate to use this linear model to predict the height of the child. 