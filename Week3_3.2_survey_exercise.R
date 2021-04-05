# Assignment: American Community Survey Exercise
# Name: Sharma, Dipika
# Date: 2020-04-04

install.packages("ggplot2")
library(ggplot2)

## Load the dataset "acs-14-1yr-s0201.csv"
survey_df <- read.csv("/Users/dipikasharma/R_Projects/DSC520/data/acs-14-1yr-s0201.csv")


# What are the elements in your data (including the categories and data types)?
str(survey_df)
summary(survey_df)
# The elements in the data "acs-14-1yr-s0201.csv" provided to us are following
# 1. Id (string) as it has number and character together.
# 2. Id2 (Int) only numbers.
# 3. Geography (String) it contain the city name and state name.
# 4. PopGroupid (Int) only number.
# 5. POPGROUP.display-label (String) it is showing population group display name.
# 6. RacesReported (Int) only numbers
# 7. HSDegree (Decimal) 
# 8. BachDegree (Decimal)

# Please provide the output from the following functions: str(); nrow(); ncol()

str(survey_df)
nrow(survey_df)
ncol(survey_df)

# Create a Histogram of the HSDegree variable using the ggplot2 package.
# Set a bin size for the Histogram.

ggplot(survey_df, aes(HSDegree)) + geom_histogram(binwidth = 0.8)

# Include a Title and appropriate X/Y axis labels on your Histogram Plot.

ggplot(survey_df, aes(HSDegree)) + geom_histogram(binwidth = 0.8) + ggtitle("HSDegree Survey") +
  theme(plot.title = element_text(hjust = 0.5)) + xlab("HSDegree") + ylab("COUNTS")

# Answer the following questions based on the Histogram produced:
# Based on what you see in this histogram, 
#  is the data distribution unimodal? - Yes the plotted Histogram is unimodal as we can clearly see one hump.
#  Is it approximately symmetrical? - No one half is not the mirror image of the other half, so plotted histogram is not symmetrical
#  Is it approximately bell-shaped? - no, bell shaped chart must have one clear center, plotted charts is not v=bell shaped.
#  Is it approximately normal? No, normal is symmetrical distribution, plotted histogram is not normal.
#  If not normal, is the distribution skewed? If so, in which direction? yes the plotted histogram is left-skewed Histogram.

#  Include a normal curve to the Histogram that you plotted.

ggplot(survey_df, aes(HSDegree)) + geom_histogram(binwidth = 0.8, color = "black", alpha=.7) +
 geom_density(aes(y=..density..*140), colour="blue") + ggtitle("HSDegree Survey") +
  theme(plot.title = element_text(hjust = 0.5)) + xlab("HSDegree") + ylab("COUNTS")

# Explain whether a normal distribution can accurately be used as a model for this data.
# Normal distribution is used for symmetrical data with a single peak at the center. 
# For given data we already knew that the plotted Histogram is not symmetrical and one half of the data is not same 
# as the other half so the normal distribution is not a accurate model for this data.

# Create a Probability Plot of the HSDegree variable.

ggplot(survey_df, aes(sample=HSDegree)) + stat_qq() + stat_qq_line()

# Answer the following questions based on the Probability Plot:
#  Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
#  no the distribution is not normal as the plotted graph is showing the deviation of image from straight line which means departure from normality.

#If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
# Yes the distribution is skewed, since the plotted points bend down and to the right of the normal line it is left skewed distribution.

# Now that you have looked at this data visually for normality, 
# you will now quantify normality with numbers using the stat.desc() function. 
# Include a screen capture of the results produced.

install.packages("pastecs")
install.packages("stat.desc")
install.packages("psych")

library(pastecs)
library(stat.desc)
library(psych)

stat.desc(survey_df)
describe(survey_df)

stat.desc(survey_df$HSDegree, basic=FALSE, desc=TRUE, norm=TRUE, p=0.95)

#> stat.desc(survey_df$HSDegree, basic=FALSE, desc=TRUE, norm=TRUE, p=0.95)
#median          mean       SE.mean  CI.mean.0.95           var       std.dev      coef.var      skewness 
#8.870000e+01  8.763235e+01  4.388598e-01  8.679296e-01  2.619332e+01  5.117941e+00  5.840241e-02 -1.674767e+00 
#skew.2SE      kurtosis      kurt.2SE    normtest.W    normtest.p 
#-4.030254e+00  4.352856e+00  5.273885e+00  8.773635e-01  3.193634e-09 

# In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. 
# Skew: By using the stat.desc() function we can clearly see the skew value is negative 
# which indicate values are piled up on the right of the distribution and hence it is left skewed
# Kurtosis: Looking at the kurtosis value we can see it is showing the positive value 
# which indicate a pointy and heavy-tailed distribution.
# z-scores: we can get z score by dividing skew value by its standard error or by dividing kurtosis by its standard error.
# And the value of skew.2se and kurt.2se are same as skew and kurtosis divided by standard errors.
# After looking at skew.2se value we can stat how much our values deviated from normal distribution and in current data it is negative skewed.
# Kurtosis determine how differently shaped are the tails of distribution compared to the tail of normal distribution.
# Using skew.2se and kurt.2se we can estimate the degree of departure from normality and hence the zscore.

# In addition, explain how a change in the sample size may change your explanation?
# Sample size can have huge impact on distribution, it is observed that small sample size can results in non-normal distribution.
# And it is considered that normality will be better with increase of sample size.
# We can also use mean and Standard deviation to determine the normality with sample size.
# It is observed that with increase of sample size we see increase in mean and decrease in standard deviation.
# Normal distribution is the function of Standard deviation.
