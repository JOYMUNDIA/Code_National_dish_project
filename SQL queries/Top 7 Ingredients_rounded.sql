WITH cte AS (
SELECT 
    cont.MainContent AS Core_Ingredient,
    COUNT(cont.MainContent) AS Ingredient_Count
FROM
    main_contents cont
        INNER JOIN
    country_national_dish cnd ON cnd.Dishes_ID = cont.Dishes_ID
GROUP BY cont.MainContent
ORDER BY COUNT(cont.MainContent) DESC
)

SELECT Core_Ingredient, 
		Ingredient_Count, 
        ROUND((Ingredient_Count/(SELECT SUM(Ingredient_Count) AS TOTAL FROM cte)) * 100, 0) AS Percentage
FROM cte
GROUP BY Core_Ingredient
ORDER BY Percentage DESC
LIMIT 7;