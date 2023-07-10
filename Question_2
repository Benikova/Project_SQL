# 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT 
	REPLACE(`Year`, ',', ' ') AS 'Year', 
	REPLACE(concat(round(avg(Food_price), 2), ' Kč / ', Quantity, ' ', `Unit_(kg,g,l,ks)`), '.', ',') AS Price, 
	Category_food AS Food_name,
	REPLACE(concat(round(avg(Wages)), ' Kč'), ',', ' ') AS Average_wages,
	concat(floor(avg(Wages) / avg(Food_price)), ' ', `Unit_(kg,g,l,ks)`)  AS  Purchase
FROM t_zuzana_benikova_project_sql_primary_final 
WHERE Value_type = 'Průměrná hrubá mzda na zaměstnance' AND Payroll_calculation = 'fyzický' AND Industry_branch IS NOT NULL AND 
	Category_food IN ('Chléb konzumní kmínový', 'Mléko polotučné pasterované') AND `Year` IN ('2006', '2018')
GROUP BY `Year`, Category_food;


/*
Za prvé porovnateľné obdobie, rok 2006, je možné si kúpiť 1 261 kg chleba a 1 408 litrov mlieka.
Za posledné porovnateľné obdobie, rok 2018, je možné si kúpiť 1 319 kg chleba a 1 613 litrov mlieka.
*/
