-- File: 02_yinghua_normalized_NSPL_DDL.sql
-- Date: Sat Dec 6 16:02 MYT 2017
-- Author: Chai Ying Hua 
-- Version: 1.0 
-- Database: psql (PostgreSQL) 9.5.10
-- =========================================================
--  1. Drop table in Reverse order. 
--  2. Create table in Proper order. 
--  3. Verify whether all tables and sequences are created. 
-- =========================================================

-- DROP TABLE IN REVERSE ORDER 
DROP TABLE postcode_greek_coordinate 		CASCADE; 
DROP TABLE postcode_output_area_classification  CASCADE; 
DROP TABLE postcode_middle_super_output_area 	CASCADE; 
DROP TABLE postcode_lower_super_output_area 	CASCADE; 
DROP TABLE postcode_primary_care_trust 		CASCADE; 
DROP TABLE postcode_euro_electoral_region 	CASCADE; 
DROP TABLE postcode_parliament_constituency 	CASCADE; 
DROP TABLE postcode_region 			CASCADE; 
DROP TABLE postcode_country 			CASCADE;
DROP TABLE postcode_ward 			CASCADE; 
DROP TABLE postcode_local_authority_county 	CASCADE;
DROP TABLE postcode_county 			CASCADE;
DROP TABLE postcode_cartesian_coordinate 	CASCADE;
DROP TABLE postcode_detail	 		CASCADE;
DROP TABLE postcode	 			CASCADE;

-- DROP SEQUENCE IN PROPER ORDER 
DROP SEQUENCE seq_pos_detail_id 	CASCADE;
DROP SEQUENCE seq_cart_coordinate_id 	CASCADE;
DROP SEQUENCE seq_county_id 		CASCADE;
DROP SEQUENCE seq_lac_id 		CASCADE;
DROP SEQUENCE seq_ward_id 		CASCADE;
DROP SEQUENCE seq_country_id 		CASCADE;
DROP SEQUENCE seq_region_id 		CASCADE;
DROP SEQUENCE seq_par_cons_id 		CASCADE;
DROP SEQUENCE seq_eer_id 		CASCADE;
DROP SEQUENCE seq_pct_id 		CASCADE;
DROP SEQUENCE seq_lsoa_id 		CASCADE;
DROP SEQUENCE seq_msoa_id 		CASCADE;
DROP SEQUENCE seq_oac_id 		CASCADE;
DROP SEQUENCE seq_greek_coordinate_id 	CASCADE;
DROP SEQUENCE seq_pos_temp_id 		CASCADE;

-- CREATE SEQUENCE IN REVERSE ORDER 
CREATE SEQUENCE seq_pos_temp_id		MINVALUE 1 INCREMENT 1;
CREATE SEQUENCE seq_greek_coordinate_id MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_oac_id 		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_msoa_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_lsoa_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_pct_id 		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_eer_id 		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_par_cons_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_region_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_country_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_ward_id		MINVALUE 1 INCREMENT 1;
CREATE SEQUENCE seq_lac_id		MINVALUE 1 INCREMENT 1;
CREATE SEQUENCE seq_county_id		MINVALUE 1 INCREMENT 1;
CREATE SEQUENCE seq_cart_coordinate_id	MINVALUE 1 INCREMENT 1;
CREATE SEQUENCE seq_pos_detail_id	MINVALUE 1 INCREMENT 1;

-- CREATE TABLE IN PROPER ORDER 
create table postcode_greek_coordinate (
	pos_greek_coordinate_id 	INT DEFAULT NEXTVAL ('seq_greek_coordinate_id'),
	pos_longitude 			VARCHAR(50) NOT NULL,
	pos_latitude 			VARCHAR(50) NOT NULL,
	PRIMARY KEY (pos_greek_coordinate_id)
);

create table postcode_output_area_classification (
	pos_oac_id 			INT DEFAULT NEXTVAL ('seq_oac_id'), 
	pos_oac_code 			VARCHAR(5) NULL DEFAULT '---',
	pos_oac_name 			VARCHAR(50) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_oac_id)
	
);
 
create table postcode_middle_super_output_area (
	pos_msoa_id 			INT DEFAULT NEXTVAL ('seq_msoa_id'),
	pos_msoa_code 			VARCHAR(15) NULL DEFAULT 'Undefined',
	pos_msoa_name 			VARCHAR(50) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_msoa_id)
);

create table postcode_lower_super_output_area (
	pos_lsoa_id 			INT DEFAULT NEXTVAL ('seq_lsoa_id'),
	pos_lsoa_code 			VARCHAR(15) NULL DEFAULT 'Undefined',
	pos_lsoa_name 			VARCHAR(50) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_lsoa_id)

);

create table postcode_primary_care_trust (
	pos_pct_id 			INT DEFAULT NEXTVAL ('seq_pct_id'),
	pos_pct_code 			VARCHAR(15) NULL DEFAULT 'Undefined',
	pos_pct_name 			VARCHAR(70) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_pct_id)
);

