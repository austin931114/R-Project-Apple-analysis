### revenue https://en.wikipedia.org/wiki/Apple_Inc.
### iphone sale https://www.finder.com/iphone-sales-statistics
### stock https://www.nasdaq.com/market-activity/stocks/aapl/historical

library(xml2)
library(rvest)
library(tidyverse)
library(lubridate)
library(nycflights13)
library(dplyr)

### GET apple revenue on wikipedia
revenue <- "https://en.wikipedia.org/wiki/Apple_Inc" %>%
  # read webpage and store in memory
  read_html() %>% 
  # extract the table part of the html code (third table)
  html_nodes("table") %>%
  .[3] %>% 
  # create R dataset from webpage contents
  html_table() %>% 
  .[[1]] %>% 
  # convert to a tibble
  as_tibble() %>% 
  # rename column names
  rename_all( ~ c("year", "Revenue_in_mil_USD", "Net_income_in_mil_USD", "Total_assets_in_mil_USD", "Employees"))
  
# filter revenue data to the specific period 2012 -2017
apple_revenue <- revenue %>% 
  # from 2012 to 2017
  filter(year >= 2012, year <= 2018) %>% 
  # remove extra numbers
  separate(year, into = c("year", "extra"), convert = TRUE) %>% 
  select(-extra) %>% 
  # change chr to int
  type_convert()


### grab apple sales data from Finder
apple_sales <- "https://www.finder.com/iphone-sales-statistics" %>%
  # read webpage and store in memory
  read_html() %>% 
  # extract the table part of the html code (first table)
  html_nodes("table") %>%
  .[1] %>% 
  # create R dataset from webpage contents 
  html_table() %>% 
  .[[1]] %>% 
  # convert to a tibble
  as_tibble() %>% 
  # rename column names
  rename_all( ~ c("year", "Avg_iPhone_price", "Avg_iPhone_market_share", "US_smartphone_penetration", "Est_iPhones_purchased", "Est_spent_on_iPhones")) %>% 
  # change chr to number typr
  type_convert()


### load the apple stock price csv file from Nasdaq website
stock <- read_csv("Historical_Apple.csv") %>% 
  # change chr to number typr
  type_convert() %>% 
  # remove improper character in column names
  rename(Close = "Close/Last") %>%
  # only find the data that exist
  filter(!is.na(Close)) %>% 
  # change data to correct time format
  mutate(Date_par = as.Date(Date, "%m/%d/%Y")) %>% 
  # remove wrong format data
  select(-Date) %>%
  # change new column to the orginal name
  rename(Date = "Date_par") %>% 
  # only choose the time period from 2012 to 2017
  filter(Date >= as.Date("2012-01-01"), Date <= as.Date("2017-12-31")) %>% 
  # remove data and month
  mutate(year = format(Date, "%Y"))

# remove "$" in Close, so it can turn into number type from chr
stock$new_Close = as.numeric(gsub("\\$", "", stock$Close))

# finalize stock data
apple_stock <- stock %>% 
  # remove chr Close data
  select(-Close) %>% 
  # to analyze the stock price by year not by month or date
  group_by(year) %>% 
  # average the stock close price from the entire year to see the year average of the close stock price
  summarise(Avg_stock_Dollar = mean(new_Close)) %>% 
  # change chr to number type
  type_convert()

### combine all three data sets apple_analysis, apple_sales, apple_stock
apple_analysis <- apple_revenue %>% 
  full_join(apple_sales, by = c("year")) %>% 
  full_join(apple_stock, by = c('year'))

### create a csv file from apple_analysis
write.csv(apple_analysis, "~/Desktop/STAT123/R practice/apple_analysis.csv", row.names = FALSE)









