with cte as (
select Continent, MainContent, count(*) as Top_Ingredient
from country_region cr
inner join country_national_dish cnd
on cr.Country_ID = cnd.Country_ID
inner join main_contents mc
on cnd.Dishes_ID = mc.Dishes_ID
group by Continent, MainContent 
)

SELECT 
    Continent, MainContent, Top_Ingredient
FROM
    cte c
WHERE
    Top_Ingredient = (SELECT 
            MAX(Top_Ingredient)
        FROM
            cte cc
        WHERE
            cc.Continent = c.Continent)
ORDER BY Continent ASC;