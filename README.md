# "𝐀 𝐒𝐭𝐮𝐝𝐲 𝐨𝐧 𝐈𝐧𝐝𝐮𝐬𝐭𝐫𝐢𝐚𝐥 𝐆𝐫𝐨𝐰𝐭𝐡 𝐚𝐧𝐝 𝐄𝐦𝐩𝐥𝐨𝐲𝐦𝐞𝐧𝐭 𝐆𝐞𝐧𝐞𝐫𝐚𝐭𝐢𝐨𝐧 𝐢𝐧 𝐓𝐞𝐥𝐚𝐧𝐠𝐚𝐧𝐚 𝐟𝐫𝐨𝐦 2019 𝐭𝐨 2022" #

As part of my recently completed 𝐃𝐚𝐭𝐚 𝐀𝐧𝐚𝐥𝐲𝐭𝐢𝐜𝐬 𝐚𝐧𝐝 𝐕𝐢𝐬𝐮𝐚𝐥𝐢𝐳𝐚𝐭𝐢𝐨𝐧 course at Ivy Professional School, I conducted a comprehensive study using 𝐌𝐲𝐒𝐐𝐋 to analyze the interplay between industrial expansion and employment dynamics in Telangana from 2019 to 2022. 

## 𝐊𝐞𝐲 𝐈𝐧𝐬𝐢𝐠𝐡𝐭𝐬: ##

🔍 Investigated sector-specific contributions to economic expansion

📈 Analyzed employment trends across different sectors. 

📊 Visualized data to illustrate growth patterns and correlations.


-----------------------------------------------------------------------------------------------------------------------------------------------------------





## **Sql queries** ##

## List down the top 5 districts that have attracted the most significant investments during FY 2019 to 2022?

select d.District, round(sum(i.`investment in cr`), 2) as Total_investment_in_Cr

from dim_districts d join investments i on d.dist_code = i.dist_code 

group by d.district

order by 2 desc

limit 5;


##  List down the bottom 5 districts that have attracted the least investments during FY 2019 to 2022?
select d.District, round(sum(i.`investment in cr`), 2) as Total_investment_in_Cr

from dim_districts d join investments i on d.dist_code = i.dist_code 

group by d.district

order by 2 

limit 5;


##  Top 3 sectors that have witnessed overall highest investments
select i.Sector, round(sum(i.`investment in cr`),2) as Total_Investments

from dim_districts d join investments i on d.dist_code = i.dist_code 

group by i.sector

order by 2 desc

limit 3;

##  Bottom 3 sectors that have witnessed overall least investments
select i.Sector, round(sum(i.`investment in cr`),2) as Total_Investments

from dim_districts d join investments i on d.dist_code = i.dist_code 

group by i.sector

order by 2 

limit 3;

##  Top 3 sectors that have generated overall highest employment
select i.Sector, sum(i.number_of_employees) as Total_Employment

from dim_districts d join investments i on d.dist_code = i.dist_code 

group by i.sector

order by 2 desc

limit 3;



##  List down the quarter wise investments for FY 2019 to 2022?
select d.`quarter` as Quarter, d.fiscal_year as Fiscal_year,  round(sum(i.`investment in cr`),2) as Total_investment

from investments i inner join dim_date d on i.month_year=d.month_year

group by d.`quarter`, d.fiscal_year

order by d.fiscal_year ;
