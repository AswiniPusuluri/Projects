
-- ----------------------------
insert into crime_record(dr_number,date_reported,date_occurance,victim_age,victim_sex,time_ocuurance,area_id,priority_code,
crime_code,premise_code,
weapon_used_id,status_id,victim_descent_id,crime_address_code)
select cdf.DR_Number,cdf.Date_Reported,cdf.Date_Occurred,cdf.Victim_Age,cdf.Victim_Sex,cdf.Time_Occurred,a.area_pk,p.priority_code,
ct.crime_code,pt.premise_code,
w.weapon_used_id,st.status_id,v.victim_descent_id,ca.crime_address_code
from crime_data_full cdf
left join crime_address ca on ca.latitude = cdf.latitude and ca.longitude = cdf.longitude and ca.crime_address = cdf.Crime_Address
left join area a on a.reporting_district_num = cdf.Reporting_District_Num
left join priority p on p.priority_code = cdf.Priority_Code
left join crime_type ct on ct.crime_code = cdf.Crime_Code
left join premise_type pt on pt.premise_code = cdf.Premise_Code
left join weapon_used_type w on w.weapon_used_code = cdf.Weapon_Used_Code
left join status_type st on st.status_code = cdf.Status_Code
left join victim_descent v on v.victim_description_code = cdf.Victim_Descent;


insert into data225proj.area(area_name,reporting_district_num)
select distinct Area_Name,Reporting_District_Num
from data225proj.crime_data_full;


insert into data225proj.crime_address(crime_address,cross_street,latitude,longitude)
select distinct Crime_Address,Cross_Street,Latitude,Longitude
from data225proj.crime_data_full;


insert into data225proj.crime_type(crime_code,crime_code_description)
select distinct Crime_Code, Crime_Code_Description
from data225proj.crime_data_full;

insert into data225proj.premise_type(premise_code,premise_description)
select distinct Premise_Code, Premise_Description
from data225proj.crime_data_full;


insert into data225proj.weapon_used_type(weapon_used_code,weapon_description)
select distinct Weapon_Used_Code, Weapon_Description
from data225proj.crime_data_full
where Weapon_Used_Code!='N/A';


insert into data225proj.motivation_type(mo_code,mo_description)
select MO_Code, Description
from data225proj.mo_codes;


insert into status_type(status_code,status_description) values('AA','Adult Arrest');
insert into status_type(status_code,status_description) values('AO','Adult Other');
insert into status_type(status_code,status_description) values('IC','Invest Cont');
insert into status_type(status_code,status_description) values('JA','Juv Arrest');
insert into status_type(status_code,status_description) values('JO','Juv Other');


insert into priority values(1,'high');
insert into priority values(2,'low');


insert into victim_descent(victim_description_code,victim_description) values('A','Other Asian');
insert into victim_descent(victim_description_code,victim_description) values('B','Black');
insert into victim_descent(victim_description_code,victim_description) values('C','Chinese');
insert into victim_descent(victim_description_code,victim_description) values('D','Cambodian');
insert into victim_descent(victim_description_code,victim_description) values('F','Filipino');
insert into victim_descent(victim_description_code,victim_description) values('G','Guamanian');
insert into victim_descent(victim_description_code,victim_description) values('H','Hispanic/Latin/Mexican');
insert into victim_descent(victim_description_code,victim_description) values('I','American Indian/Alaskan Native');
insert into victim_descent(victim_description_code,victim_description) values('J','Japanese');
insert into victim_descent(victim_description_code,victim_description) values('K','Korean');
insert into victim_descent(victim_description_code,victim_description) values('L','Laotian');
insert into victim_descent(victim_description_code,victim_description) values('O','Other');
insert into victim_descent(victim_description_code,victim_description) values('P','Pacific Islander');
insert into victim_descent(victim_description_code,victim_description) values('S','Samoan');
insert into victim_descent(victim_description_code,victim_description) values('U','Hawaiian');
insert into victim_descent(victim_description_code,victim_description) values('V','Vietnamese');
insert into victim_descent(victim_description_code,victim_description) values('W','White');
insert into victim_descent(victim_description_code,victim_description) values('X','Unknown');
insert into victim_descent(victim_description_code,victim_description) values('Z','Asian Indian');


insert into crime_mo
SELECT cr.DR_Number,mo.MO_Code
FROM motivation_type mo
INNER JOIN crime_data_full cdf ON FIND_IN_SET(mo.mo_code, cdf.MO_Codes)
inner join crime_record cr on cr.dr_number = cdf.DR_Number

-- ------------------------------------------------------------- 



