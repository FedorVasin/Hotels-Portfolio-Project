-- Let's look at the data and merge it with union 


Select * From PortfolioProject..market_segment$

Select * From PortfolioProject..meal_cost$


With Hotels as (
Select * From PortfolioProject..['2018$']
union
Select * From PortfolioProject..['2019$']
union
Select * From PortfolioProject..['2020$']
)


Select * From Hotels
left join PortfolioProject..market_segment$ 
on Hotels.market_segment = market_segment$.market_segment
left join PortfolioProject..meal_cost$
on PortfolioProject..meal_cost$.meal = Hotels.meal




--Select revenue by each year


With Hotels as (
Select * From PortfolioProject..['2018$']
union
Select * From PortfolioProject..['2019$']
union
Select * From PortfolioProject..['2020$']
)


Select arrival_date_year, hotel, round(sum((stays_in_week_nights + stays_in_weekend_nights) * adr), 2) as Revenue From Hotels
Group by arrival_date_year, hotel
order by arrival_date_year
