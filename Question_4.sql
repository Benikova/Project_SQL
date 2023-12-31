# 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?


SELECT
	YEAR,
	round(avg(Wages)) AS Average_wages,
	round(avg(Food_price), 2) AS Average_food_price, 
	round(((avg(Wages) - lag(avg(Wages)) OVER (PARTITION BY Industry_branch ORDER BY `Year`)) 
		/ lag(avg(Wages)) OVER (PARTITION BY Industry_branch ORDER BY `Year`)) * 100, 2) AS Percentage_change_wages, 
	round(((avg(Food_price) - lag(avg(Food_price)) OVER (ORDER BY `Year`)) 
		/ lag(avg(Food_price)) OVER (ORDER BY `Year`)) * 100, 2) AS Percentage_change_price
FROM t_zuzana_benikova_project_sql_primary_final tzbpspf
WHERE Value_type = 'Průměrná hrubá mzda na zaměstnance' AND Payroll_calculation = 'fyzický' AND Industry_branch IS NOT NULL
GROUP BY `Year`;



/* 
Počas celého sledovaného obdobia nebol rast cien výrazne vyšší (viac ako 10 %), ako rast miezd. 
Najvýraznejší nárast môžme pozorovať v roku 2017, kde priemerné ceny potravín vzrástli o 9,98% a priemerná výška miezd iba o 6,4%. 
*/
