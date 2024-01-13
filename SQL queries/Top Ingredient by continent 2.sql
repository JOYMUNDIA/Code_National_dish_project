with cte as (
select Continent, MainContent AS Continent_MainContent, count(*) as Top_Ingredient_Count,
dense_rank() over (partition by Continent order by count(*) desc) as rnk,
ROUND((Count(*)/(SUM(Count(*)) OVER (partition by Continent)) * 100), 2) AS Percent_Continent_Total
from country_region cr
inner join country_national_dish cnd
on cr.Country_ID = cnd.Country_ID
inner join main_contents mc
on cnd.Dishes_ID = mc.Dishes_ID
group by Continent, MainContent )

SELECT 
    Continent, Continent_MainContent, Top_Ingredient_Count, Percent_Continent_Total
FROM
    cte
WHERE
    rnk = 1
ORDER BY Continent , Continent_MainContent;