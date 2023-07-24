# Primary final table:

CREATE OR REPLACE TABLE t_zuzana_benikova_project_SQL_primary_final AS
	SELECT YEAR(cpr.date_from) AS 'Year', cpay.payroll_quarter AS 'Quarter', 
		cpr.value AS Food_price, cprc.name AS Category_food, cprc.price_value AS Quantity, 
		cprc.price_unit AS 'Unit_(kg,g,l,ks)', cpay.value AS Wages, cpu.name AS 'Unit_(Kč,tis.os.)', 
		cpc.name AS Payroll_calculation, cpvt.name AS Value_type, cpib.name AS Industry_branch, cpr.region_code AS Code_CR
	FROM czechia_price cpr
		JOIN czechia_price_category cprc ON cpr.category_code = cprc.code
		LEFT JOIN czechia_region cr ON cr.code = cpr.region_code AND cpr.region_code IS NULL
		JOIN czechia_payroll cpay ON cpay.payroll_year = YEAR(cpr.date_from)
		JOIN czechia_payroll_calculation cpc ON cpay.calculation_code = cpc.code 
		JOIN czechia_payroll_industry_branch cpib ON cpay.industry_branch_code = cpib.code 
		JOIN czechia_payroll_unit cpu ON cpay.unit_code = cpu.code 
		JOIN czechia_payroll_value_type cpvt ON cpay.value_type_code = cpvt.code
	WHERE cpay.value IS NOT NULL AND cpr.region_code IS NULL;



# Secondary final table:

CREATE OR REPLACE TABLE t_zuzana_benikova_project_SQL_secondary_final AS
	SELECT c.country, e.`year`, e.GDP, e.gini, c.population 
	FROM countries c 
	LEFT JOIN economies e ON c.country = e.country
	WHERE c.continent = 'Europe' AND e.`year` BETWEEN 2006 AND 2018; 




# View - pre vizualne zjednodusenie primary_final tabulky

CREATE OR REPLACE VIEW Average_wages_and_food_2006_2018 AS
SELECT 
	REPLACE(`Year`, ',', ' ') AS 'Year',
	Category_food AS Food_name,
	REPLACE(concat(Food_price, ' Kč / ', Quantity, ' ', `Unit_(kg,g,l,ks)`), '.', ',') AS Price,
	REPLACE(concat(round(avg(Wages)), ' ', `Unit_(Kč,tis.os.)`), ',', ' ') AS Average_wages, 
	Industry_branch 
FROM t_zuzana_benikova_project_sql_primary_final tzbpspf 
WHERE Value_type = 'Průměrná hrubá mzda na zaměstnance' AND Payroll_calculation = 'fyzický' AND Industry_branch IS NOT NULL 
GROUP BY `Year`, Category_food, Industry_branch 
ORDER BY `Year`;
