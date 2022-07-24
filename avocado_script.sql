use fruit;

alter table avocado_csv 
drop column Column1, year;

-- grouping sum of average price by region
select region, sum(AveragePrice) as "Sum of Average Price"
from avocado_csv ac
group by region
order by sum(AveragePrice) desc;

-- grouping average price and kind of avocados by type
select type, sum(AveragePrice) as "Sum of Average Price", 
			 round(sum(`4046`),2) as "Sum of 4046", round(sum(`4225`),2) as "Sum of 4225", 
			 round(sum(`4770`),2) as "Sum of 4770" 
from avocado_csv ac
group by type;

-- tracking average price and total volume over years
with year as (
select distinct cast(extract(year from Date) as year) as "Year", sum(AveragePrice) as "Sum of Average Price", 
				round(sum(`Total Volume`),2) as "Total Volume"
from avocado_csv ac
group by 1
)
select cast(Year as year) as "Year", `Sum of Average Price`, `Total Volume`
from year;

-- finding out total sales 3 kinds of avocado by region
select region, round(sum(`4046`)) as "Sum of 4046", round(sum(`4225`)) as "Sum of 4225", 
			   round(sum(`4770`)) as "Sum of 4770" 
from avocado_csv ac
group by region;