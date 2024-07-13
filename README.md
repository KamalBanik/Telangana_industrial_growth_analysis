# A Study on Industrial Growth and Employment Generation in Telangana from 2019 to 2022 

## Project Description 
This comprehensive study leverages MySQL to analyze the interplay between industrial expansion and employment dynamics in Telangana from 2019 to 2022. The analysis aims to provide valuable insights into sector-specific contributions to economic growth and employment trends.

Dataset has been downloaded from this website: https://data.telangana.gov.in/



### Key Insights:
🔍 Investigated sector-specific contributions to economic expansion.

📈 Analyzed employment trends across different sectors.

📊 Visualized data to illustrate growth patterns and correlations.






### Sql Queries

   #### Create the database

CREATE DATABASE industrial_growth;



   #### Use the database

USE industrial_growth;



   #### List down the top 5 districts that have attracted the most significant investments during FY 2019 to 2022:

SELECT d.District, ROUND(SUM(i.investment_in_cr), 2)

AS Total_investment_in_Cr

FROM dim_districts d

JOIN investments i ON d.dist_code = i.dist_code

GROUP BY d.district

ORDER BY 2 DESC

LIMIT 5;

   #### List down the bottom 5 districts that have attracted the least investments during FY 2019 to 2022:

SELECT d.District, ROUND(SUM(i.investment_in_cr), 2) AS Total_investment_in_Cr

FROM dim_districts d

JOIN investments i ON d.dist_code = i.dist_code

GROUP BY d.district

ORDER BY 2

LIMIT 5;

   #### Top 3 sectors that have witnessed overall highest investments:

SELECT i.Sector, ROUND(SUM(i.investment_in_cr), 2) AS Total_Investments

FROM dim_districts d

JOIN investments i ON d.dist_code = i.dist_code

GROUP BY i.sector

ORDER BY 2 DESC

LIMIT 3;

   #### Bottom 3 sectors that have witnessed overall least investments:

SELECT i.Sector, ROUND(SUM(i.investment_in_cr), 2) AS Total_Investments

FROM dim_districts d

JOIN investments i ON d.dist_code = i.dist_code

GROUP BY i.sector

ORDER BY 2

LIMIT 3;

   #### Top 3 sectors that have generated overall highest employment:

SELECT i.Sector, SUM(i.number_of_employees) AS Total_Employment

FROM dim_districts d

JOIN investments i ON d.dist_code = i.dist_code

GROUP BY i.sector

ORDER BY 2 DESC

LIMIT 3;


   #### List down the quarter wise investments for FY 2019 to 2022:

SELECT d.quarter AS Quarter, d.fiscal_year AS Fiscal_year, ROUND(SUM(i.investment_in_cr), 2) AS Total_investment

FROM investments i

INNER JOIN dim_date d ON i.month_year = d.month_year

GROUP BY d.quarter, d.fiscal_year

ORDER BY d.fiscal_year;



### Features
District-Level Analysis: Identifies top and bottom districts in terms of investment.

Sectoral Insights: Highlights sectors with the highest and lowest investments and employment generation.

Time-Series Analysis: Provides quarter-wise investment trends.



### Contributing
Contributions are welcome! Please fork the repository and submit a pull request.


### Contact Information
For any questions or suggestions, please reach out to:

Name: Kamal Banik

Email: kamalbanikce92@gmail.com

LinkedIn: https://www.linkedin.com/in/kamalbanik/
