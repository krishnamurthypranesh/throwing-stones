# Libraries Used
The tidyverse
# Code Example

library(readr)

data <- read_delim("projects/inputfile.csv", delim = ",", col_names = T, col_types = cols(.default = col_character))

library(dplyr)

data %>%
  mutate(x = 1:dim(data)[1])

library(ggplot2)

data %>%
  ggplot() + aes(x) + geom_density()

# Introduction
Hi! This is my take on the guns dataset!

So, what is this dataset about?

This is data regarding the recorded possession of firearms and the reason for their possession by individuals in the years 2012 - 2014. The reason for possession of the guns is given along with some demographic characterisitcs such as age and education.

I have explored how a few of these demographic variables vary in this script. And, I've looked at how these variables vary over just 2 levels of intent: suicides and homicides.
------ You're totally free to take this code and make changes to it!----------------

#Findings

## There were a lot of suicides in this time period:
  The number of suicides easily trumped the number of homicides. There were approximately 62291  suicides and only 33313 homicides in comparison. This shows that most of the people who bought guns did so with an intent of killing themselves.
Also, the people who possessed the firearms either to kill others or themselves weren't the police.

## Young people killed a lot:
  A look at the distribution of age categorized by intent reveals that the people who commited homicides were, generally younger than the ones who commited suicides. This difference in age, was statistically significant, indicating that this difference in age wasn't just random. One possible explanation could be that they found the gun by accident and did not have proper knowledge of it's usage. This might have caused some accidental killings (This is to not say that the killings couldn't have been intentional...)
  
## Education level's pretty important:
  A few plots of the data revealed that people who had less than highschool education relatively commited more homicides than those with at least a high school diploma. 
  
## Race was important too:
  A look at how intent of possession and race revealed that African-Americans and Hispanics committed a lot more homicides than Whites, Asians and Native Americans, who incidentally committed a lot of suicides. 
  A combination of race and education revealed that Hispanics and African-Americans had lower levels of edcuation. They also had comparitively lower ages. 
  So, is this a recepie for disaster? Who knows?
  
## The homicides and suicides showed a trend:
  First the homicides and suicides showed a yearly trend. They decreased over time. Next, homicides and suicides showed a seasonal trend. The suicides peaked in summer and decreased durin winter, while the homicides peaked during summer, but increased in the holiday season after decreasing for sometime. 
  This could be because holiday season means more gifts to buy. And since gifts cost money, the criminals could have resorted to mugging other poeple isntead of working to buy gifts. 
  
  An examination of the seasonal trend over the four seasons of the year, revealed that the homicides and suicides decrease in fall (Sep, Oct, Nov) till December and spike in january, after which they decrease again. 
  
  This was a trend that was seen over all the years.
  
## Place also had an influence:
  While most of the killings (homicides and suicides) were commited inside homes, homicides were predominantly commited outside on the street. The streets were followed closely, shockingly , by schools. This could have some semblance to earlier findings which indicated low median age and education amongst the killers.

And this concludes my findings. 

Note: I am not biased in any way. I'm not trying to discriminate against anyone or any group of people. I've just written about what I found. If in some way I've caused harm to someone through this, know that I'm sorry and that this isn't intentional. 

#Peace
