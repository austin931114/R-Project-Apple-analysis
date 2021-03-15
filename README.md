# R-Project-Apple-analysis
analyze the relationship between Apple stock price and its performance

Data Story & Data Details
Yong Nan Chang
Data Story

Apple is one of the world's most valuable companies and the world's largest technology company. When people search the word "apple" on the internet, the first result is no fruit apple but the company's website. It has a tremendous impact on our daily life. Although the company started selling the personal pc, Mac, which is still a popular product today, the iPhone's invention is the fundamental reason for its success today. iPhone changes society is in various ways. For instance, before the iPhone, most of the phone comes with a physical keyboard that limits the screen size, showing more information, and apple invents the first practical touch screen phone that makes human-machine interaction easier. Right now, as the iPhone develops, the smartphone becomes a necessity for many people, and it facilitates people's daily work in numerous ways.
	
	The purpose of the data is to examine Apple's income and revenue by comparing it to the iPhone selling numbers. Is there a direct relationship between iPhone sales and Apple's wealth?


Data Details

•	The revenue, sales, and stock datasets are on three different websites. The data apple analysis is created by joined all three of these datasets by years from 2012 to 2017.

•	The revenue dataset is from the Wikipedia Apple page. The time range of the dataset is from 2000 to 2019, and it includes Apple's revenue in millions of the US dollar, net income in millions of the US dollar, total assets in millions of the US dollar, and the employees' number. In this analysis, we only use the data from 2012 to 2017 to compare with other datasets.

The link to Wikipedia Apple page:
https://en.wikipedia.org/wiki/Apple_Inc.

The process to structure the data:
- Read the third table on the Wikipedia Apple page that includes the Apple finance information into the R memory
- Change the data to a tibble
- Put appropriate column name for the dataset
- Select years from 2012 to 2018 and remove additional numbers in the year cell
- Change improper data type from character to integer

•	The iPhone sales data is from the Finder website. It includes many statistics from various companies in different fields. The iPhone statistics table contains the iPhone's sales from 2012 to 2017. It comprises average iPhone price in the US dollar, average iPhone US market share in percentage, US smartphone penetration in percentage, estimated iPhone purchased number of the year, and estimated total amount spend on iPhones. By comparing the table with other datasets, we can analyze the relationship between iPhone sales and Apple's performance.

The link to the iPhone statistics table:
https://www.finder.com/iphone-sales-statistics

The process to construct the data:
- Read the first table on the finder iPhone page that includes the iPhone sales information into the R memory
- Change the data to a tibble
- Edit appropriate column name for the dataset
- Change improper data type from character to integer


•	The stock dataset is the AAPL Historical Data from the Nasdaq, and it can be downloaded as a CSV file. Nasdaq is the National Association of Securities Dealers Automated Quotations exchange. It is the first electronic exchange perform for the investor to buy and sell stocks. The data time frame is from 10/13/2020 to 10/13/2020, and I only use the data from 01/01/2012 to 12/31/2017. This data contains the information of Data, the close price of the day, the volume of the day, the open price, the high price, and the low price. The analysis will use the mean close stock price to represent the stock price.

The link to AAPL Historical Data:
https://www.nasdaq.com/market-activity/stocks/aapl/historical

The process to construct the data:
	- Download the data from the link above
	- Read the CSV file in the R memory
	- Exclude the non-exist datasets that might cause computation error
- Rename the improper column names with "/" and column data format from month/date/ year to year/month/date
- Select the data only from 01/01/2012 to 12/31/2017 and only keep the year by removing data and month information 
	- Change improper data type from character to integer
- Organize the Close price by removing the $ symbol in the data and average the close price by the year
•	After the preparation of all three datasets, joining them together by year as one date that names apple analysis

•	Output apple analysis as a CSV file

