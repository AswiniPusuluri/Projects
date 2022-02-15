
# ------------ check constraints --------------
ALTER TABLE crime_record 
ADD CONSTRAINT CHK_VictimSex CHECK (victim_sex in ('F','M','X'));

ALTER TABLE crime_record
ADD CONSTRAINT CHK_DRNUM CHECK (LENGTH(dr_number) <= 9);

ALTER TABLE area
ADD CONSTRAINT CHK_REPORTING_DIST_NUM CHECK (LENGTH(reporting_district_num) <= 4);

# ---------- unique constraints -----------
ALTER TABLE status_type 
ADD CONSTRAINT UNQ_STATUS_CODE UNIQUE(status_code);

ALTER TABLE motivation_type 
ADD CONSTRAINT UNQ_MOTIVATION_CODE UNIQUE(mo_code);

ALTER TABLE priority 
ADD CONSTRAINT UNQ_PRIORITY_CODE UNIQUE(priority_code);

ALTER TABLE premise_type 
ADD CONSTRAINT UNQ_PREMISE_CODE UNIQUE(premise_code);

ALTER TABLE crime_type 
ADD CONSTRAINT UNQ_CRIME_CODE UNIQUE(crime_code);

ALTER TABLE victim_descent 
ADD CONSTRAINT UNQ_VICTIM_CODE UNIQUE(victim_description_code);

ALTER TABLE weapon_used_type 
ADD CONSTRAINT UNQ_WEAPON_CODE UNIQUE(weapon_used_code);

# ----------- null constraints -----------------
ALTER TABLE crime_record MODIFY victim_sex char(1) NOT NULL;

ALTER TABLE crime_record MODIFY date_reported date NOT NULL;

ALTER TABLE weapon_used_type MODIFY weapon_used_code int NOT NULL;

ALTER TABLE area MODIFY area_name varchar(50) NOT NULL;

ALTER TABLE area MODIFY reporting_district_num int NOT NULL;