create table postcode_euro_electoral_region (
	pos_eer_id 			INT DEFAULT NEXTVAL ('seq_eer_id'),
	pos_eer_code 			VARCHAR(15) NULL DEFAULT 'Undefined',
	pos_eer_name 			VARCHAR(30) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_eer_id)
);

create table postcode_parliament_constituency (
	pos_par_cons_id 		INT DEFAULT NEXTVAL ('seq_par_cons_id'), 
	pos_par_cons_code		VARCHAR(15) NULL DEFAULT 'Undefined',
	pos_par_cons_name		VARCHAR(75) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_par_cons_id)
);

create table postcode_region (
	pos_region_id 			INT DEFAULT NEXTVAL ('seq_region_id'), 
	pos_region_code			VARCHAR(15) NULL DEFAULT 'Undefined',
	pos_region_name			VARCHAR(50) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_region_id)
);

create table postcode_country ( 
	pos_country_id 			INT DEFAULT NEXTVAL ('seq_country_id'), 
	pos_country_code		VARCHAR(30) NULL DEFAULT 'Undefined',
	pos_country_name		VARCHAR(30) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_country_id)
);

create table postcode_ward (
	pos_ward_id 			INT DEFAULT NEXTVAL ('seq_ward_id'), 
	pos_ward_code			VARCHAR(15) NULL DEFAULT 'Undefined',
	pos_ward_name			VARCHAR(75) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_ward_id) 
); 

create table postcode_local_authority_county (
	pos_lac_id 			INT DEFAULT NEXTVAL ('seq_lac_id'), 
	pos_lac_code			VARCHAR(15) NULL DEFAULT 'Undefined',
	pos_lac_name			VARCHAR(75) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_lac_id) 
); 

create table postcode_county (
	pos_county_id	 		INT DEFAULT NEXTVAL ('seq_county_id'), 
	pos_county_code			VARCHAR(15) NULL DEFAULT 'Undefined',
	pos_county_name			VARCHAR(75) NULL DEFAULT 'Undefined',
	PRIMARY KEY (pos_county_id) 
); 

create table postcode_cartesian_coordinate (
	pos_cart_coordinate_id	 	INT DEFAULT NEXTVAL ('seq_cart_coordinate_id'), 
	pos_easting			INT NULL DEFAULT 0,
	pos_northing			INT NULL DEFAULT 0,
	PRIMARY KEY (pos_cart_coordinate_id) 
); 

create table postcode_detail ( 
	pos_detail_id			BIGINT DEFAULT NEXTVAL ('seq_pos_detail_id'), 
	pos1				VARCHAR(15) NOT NULL, 
	pos2				VARCHAR(15) NOT NULL, 
	pos3				VARCHAR(15) NOT NULL, 
	pos_date_introduce		VARCHAR(10) NOT NULL,
	pos_usertype			INT  	    NOT NULL,
	pos_cart_coordinate_id		INT 	    NOT NULL,
	position_quality		INT         NOT NULL,
	pos_spatial_accuracy		VARCHAR(30) NULL DEFAULT 'Undefined',
	pos_location			VARCHAR(50) NULL DEFAULT 'Undefined',
	pos_socrataid			INT         NOT NULL,	
	pos_last_upload 		DATE 	    NOT NULL,
	PRIMARY KEY (pos_detail_id), 
	FOREIGN KEY (pos_cart_coordinate_id) REFERENCES postcode_cartesian_coordinate (pos_cart_coordinate_id)
);

create table postcode ( 
	pos_detail_id 			INT REFERENCES postcode_detail (pos_detail_id), 
	pos_county_id 			INT REFERENCES postcode_county (pos_county_id),
	pos_lac_id 			INT REFERENCES postcode_local_authority_county (pos_lac_id),
	pos_ward_id 			INT REFERENCES postcode_ward (pos_ward_id), 
	pos_country_id			INT REFERENCES postcode_country (pos_country_id),
	pos_region_id 			INT REFERENCES postcode_region (pos_region_id),	
	pos_par_cons_id 		INT REFERENCES postcode_parliament_constituency (pos_par_cons_id),
	pos_eer_id 			INT REFERENCES postcode_euro_electoral_region (pos_eer_id), 
	pos_pct_id			INT REFERENCES postcode_primary_care_trust (pos_pct_id),  
	pos_lsoa_id			INT REFERENCES postcode_lower_super_output_area (pos_lsoa_id), 
	pos_msoa_id			INT REFERENCES postcode_middle_super_output_area (pos_msoa_id), 
	pos_oac_id			INT REFERENCES postcode_output_area_classification (pos_oac_id),
	pos_greek_coordinate_id		INT REFERENCES postcode_greek_coordinate (pos_greek_coordinate_id)	
);
	

-- CHECK WHETHER ALL TABLE AND SEQUENCE ARE CREATED 
\d+ 


