-- File: 01_yinghua_create_nspl_table.sql
-- Date: Mon Sep 4 03:53:33 MYT 2017
-- Author: Chai Ying Hua 
-- Version: 1.1 
-- Database: psql (PostgreSQL) 9.5.8

-- ======================================
-- CHANGES IN V1.1 (Mon Sep 4. 2017)
-- 	Create NSPL-postcode-data table
-- 	Import data from 'UK-NSPL.csv' to table
--  	Verify whether there is repeated rows.
--
-- ======================================

drop table nspl_rawdata;

create table nspl_rawdata (
	postcode1 		varchar(15) 	not null,
	postcode2 		varchar(15) 	not null primary key,
	postcode3 		varchar(15) 	not null,
	date_introduce 		varchar(10) 	not null, 
	usertype 		int 		not null,
	easting 		int 		null default 0,
	northing 		int 		null default 0,
	position_quality 	int 		not null,
	countycode 		varchar(15) 	null default 'Undefined',
	countyname 		varchar(50) 	null default 'Undefined',
	county_lac 		varchar(15) 	null default 'Undefined',
	county_lan 		varchar(75) 	null default 'Undefined',
	wardcode 		varchar(15) 	null default 'Undefined',
	wardname 		varchar(75) 	null default 'Undefined',
	countrycode 		varchar(15) 	null default 'Undefined',
	countryname 		varchar(30) 	null default 'Undefined',
	region_code 		varchar(15) 	null default 'Undefined',
	region_name 		varchar(30) 	null default 'Undefined',
	par_cons_code 		varchar(15) 	null default 'Undefined',
	par_cons_name 		varchar(50) 	null default 'Undefined',
	eerc 			varchar(15) 	null default 'Undefined',
	eern 			varchar(30) 	null default 'Undefined',
	pctc 			varchar(15) 	null default 'Undefined',
	pctn 			varchar(70) 	null default 'Undefined',
	isoac 			varchar(15) 	null default 'Undefined',
	isoan 			varchar(50) 	null default 'Undefined',
	msoac 			varchar(15) 	null default 'Undefined',
	msoan 			varchar(50) 	null default 'Undefined',
	oacc 			varchar(5) 	null default 'Undefined',
	oacn 			varchar(50) 	null default 'Undefined',
	longitude 		real 		not null,
	latitude 		real 		not null,
	spatial_accuracy	varchar(30) 	null default 'Undefined',
	last_upload		date 		not null,
	location 		varchar(50) 	null default 'Undefined',
	socrataid 		int 		not null

);

-- copy the content of csv into the table
\copy nspl_rawdata from '/home/yinghua/Documents/FYP1/FYP-data/postcode-data/UK-NSPL.csv' with header csv;

-- verify whether all data are inserted
select count(*) from nspl_rawdata;

-- update null value to default 
UPDATE nspl_rawdata SET easting    = DEFAULT WHERE easting    IS NULL;
UPDATE nspl_rawdata SET northing   = DEFAULT WHERE northing   IS NULL;
UPDATE nspl_rawdata SET countycode = DEFAULT WHERE countycode IS NULL;
UPDATE nspl_rawdata SET countyname = DEFAULT WHERE countyname IS NULL;

UPDATE nspl_rawdata SET county_lac = DEFAULT WHERE county_lac IS NULL;
UPDATE nspl_rawdata SET county_lan = DEFAULT WHERE county_lan IS NULL;
UPDATE nspl_rawdata SET wardcode   = DEFAULT WHERE wardcode   IS NULL;
UPDATE nspl_rawdata SET wardname   = DEFAULT WHERE wardname   IS NULL;

UPDATE nspl_rawdata SET countrycode = DEFAULT WHERE countrycode IS NULL;
UPDATE nspl_rawdata SET countryname = DEFAULT WHERE countryname IS NULL;
UPDATE nspl_rawdata SET region_code = DEFAULT WHERE region_code IS NULL;
UPDATE nspl_rawdata SET region_name = DEFAULT WHERE region_name IS NULL;

UPDATE nspl_rawdata SET par_cons_code = DEFAULT WHERE par_cons_code IS NULL;
UPDATE nspl_rawdata SET par_cons_name = DEFAULT WHERE par_cons_name IS NULL;
UPDATE nspl_rawdata SET eerc          = DEFAULT WHERE eerc 	    IS NULL;
UPDATE nspl_rawdata SET eern          = DEFAULT WHERE eern 	    IS NULL;

UPDATE nspl_rawdata SET pctc  = DEFAULT WHERE pctc    IS NULL;
UPDATE nspl_rawdata SET pctn  = DEFAULT WHERE pctn    IS NULL;
UPDATE nspl_rawdata SET isoac = DEFAULT WHERE isoac   IS NULL;
UPDATE nspl_rawdata SET isoan = DEFAULT WHERE isoan   IS NULL;

UPDATE nspl_rawdata SET msoac = DEFAULT WHERE msoac  IS NULL;
UPDATE nspl_rawdata SET msoan = DEFAULT WHERE msoan  IS NULL;
UPDATE nspl_rawdata SET oacc  = DEFAULT WHERE oacc   IS NULL;
UPDATE nspl_rawdata SET oacn  = DEFAULT WHERE oacn   IS NULL;

UPDATE nspl_rawdata SET spatial_accuracy = DEFAULT WHERE spatial_accuracy IS NULL;
UPDATE nspl_rawdata SET location         = DEFAULT WHERE location         IS NULL;



-- list the structure of companydata table 
\d+ nspl_rawdata;



