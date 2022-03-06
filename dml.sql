# Total Num of crimecases per victim age (check)
SELECT date_occurance, count(dr_number) as count_of_cases, count(victim_age) as count_of_victim 
FROM data225proj.crime_record
group by date_occurance;


SELECT a.area_name, count(dr_number) as count_of_cases, count(victim_age) as count_of_victim 
FROM data225proj.crime_record cr 
join data225proj.area a on cr.area_id = a.area_pk
group by a.area_name;

# Total Num of crimecases per status
SELECT S.status_description,COUNT(dr_number) as count_of_cases 
FROM data225proj.crime_record as Cr 
JOIN data225proj.status_type as S ON Cr.status_id = S.status_id 
group by S.status_description
order by COUNT(dr_number) desc;

# Total Num of crimecases per motivation – TOP 5
select  M.mo_description as Motivation, count(Dr_number) as Count_of_cases 
from data225proj.crime_mo as Mo 
join data225proj.motivation_type as M on Mo.mo_code = M.mo_code 
group by M.mo_description 
order by count(dr_number) desc 
limit 5;

# Total Num of crimecases per crime code – TOP10
SELECT ct.crime_code_description, count(cr.dr_number) as count_of_cases 
FROM data225proj.crime_record cr
inner join data225proj.crime_type ct on ct.crime_code = cr.crime_code
group by ct.crime_code_description
order by count(cr.crime_code) desc
limit 10;

# Total Num of crimecases per weapon used – TOP10 
SELECT w.weapon_description, count(cr.dr_number) as count_of_cases
FROM data225proj.crime_record cr
inner join data225proj.weapon_used_type w on w.weapon_used_id = cr.weapon_used_id
group by w.weapon_description
order by count(cr.weapon_used_id) desc
limit 10;

# Total Num of crimecases per area – TOP10
SELECT
  area_name, COUNT(dr_number) as count_of_crimes
FROM
  data225proj.crime_record AS cr
JOIN
  data225proj.area as a
ON cr.area_id = a.area_pk
group by a.area_name
order by count(dr_number) desc 
limit 10;


# Total Num of crimecases per victim age – TOP10
select cr.victim_age,count(cr.dr_number) as crime_count_per_age
from data225proj.crime_record cr
group by cr.victim_age
order by count(cr.dr_number) desc
limit 10;

# Total Num of crimecases per victim_descent  – TOP10
select v.victim_description,count(cr.dr_number) as count_of_crime_cases
from data225proj.crime_record as cr 
join data225proj.victim_descent as v on cr.victim_descent_id = v.victim_descent_id
group by v.victim_description
order by count(cr.dr_number) desc
limit 10;

# Total Num of crimecases per premise – TOP10
select p.premise_description,count(cr.dr_number) as count_of_crime_cases
from data225proj.crime_record as cr 
join data225proj.premise_type as p on cr.premise_code = p.premise_code
group by p.premise_description
order by count(cr.dr_number) desc
limit 10;

# Total Num of crimecases group by victim age per victim sex (changed)
select victim_age ,victim_sex, count(dr_number) as count_of_crime_cases 
from data225proj.crime_record 
group by  victim_age, victim_sex 
order by count(dr_number) desc
limit 10;

#Total Num of crimecases per victim sex 
select victim_sex, count(dr_number) as count_of_crime_cases 
from data225proj.crime_record 
group by  victim_sex 
order by count(dr_number) desc;

#total num of crimecases per priority
SELECT p.description, COUNT(dr_number) AS count_of_crime_cases
FROM data225proj.crime_record as cr
join data225proj.priority as p on cr.priority_code = p.priority_code
GROUP BY p.description
ORDER BY COUNT(dr_number) DESC;


Select year(date_occurance), count(dr_number) 
from crime_record 
group by year(date_occurance)