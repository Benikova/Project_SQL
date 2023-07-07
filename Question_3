# 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?


SELECT Category_food, round(avg(Percentage_change), 2) AS Average_percentage_change
FROM 
	(
	SELECT
		Category_food,
		round(avg(Food_price), 2),
		round(((avg(Food_price) - lag(avg(Food_price)) OVER (PARTITION BY Category_food ORDER BY `Year`)) 
		/ lag(avg(Food_price)) OVER (PARTITION BY Category_food ORDER BY `Year`)) * 100, 2) AS Percentage_change
	FROM t_zuzana_benikova_project_sql_primary_final tzbpspf 
	GROUP BY Category_food, `Year`
	) AS subselect
GROUP BY 
	category_food
ORDER BY Average_percentage_change ASC
LIMIT 1;


/* 
Priemerný najnižší percentuálny medziročný nárast v sledovanom období je u kategórie potravín: Cukr krystalový, a to -1,92%,
čiže táto kategória zdražuje najpomalšie. 
*/
