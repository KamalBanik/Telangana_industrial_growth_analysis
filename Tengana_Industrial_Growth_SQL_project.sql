-- creating a database named telengana_revenue
create database telengana_revenue ;

-- using the database for further work on it 
use telengana_revenue ;

-- Adding new column and changing the date format from text to date
set sql_safe_updates = 0 ;

alter table dim_date
add column month_year date ;

update dim_date
set month_year = str_to_date(`month`, "%Y-%m-%d") ;



alter table investments
add column month_year date ;
update investments
set month_year = str_to_date(`month`, "%d-%m-%Y") ;



-- 1.a. List down the top 5 districts that have attracted the most significant investments during FY 2019 to 2022?
select d.District, round(sum(i.`investment in cr`), 2) as Total_investment_in_Cr
from dim_districts d join investments i on d.dist_code = i.dist_code 
group by d.district
order by 2 desc
limit 5;

-- 1.b. List down the bottom 5 districts that have attracted the least investments during FY 2019 to 2022?
select d.District, round(sum(i.`investment in cr`), 2) as Total_investment_in_Cr
from dim_districts d join investments i on d.dist_code = i.dist_code 
group by d.district
order by 2 
limit 5;


-- 2.a. Top 3 sectors that have witnessed overall highest investments
select i.Sector, round(sum(i.`investment in cr`),2) as Total_Investments
from dim_districts d join investments i on d.dist_code = i.dist_code 
group by i.sector
order by 2 desc
limit 3;

-- 2.b. Bottom 3 sectors that have witnessed overall least investments
select i.Sector, round(sum(i.`investment in cr`),2) as Total_Investments
from dim_districts d join investments i on d.dist_code = i.dist_code 
group by i.sector
order by 2 
limit 3;

-- 3. Top 3 sectors that have generated overall highest employment
select i.Sector, sum(i.number_of_employees) as Total_Employment
from dim_districts d join investments i on d.dist_code = i.dist_code 
group by i.sector
order by 2 desc
limit 3;


-- 4. List down the quarter wise investments for FY 2019 to 2022?
select d.`quarter` as Quarter, d.fiscal_year as Fiscal_year,  round(sum(i.`investment in cr`),2) as Total_investment
from investments i inner join dim_date d on i.month_year=d.month_year
group by d.`quarter`, d.fiscal_year
order by d.fiscal_year ;





