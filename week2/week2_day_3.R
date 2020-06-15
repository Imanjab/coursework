# 2.9. EXERCISES

# 2.2 Heart transplants, Part II. Exercise 1.50 introduces the Stanford Heart Transplant Study.
# Of the 34 patients in the control group, 4 were alive at the end of the study. Of the 69 patients in
# the treatment group, 24 were alive. The contingency table below summarizes these results.


# (a) What proportion of patients in the treatment group and what proportion of patients in the
# control group died?
# 34/69 = 0.49(49%) of patients in the treatment group died.
# 30/34 = 0.88(88%) of patients in the control group died.  

# (b) One approach for investigating whether or not the treatment is effective is to use a 
# random-ization technique.

# i. What are the claims being tested? Use the same null and alternative hypothesis notation
# used in the section.
# Ho = The difference in number of patients that died in the control vs treatment group is due to chance.
# Ha = The difference in number of patients that died is correlated with wether the patient was in the control or treatment room.

# ii. The paragraph below describes the set up for such approach, if we were to do it with-
# out using statistical software. Fill in the blanks with a number or phrase, whichever is appropriate.

# We write alive on   28   cards representing patients who were alive at the end of the study, and dead on   75   cards representing 
# patients who were not. Then, we shuffle these cards and split them into two groups:
# one group of size   69   representing treatment, and another group of size    34  representing control. We calculate the difference 
# between the proportion of dead cards in the treatment and control groups (treatment -control) and record this value. We repeat this 
# many times to build a distribution centered  0.   Lastly, we calculate the fraction of simulations where the simulated differences 
# in proportions are      . If this fraction is low, we conclude that it is unlikely to have observed such an outcome by chance and
# that the null hypothesis should be rejected in favor of the alternative.

# iii. What do the simulation results shown below suggest about the effectiveness of the trans-
# plant program?

# 2.9.3 Hypothesis testing
# 2.5 Social experiment, Part I. A “social experiment” conducted by a TV program questioned what people do when they see a very obviously
# bruised woman getting picked on by her boyfriend. On two different occasions at the same restaurant, the same couple was depicted. In 
# one scenario the woman was dressed “provocatively” and in the other scenario the woman was dressed “conser-vatively”. The table below 
# shows how many restaurant diners were present under each scenario, and whether or not they intervened.

# A simulation was conducted to test if people react differently under the two scenarios. 10,000 simulated differences were generated to 
# construct the null distribution shown. The value ˆppr,sim represents the proportion of diners who intervened in the simulation for the
# provocatively dressed woman, and ˆpcon,sim is the proportion for the conservatively dressed woman.

# (a) What are the hypotheses? For the purposes of this exercise, you may assume that each observed person at the restaurant behaved 
# independently, though we would want to evaluate this assumption more rigorously if we were reporting these results.
# Ho: There is no difference in the proportion of diners who intervened for the provocatively dressed and conservatively dressed woman.
# Ha: The proportion of diners who intervened is different for the provocatively and conservatively dressed woman. 
 
# (b) Calculate the observed difference between the rates of intervention under the provocative and conservative scenarios: ˆppr − pˆcon.
# (5/20) - (15/25) = -0.35

# (c) Estimate the p-value using the figure above and determine the conclusion of the hypothesis test.
# 0.05

# Question 9.2. In Chapter 13 we will present a statistical test for testing if there is a diﬀerence between the patients that received the 
# active magnets and the patients that received the inactive placebo in terms of the expected value of the variable that measures the change. 
# The test statist for this problem is taken to be ¯ X1 − ¯ X2 pS2 1/29 + S2 2/21 , where ¯ X1 and ¯ X2 are the sample averages for the 29 
# patients that receive active magnets and for the 21 patients that receive inactive placebo, respectively. The quantities S2 1 and S2 2 are 
# the sample variances for each of the two samples. Our goal is to investigate the sampling distribution of this statistic in a case where both
# expectations are equal to each other and to compare this distribution to the observed value of the statistic.

# 1. Assume that the expectation of the measurement is equal to 3.5, regardless of what the type of treatment that the patient received. We take
# the standard deviation of the measurement for patients the receives an active magnet to be equal to 3 and for those that received the inactive 
# placebo we take it to be equal to 1.5. Assume that the distribution of the measurements is Normal and there are 29 patients in the ﬁrst group 
# and 21 in the second. Find the interval that contains 95% of the sampling distribution of the statistic.
test.stat <- rep(0,10^5)  
for(i in 1:10^5)  
{  X1 <- rnorm(29,3.5,3)  
   X2 <- rnorm(21,3.5,1.5)  
   X1.bar <- mean(X1)  
   X2.bar <- mean(X2)  
   X1.var <- var(X1) 
   X2.var <- var(X2)  
   test.stat[i] <- (X1.bar-X2.bar)/sqrt(X1.var/29 + X2.var/21)  
} 
quantile(test.stat,c(0.025,0.975)) 
#     2.5% 97.5% 
# -2.014838 2.018435

# 2. Does the observed value of the statistic, computed for the data frame “magnets”, falls inside or outside of the interval that is computed in 1?
x1.bar <- mean(magnets$change[1:29])  
x2.bar <- mean(magnets$change[30:50])  
x1.var <- var(magnets$change[1:29])  
x2.var <- var(magnets$change[30:50]) 
(x1.bar-x2.bar)/sqrt(x1.var/29 + x2.var/21) 
#5.985601
