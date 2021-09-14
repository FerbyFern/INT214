#install.packages("dplyr")
#install.packages("readr")
#install.packages("assertive")
#install.packages("stringr")
library(dplyr)
library(readr)
library(assertive)
library(stringr)
------------------------------
cars <- as_tibble(mtcars)
glimpse(cars)

cars %>% head()
head(cars)

glimpse(starwars)
# select filter arrange summarise group_by
starwars %>% select(name,height)
starwars %>% select(-name,height)
starwars %>% filter(sex == "male",skin_color == "light")
starwars %>% arrange(height)
starwars %>% summarise(height = mean(height, na.rm = TRUE))
starwars %>% group_by(sex) %>% select(height) %>% summarise(avg = mean(height, na.rm = TRUE))
--------------------------------
# Save into new variable
sw <- starwars

# Rename Column named hair_color to hair
sw <- sw %>% rename(hair=hair_color)
glimpse(sw)

--------------------------
# Mutate
sw %>% mutate(height_m = height / 100)

# Transmute
sw %>% transmute(height_m = height / 100)


# Data Cleaning ------------------------------
library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation
library(assertive)  # Readable check functions to ensure code integrity

products <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/products_original.csv")

glimpse(products)
products %>% head()
products %>% View()

products %>% rename(type=gender)

--------------------------------------
# Logical checking
is.character()
is.numeric()
is.logical()
is.factor()
is.Date()

# assertive
assert_is_character()
assert_is_numeric()
...

-----------------------------------------
is.numeric(products$price)
assert_is_numeric(products$price)

is.numeric(products$sold)
assert_is_numeric(products$sold)

is.factor(products$gender)

# 4.Changing the types of values
as.character()
as.factor()
as.numeric()

products$gender <- as.factor(products$gender)
summary(products$gender)

-------------------------------------
# 5. Handling String with stringr
products$price %>% as.numeric() %>% head()

products$price <-
  products$price %>% str_remove("THB") %>% str_trim() %>% 
  str_remove(",") %>% as.numeric()
glimpse(products)

-------------------------------------
# 6. Removing duplicate data
# Duplicate elements
products %>% duplicated() %>% table()
products %>% duplicated() %>% sum()
products %>% filter(duplicated(products))

# Using only distinct observation
products <-
  products %>% distinct()

## FINDING
products %>% count()
products %>% mutate(sales = price*sold) %>% summarise(gross_sales = sum(sales))

-------------------------------------
# 7. Handling missing data and outliers
nums <- c(1,2,3,4,NA)
mean(nums,na.rm = TRUE)

std_room <- data.frame(
  name=c("Antony","Baifern","Caty","Daniel","Julia","Susan","Tom"),
  mid_score = c(29, 26, 15, 19, 22, 50, NA),
  final_score = c(NA, 15, 26, 19, 20, 18, 20)
)

# Display list of students who absent in each examination.
std_room %>% filter(is.na(mid_score)|is.na(final_score))

# Display list of students who has taking all exams.
std_room %>% na.omit()

# Handling Range Values
assert_all_are_in_closed_range(std_room$mid_score, lower = 0, upper = 30)
assert_all_are_in_closed_range(std_room$final_score, lower = 0, upper = 30)

std_room$mid_score <- replace(std_room$mid_score,std_room$mid_score == 50, 15)

# Student's who get highest midterm score in this room.
std_room %>% filter(mid_score==max(mid_score,na.rm = T))

---------------------------------------------
## Teacher need your help more: (KEY)
# Cleaning Data
std_room$mid_score <- 
  replace(std_room$mid_score,is.na(std_room$mid_score), 0)
std_room$final_score <- 
  replace(std_room$final_score,is.na(std_room$final_score), 0)

# List all of students with total score in descending order.
std_room %>% mutate(total_score=mid_score+final_score) %>% 
  select(name,total_score) %>% arrange(desc(total_score))




