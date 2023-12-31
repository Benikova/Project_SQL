# 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

SELECT 
	REPLACE(`Year`, ',', ' ') AS 'Year',
	REPLACE(concat(round(avg(Wages)), ' ', `Unit_(Kč,tis.os.)`), ',', ' ') AS Average_wages,
	round(((avg(Wages) - lag(avg(Wages)) OVER (PARTITION BY Industry_branch ORDER BY `Year`)) / 
	lag(avg(Wages)) OVER (PARTITION BY Industry_branch ORDER BY `Year`)) * 100) AS percentage_change, 
	round((avg(Wages)) - lag(avg(Wages)) OVER (PARTITION BY Industry_branch ORDER BY `Year`)) AS value_change_Kč,
	Industry_branch 
FROM t_zuzana_benikova_project_sql_primary_final tzbpspf 
WHERE Value_type = 'Průměrná hrubá mzda na zaměstnance' AND Payroll_calculation = 'fyzický' AND Industry_branch IS NOT NULL 
GROUP BY Industry_branch, `Year`;


/* 
V priebehu sledovaného obdobia, roky 2006 – 2018, priemerne mzdy vo všetkých obdobiach rastú. 
Pri porovnávaní medziročného obdobia, v roku 2013 nastal pokles priemerných miezd vo väčšine odvetví, 
v odvetviach, kde nedošlo k poklesu, bol nárast minimálny, viď stĺpe "percentage_change" a "value_change_Kč". 
*/ 
