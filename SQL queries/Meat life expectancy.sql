WITH cte AS (
SELECT LifeExpectancy AS "Overall Life Expectancy", FemalesLifeExpectancy AS "Female Life Expectancy", MalesLifeExpectancy AS "Male Life Expectancy",
CASE
WHEN MainContent IN ("Beef", "Lamb") AND MainContent NOT IN ("Chicken", "Fish") THEN 'Red Meat'
WHEN MainContent IN ("Chicken", "Fish") AND MainContent NOT IN ("Beef", "Lamb") THEN 'White Meat'
ELSE 'National Dish contains either both or neither red meat nor white meat'
END AS Type_of_meat
FROM life_expectancy le
inner join country_national_dish cnd
on le.Country_ID = cnd.Country_ID
inner join main_contents mc
on cnd.Dishes_ID = mc.Dishes_ID
)

SELECT 
    *
FROM
    cte
WHERE
    Type_of_meat = 'Red Meat'
        OR Type_of_meat = 'White Meat';