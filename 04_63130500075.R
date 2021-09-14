#install.packages("dplyr")
library(dplyr)
glimpse(mtcars)

# Import datasets from CSV
Hotels <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/Hotels.csv")

# Sample 1: head()
head(Hotels,2)
Hotels %>% head()

# Sample 2: mean()
mean(Hotels$RateperNight)
Hotels$RateperNight %>% mean()

str(Hotels)

Hotels <- as_tibble(Hotels)
str(Hotels)
glimpse(Hotels)

#starwars
glimpse(starwars)

#How many observation and variable ?
# 87 obs 14 vari
#What is data type of mass and height ?
# Mass is DBL --> double
#What is average height of Starwars characters ?
starwars$height %>% mean(na.rm=T)

-----------------------------
# Selecting Columns
select(starwars,name,height)

# In class we use:
starwars %>% select(name,height)
starwars %>% select(-name,-height)

#Excluding
starwars %>% select(-hair_color,-skin_color,-eye_color)

starwars %>% filter(sex == "male")
starwars %>% filter(!(sex == "male"))
starwars %>% filter(sex == "male" | skin_color == "light")  # or
starwars %>% filter(sex == "male",skin_color == "light")    # and

starwars %>% arrange(height)
starwars %>% arrange(desc(height))

#summarise
starwars %>% summarise(height = mean(height, na.rm = TRUE))

#combining
#case 1: correct
starwars %>% select(name,height,mass, skin_color) %>% filter(skin_color=="light")
#case 2: error
starwars %>% select(name,height,mass) %>% 
  filter(skin_color=="light")
#case 3: 
starwars %>% filter(skin_color=="light") %>% 
  select(name,height,mass)

starwars %>% group_by(sex) %>% select(height) %>% summarise(avg = mean(height, na.rm = TRUE))

starwars %>%  filter(sex=="male") %>% dplyr::select(name,mass) %>% arrange(desc(mass))

------------------------------------------------
# Using dplyr

#install.packages("MASS")
library(MASS)

Mode(survey$Smoke, na.rm = TRUE)
summary(factor(survey$Smoke))

survey %>% dplyr::select(Smoke) %>% mode()
survey %>% filter(Smoke == "Never")
survey$Smoke %>% mode()

survey$Age %>% IQR()

survey %>% summarise(mode(Smoke, na.rm = TRUE))
