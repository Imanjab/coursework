# 4.6 Exercises

# Question 4.1. Table 4.6 presents the probabilities of the random variable Y . These probabilities are a function of the number p, the probability of the value “0”. Answer the following questions:

# 1. What is the value of p?
# The sum of the probabilities must equal 1. So to find p, we add all the probabilities and set it to 1. Then we solve for p.
# p + 2p + 3p + 4p + 5p + 6p = 1
# 21p = 1
# p = 1/21

# 2. P(Y < 3) = ?
# 1/21 + 2/21 + 3/21 = 6/21

# 3. P(Y = odd) = ? 
# P(Y = 1) + P(Y = 3) + P(Y = 5) 
# 2/21 + 4/21 + 6/21 = 12/21

# 4. P(1 ≤ Y < 4) = ? 
# P(Y = 1) + P(Y = 2) + P(Y = 3)
# 2/21 + 3/21 + 4/21 = 9/21

# 5. P(|Y −3| < 1.5) = ? 
# P(Y = 2) + P(Y = 3) + P(Y = 4)
# 3/21 + 4/21 + 5/21 = 12/21

# 6. E(Y ) = ?
# (0 * 1/21) + (1 * 2/21) + (2 * 3/21) + (3 * 4/21) + (4 * 5/21) + (5 * 6/21)
# 0 + 2/21 + 6/21 + 12/21 + 20/21 + 30/21 = 70/21

# 7. Var(Y ) = ?
# var_y = ((0 - 70/21)^2 * 1/21) + ((1 - 70/21)^2 * 2/21) + ((2 - 70/21)^2 * 3/21) + ((3 - 70/21)^2 * 4/21) + ((4 - 70/21)^2 * 5/21) + ((5 - 70/21)^2 * 6/21) 

# 8. What is the standard deviation of Y
# sqrt(var_y)

# Question 4.2. One invests $2 to participate in a game of chance. In this game a coin is tossed three times. If all tosses end up “Head” then the player wins $10. Otherwise, the player losses the investment.
# 1. What is the probability of winning the game?
# S.S. = {HHH, HHT, HTH, HTT, THH, THT, THH, TTT}
# P(winning) = P(HHH) = 1/8

# 2. What is the probability of loosing the game?
# P(losing) = 1 - P(wining) = 1 - 1/8 = 7/8

#. What is the expected gain for the player that plays this game? (Notice that the expectation can obtain a negative value.)



#6.4 Exercises
#Question 6.1
# Consider the problem of establishing regulations concerning the maximum number of people who can occupy a lift. In particular,
# we would like to assess the probability of exceeding maximal weight when 8 people are allowed to use the lift simultaneously and 
# compare that to the probability of allowing 9 people into the lift. Assume that the total weight of 8 people chosen at random follows
# a normal distribution with a mean of 560kg and a standard deviation of 57kg. Assume that the total weight of 9 people chosen at random 
# follows a normal distribution with a mean of 630kg and a standard deviation of 61kg.

#1. What is the probability that the total weight of 8 people exceeds 650kg?
1 - pnorm(650,560,57)
# 0.057

# 2. What is the probability that the total weight of 9 people exceeds 650kg?
1 - pnorm(650,630,61)
# 0.371

# 3. What is the central region that contains 80% of distribution of the total weight of 8 people?
560 + qnorm(0.1) * 57
# 486.9516

560 + qnorm(0.9) * 57
# 633.0484

# central_region = [486.95. 633.04]
  
# 4. What is the central region that contains 80% of distribution of the total weight of 9 people?
650 + qnorm(0.1) * 61
# 571.8254

650 + qnorm(0.9) * 61
# 728.1746

# central_region = [571.82, 728.17]

# 7.4 Exercises
# Question 7.1
# Our goal in this question is to investigate the sampling distribution of the sample average of the variable “bmi”. We assume a sample of size n = 150.

#  1. Compute the population average of the variable “bmi”
mean(pop2$bmi)
# 24.98446

# 2. Compute the population standard deviation of the variable “bmi”.
sd(pop2$bmi)
# 4.188511

# 3. Compute the expectation of the sampling distribution for the sample average of the variable.
x <- rep(0, 10^5)
for(i in 1:10^5){
    samp <- sample(pop2$bmi, 150)
    x[i] <- mean(samp)
  }
 mean(x)
# 24.98434

# 4. Compute the standard deviation of the sampling distribution for the sample average of the variable.
sd(x)
#  0.3412136

# 5. Identify, using simulations, the central region that contains 80% of the sampling distribution of the sample average.
quantile(x, c(0.1, 0.9))
#      10%      90% 
#  24.54950 25.42229 

# 6. Identify, using the Central Limit Theorem, an approximation of the central region that contains 80% of the sampling distribution of the sample averag

