# Hi! This is a repo where I explore the data behind the fivethirtyeight 
# article on guns in my own way!
# you're free to make changes after forking it!
# Setup -------------------------------------------------------------------


library(tidyverse) # load tidyverse

guns <- read_csv("Data/gun_data.csv", col_names = T) # loading the data

head(guns) # glance at the data

summary(guns) # descriptive statistics of the data

# Cleaning the data -------------------------------------------------------

# removing Id variable

guns <- guns %>% 
  select(-X1) %>% 
  filter(intent == "Homicide"|intent == "Suicide") %>% # keep only homicides and suicides
  mutate(month = parse_number(month)) # fixing parsing errors

guns <- na.omit(guns) # delete missing data

# Exploration -------------------------------------------------------------

############# the infants with guns  ########

# The summary revealed some 0's in age, I'll look at those

guns %>% filter(age == 0) 

# these seem to be an error. I'll filter these out of the dataset

guns <- guns %>% filter(age != 0)


## Reasons: Homicides vs Suicides

ggplot(guns) + aes(fct_infreq(intent), ..prop.., group = 1) + geom_bar()

## how many were police?

ggplot(guns) + aes(police) + geom_bar() # none. 

## removing police

guns <- select(guns, -police)


## age

guns %>% 
  ggplot() + aes(age) + geom_freqpoly(binwidth = 1, aes(col = factor(intent)))


## is the difference in age between suicides and homicides statistically 
## significant?

aov(age ~ intent, data = guns) %>% summary() # statistically significant

### education distribution

ggplot(guns) + aes(education, y = ..prop.., group = 1) + geom_bar() 
 
### education and age

ggplot(guns) + aes(age) + geom_freqpoly(binwidth = 1, aes(col = education))

# does a degree make someone kill themselves?

guns %>% 
  count(education, intent) %>% 
  ggplot() + aes(education, intent) + geom_raster(aes(fill = n))

# what about race?

ggplot(guns) + aes(race) + geom_bar(aes(fill = intent), position = "dodge") +
  coord_flip()

# age and race

ggplot(guns) + aes(race, age) + stat_summary(
  fun.ymin = min,
  fun.ymax = max,
  fun.y = median
) + coord_flip()

## homicides and suicides by year and month
 guns %>% 
count(year, month, intent) %>% 
  ggplot() + aes(month, n, col = intent) + geom_point() + 
  geom_line() + facet_wrap(~ year)
 
## homicides and suicides by place

ggplot(guns) + aes(place) + geom_bar(aes(fill = intent), position = "dodge") +
  coord_flip()
 

# creating a new variable: season

guns$season <- vector("character", dim(guns)[1]) # initializing variable

guns$season[guns$month %in% c(1, 2, 12)] <- "winter" # winter

guns$season[guns$month %in% c(3, 4, 5)] <- "spring" # spring

guns$season[guns$month %in% c(6, 7, 8)] <- "summer" # summer

guns$season[guns$month %in% c(9, 10, 11)] <- "fall" # fall

# homicides by place and season

guns %>% 
  filter(intent == "Homicide") %>% 
  count(place, season)

# chi-squared test for variation in street killings over seasons

table(guns$season[guns$place == "Street"], guns$place[guns$place == "Street"])%>% 
  chisq.test()