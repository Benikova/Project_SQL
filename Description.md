Discord: Zuzi#9300


# Project_SQL

Zadání projektu: Data o mzdách a cenách potravin a jejich zpracování pomocí SQL
Úvod do projektu
Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.
Potřebují k tomu od vás připravit datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období a jako dodatečný materiál připravte i tabulku s daty o dalších evropských států ve stejném období, jako primární přehled pro ČR.
Výzkumné otázky
1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3.	Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?


# Výstup projektu
Projekt SQL: Dostupnosť základných potravín širokej verejnosti

Dátová analýza: Porovnanie dostupnosti potravín prostredníctvom cien a priemerných príjmov za sledované časové obdobie v ČR a ostatných európskych štátoch.


Pre porovnanie dostupnosti potravín na základe priemerných príjmov za sledované časové obdobie rokov 2006-2018, sme vytvorili databázovú tabuľku s názvom „t_zuzana_benikova_project_SQL_primary_final“.

Pre zodpovedanie požadovaných výskumných otázok sme pripravili robustné dátové podklady, spojením primárnych tabuliek (czechia_price a czechia_payroll) a k ním pridružených číselníkov štatistického úradu ČR.
Vytvorením takejto databázovej tabuľky sme dostali k dispozícii veľké množstvo dát. Naše výpočty by tak boli časovo a priestorovo náročné, ktoré zaťažujú server a zaberajú pamäť. Preto sme takto pripravene dáta museli prispôsobiť naším potrebám a zvoliť vhodné kritéria na ich úpravu (napr. odstránením duplicít, nulových hodnôt, použitie vhodných agregačných funkcií a pod.)

Prostredníctvom tabuliek "countries" a "economies" sme spracovali dodatočné dáta o Európskych štátoch a vytvorili databázovú tabuľku s názvom "t_zuzana_benikova_project_SQL_secondary_final".  Primárne obsahuje HDP, GINI, populáciu ďalších Európskych štátov v rovnakom období (r.2006-2018), ako je primárny prehľad pre ČR.
Pre tlačové oddelenie sme za pomoci view vytvorili zjednodušený a zároveň komplexný pohľad na spracovávané dáta. Z pripravených tabuliek sme získali dátové podklady a prostredníctvom SQL dotazov sme odpovedali na vytýčené výskumné otázky. Odpovede sme sa snažili koncipovať tak, aby boli vhodné pre tlačové oddelenie, ktoré bude tieto výsledky prezentovať na nasledujúcej konferencii zameranej na túto oblasť.

Odpovede na výzkumné otázky:
1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
V priebehu sledovaného obdobia, rokov 2006 – 2018, priemerne mzdy vo všetkých obdobiach rastú. Pri porovnávaní medziročného obdobia, v roku 2013 nastal pokles priemerných miezd vo väčšine odvetví, v odvetviach, kde nedošlo k poklesu, bol nárast minimálny. 

2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
Za prvé porovnateľné obdobie, rok 2006, je možné si kúpiť 1 261 kg chleba a 1 408 litrov mlieka.
Za posledné porovnateľné obdobie, rok 2018, je možné si kúpiť 1 319 kg chleba a 1 613 litrov mlieka.

3.	Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
Priemerný najnižší percentuálny medziročný nárast v sledovanom období je u kategórie potravín: Cukr krystalový, a to -1,92%, čiže táto kategória zdražuje najpomalšie. 

4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Počas celého sledovaného obdobia nebol rast cien výrazne vyšší (viac ako 10 %), ako rast miezd. Najvýraznejší nárast môžeme pozorovať v roku 2017, kde priemerné ceny potravín vzrástli o 9,98% a priemerná výška miezd iba o 6,4%.

5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
V sledovanom období nezaznámenávame výraznejší rast HDP (nad 10%), ani rast miezd či cien. Z časového hľadiska je nárast alebo pokles HDP plynulý. Podobne reagujú aj mzdy, aj keď s určitým časovým oneskorením. Z našich údajov je vidieť, že ceny potravín nie sú priamo ovplyvnená zmenou rastu HDP.  
Vzťah medzi zmenami HDP, mzdami a canami potravín je zložitý a hlavne závislý na viacerých faktoroch, ako je inflácia, medzinárodné ekonomické prostredie, politika štátu..


