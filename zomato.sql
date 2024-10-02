SELECT * FROM country;
select * from data_1;
-- Q3 -- 
select country.Country, data_1.City, count(restaurantid) as Total_Restaurants 
from data_1 join country 
on data_1.CountryCode = Country.country_Code group by country.country,data_1.city 
order by Country.country, data_1.city;
-- Q4 --
select year(Datekey_Opening) as Year, month(Datekey_Opening) as Month, 
day(datekey_opening) as Day, count(RestaurantID) as Total_Restaurants from data_1 
group by year(Datekey_Opening),month(Datekey_Opening),day(datekey_opening) 
order by year(Datekey_Opening),month(Datekey_Opening),day(datekey_opening);
-- Q5 --
select Rating, count(restaurantid) as Total_Restaurant from data_1 group by Rating order by rating;
-- Q6 --
select case when
Average_Cost_for_two <=1000 then "0-1000"
when Average_Cost_for_two <=10000 then "1001-10000"
when Average_Cost_for_two <=100000 then "10001-100000"
else "100001-1000000"
end as Buckets, count(RestaurantID) as Total_Restaurants
from data_1 group by Buckets;
-- Q7 -- 
select Has_Table_Booking,
concat(round(Count(restaurantid)/(select count(restaurantid) from data_1)*100,0),"%") 
as Total_Restaurants from Data_1 group by Has_table_booking;
-- Q8 --
select Has_Online_Delivery,
concat(round(Count(restaurantid)/(select count(restaurantid) from data_1)*100,0),"%") 
as Total_Restaurants from Data_1 group by Has_online_delivery;
-- Q9 -- (Based on Cuisines)
select Cuisines,round(avg(Average_Cost_for_two),0) as Average_cost_for_Two 
from data_1 where cuisines = "South Indian";


