# 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, 
  projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

SELECT
	tzbpspf.`Year`,
	round(((GDP - LAG(GDP) OVER (ORDER BY `year`)) / LAG(GDP) OVER (ORDER BY `year`)) * 100, 2) AS percentage_change_GDP,
	round(((avg(Wages) - lag(avg(Wages)) OVER (PARTITION BY Industry_branch ORDER BY `Year`)) 
		/ lag(avg(Wages)) OVER (PARTITION BY Industry_branch ORDER BY `Year`)) * 100, 2) AS Percentage_change_wages, 
	round(((avg(Food_price) - lag(avg(Food_price)) OVER (ORDER BY `Year`)) 
		/ lag(avg(Food_price)) OVER (ORDER BY `Year`)) * 100, 2) AS Percentage_change_price
FROM t_zuzana_benikova_project_sql_primary_final tzbpspf
JOIN t_zuzana_benikova_project_sql_secondary_final tzbpssf ON tzbpspf.`Year` = tzbpssf.`year` 
WHERE Value_type = 'Průměrná hrubá mzda na zaměstnance' AND Payroll_calculation = 'fyzický' AND Industry_branch IS NOT NULL AND country = 'Czech Republic'
GROUP BY `Year`;



/*
V sledovanom období nezaznámenávame výraznejší rast HDP (nad 10%), ani rast miezd či cien. Z časového hľadiska je nárast alebo pokles HDP plynulý. Podobne reagujú aj mzdy, aj keď s určitým časovým oneskorením. Z našich údajov je vidieť, že ceny potravín nie sú priamo ovplyvnená zmenou rastu HDP.  
Vzťah medzi zmenami HDP, mzdami a canami potravín je zložitý a hlavne závislý na viacerých faktoroch, ako je inflácia, medzinárodné ekonomické prostredie, politika štátu..
*/