# 9.5 Exercises
# Question 9.1. The data for the 50 patients is stored in ﬁle “magnets.csv”. The ﬁle can be found on the internet at 
# http://pluto.huji.ac.il/~msby/ StatThink/Datasets/magnets.csv. Download this ﬁle to your computer and store it in the working directory of R. 
# Read the content of the ﬁle into an R data frame. Produce a summary of the content of the data frame and answer the following questions:

# 1. What is the sample average of the change in score between the patient’s rating before the application of the device and the rating after the application?
mean(magnets$change)
# 3.5

# 2. Is the variable “active” a factor or a numeric variable
# Factor

# 3. Compute the average value of the variable “change” for the patients that received and active magnet and average value for those that received an inactive placebo. 
# (Hint: Notice that the ﬁrst 29 patients received an active magnet and the last 21 patients received an inactive placebo. The subsequence of the ﬁrst 29 values of the 
# ngiven variables can be obtained via the expression “change[1:29]” and the last 21 vales are obtained via the expression “change[30:50]”.)
mean(magnets$change[1:29])
# 5.241379

mean(magnets$change[30:50])
# 1.095238

# 4. Compute the sample standard deviation of the variable “change” for the patients that received and active magnet and the sample standard deviation for those that received an inactive placebo.
sd(magnets$change[1:29])
# 3.236568

sd(magnets$change[30:50])
# 1.578124

# 5. Produce a boxplot of the variable “change” for the patients that received and active magnet and for patients that received an inactive placebo. What is the number of outliers in each subsequence?
boxplot(magnets$change[1:29])
# No outliers

boxplot(magnets$change[30:50])
# 3 outliers

10.6 Exercises
# Question 10.1. In Subsection 10.3.2 we compare the average against the midrange as estimators of the expectation of the measurement. The goal of this exercise is to repeat the analysis, but this time
 compare the average to the median as estimators of the expectation in symmetric distributions.

# 1. Simulate the sampling distribution of average and the median of a sample of size n = 100 from the Normal(3,2) distribution. Compute the expectation and the variance of the sample average and of the 
sample median. Which of the two estimators has a smaller mean square error?
samp _mean<- rep(0,10^5)  
samp_median <- rep(0,10^5)
for(i in 1:10^5)  
    x <- rnorm(100,mu,sig) 
    samp_meam=n[i] <- mean(X) 
    samp_median[i] <- median(X) 

mean(samp_mean)
# 2.999803
mean(samp_median)
# 3.000807
var(samp_mean)
# 0.03996177
var(sample_median)
# 0.06196287

# 2. Simulate the sampling distribution of average and the median of a sample of size n = 100 from the Uniform(0.5,5.5) distribution. Compute the expectation and the variance of the sample average and 
of the sample median. Which of the two estimators has a smaller mean square error?
samp _mean<- rep(0,10^5)  
samp_median <- rep(0,10^5)
for(i in 1:10^5)
    x <- runif(100,0.5,5.5)
    samp_mean[i] <- mean(x) 
    samp_median[i] <- median(x)

mean(samp_mean)
# 3.000397
mean(samp_median)
# 3.000712
var(samp_mean)
# 0.02078071
var(sample_median)
# 0.06056054

# Question 10.2. The goal in this exercise is to assess estimation of a proportion in a 
population on the basis of the proportion in the sample. The ﬁle “pop2.csv” was introduced 
in Exercise 7.1 of Chapter 7. This ﬁle contains information associated to the blood pressure 
of an imaginary population of size 100,000. The ﬁle can be found on the internet 
(http://pluto. huji.ac.il/~msby/StatThink/Datasets/pop2.csv). One of the variables in the ﬁle
is a factor by the name “group” that identiﬁes levels of blood pressure. The levels of this 
variable are “HIGH”, “LOW”, and “NORMAL”. The ﬁle “ex2.csv” contains a sample of size n = 150
taken from the given population. This ﬁle can also be found on the internet 
(http://pluto.huji. ac.il/~msby/StatThink/Datasets/ex2.csv). It contains the same variables as 
in the ﬁle “pop2.csv”. The ﬁle “ex2.csv” corresponds in this exercise to the observed sample 
and the ﬁle “pop2.csv” corresponds to the unobserved population. Download both ﬁles to your 
computer and answer the following questions:

# 1. Compute the proportion in the sample of those with a high level of blood pressure16.
37/150  
# 0.2466667

2. Compute the proportion in the population of those with a high level of blood pressure.





# 3.  Simulate the sampling distribution of the sample proportion and compute its expectation.
a <- rep(0,10^5) 
for(i in 1:10^5)  
    x <- sample(pop2$group,150) 
    a[i] <- mean(X == "HIGH")
 
mean(a)
# 0.281230

# 4. Compute the variance of the sample proportion.
var(a)
#  0.001350041

# 5. It is proposed in Section 10.5 that the variance of the sample proportion is 
Var( ˆ P) = p(1−p)/n, where p is the probability of the event (having a high blood pressure in our case)
and n is the sample size (n = 150 in our case). Examine this proposal in the current setting.
b <- mean(pop2$group == "HIGH") 
b*(1-p)/150 
# 0.001347685
