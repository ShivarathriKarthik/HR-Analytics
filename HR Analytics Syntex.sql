use p296;

# KPI 1
with t as
(
select 
Department
,count(case when Attrition = "yes" then 1 end) as count
,count(*) as t_count
from p296.hr_1_csv
group by Department
)
select 
department
,round((count/t_count)*100,2) as avg_attrition_rate
from t 
order by avg_attrition_rate;

# KPI 2

select
 jobrole
 ,avg(HourlyRate) as avg_hourly_rate
 from p296.hr_1_csv
 where gender ='male' and jobrole ="research scientist"
group by jobrole;

# KPI 3
with t as
(
select 
Department
,count(case when Attrition = "yes" then 1 end) as count
,count(*) as t_count
,avg(MonthlyIncome) as avg_monthly_income
from p296.hr_1_csv as o inner join p296.hr_2_csv as t on o.EmployeeNumber = t.`Employee ID`
group by Department
)
select 
department
,round((count/t_count)*100,2) as avg_attrition_rate
,avg_monthly_income
from t 
order by avg_attrition_rate;

# KPI 4

select 
department
,avg(TotalWorkingYears) as avg
from p296.hr_1_csv as o inner join p296.hr_2_csv as t on o.EmployeeNumber = t.`Employee ID`
group by department
order by avg;

# KPI 5

select
jobrole
,avg(WorkLifeBalance) as avg
from p296.hr_1_csv as o inner join p296.hr_2_csv as t on o.EmployeeNumber = t.`employee id`
group by jobrole
order by avg ;

# KPI 6

select 
JobRole
,avg(YearsSinceLastPromotion) as average
from p296.hr_1_csv as o inner join p296.hr_2_csv as t on o.EmployeeNumber = t.`Employee ID`
where Attrition ='yes'
group by jobrole;


# KPI 7
with t as
(
select 
BusinessTravel
,count(case when Attrition = "yes" then 1 end) as count
,count(*) as t_count
from p296.hr_1_csv
group by BusinessTravel
)
select
BusinessTravel,
(count/t_count)*100 as avg_arrtition
from t;

#.KPI-8

with t as
(
select 
Case when DistanceFromHome  <=10 then "0-10"
when DistanceFromHome  <=20 then "11-20"
when DistanceFromHome  <=30 then "21-30"
when DistanceFromHome  <=40 then "31-40"
else "41&above"
end as distance_bucket_from_home
,count(case when Attrition = "yes" then 1 end) as count
,count(*) as t_count
from p296.hr_1_csv
group by distance_bucket_from_home
order by distance_bucket_from_home
)
select
distance_bucket_from_home
,(count/t_count)*100 as avg_attrition_rate
from t;

select 
Case when DistanceFromHome  <=10 then "0-10"
when DistanceFromHome  <=20 then "11-20"
when DistanceFromHome  <=30 then "21-30"
when DistanceFromHome  <=40 then "31-40"
else "41&above"
end as distance_bucket_from_home
,count(case when Attrition = "yes" then 1 end) as count
,count(*) as t_count
from p296.hr_1_csv
group by distance_bucket_from_home
order by distance_bucket_from_home;

# KPI 9

with t as
(
select 
OverTime
,count(case when Attrition = "yes" then 1 end) as count
,count(*) as t_count
from p296.hr_1_csv as o inner join p296.hr_2_csv as t on o.EmployeeNumber = t.`Employee ID`
group by overtime
)
select
overtime
,(count/t_count)*100 as avg_attrition_rate
from t;

# KPI 10

with t as
(
select 
EducationField
,count(case when Attrition = "yes" then 1 end) as count
,count(*) as t_count
from p296.hr_1_csv 
group by EducationField
)
select
EducationField
,(count/t_count)*100 as avg_attrition_rate
from t;

#.KPI-11

with t as
(
select 
Case when age >= 18 and age<=25 then "18-25"
when age  <=35 then "26-35"
when age  <=45 then "36-45"
when age  <=55 then "46-55"
else "56&above"
end as age_bucket
,count(case when Attrition = "yes" then 1 end) as count
,count(*) as t_count
from p296.hr_1_csv
group by age_bucket
order by age_bucket
)
select
age_bucket
,(count/t_count)*100 as avg_attrition_rate
from t;