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
	easting 		int 		null,
	northing 		int 		null,
	position_quality 	int 		not null,
	countycode 		varchar(15) 	null,
	countyname 		varchar(50) 	null,
	county_lac 		varchar(15) 	null,
	county_lan 		varchar(75) 	null,
	wardcode 		varchar(15) 	null,
	wardname 		varchar(75) 	null,
	countrycode 		varchar(15) 	null,
	countryname 		varchar(30) 	null,
	region_code 		varchar(15) 	null,
	region_name 		varchar(30) 	null,
	par_cons_code 		varchar(15) 	null,
	par_cons_name 		varchar(50) 	null,
	eerc 			varchar(15) 	null,
	eern 			varchar(30) 	null,
	pctc 			varchar(15) 	null,
	pctn 			varchar(70) 	null,
	isoac 			varchar(15) 	null,
	isoan 			varchar(50) 	null,
	msoac 			varchar(15) 	null,
	msoan 			varchar(50) 	null,
	oacc 			varchar(5) 	null,
	oacn 			varchar(50) 	null,
	longitude 		real 		not null,
	latitude 		real 		not null,
	spatial_accuracy	varchar(30) 	null,
	last_upload		date 		not null,
	location 		varchar(50) 	null,
	socrataid 		int 		not null

);

-- copy the content of csv into the table
\copy nspl_rawdata from '/home/yinghua/Documents/FYP1/FYP-data/postcode-data/UK-NSPL.csv' with header csv;

-- verify whether all data are inserted
select count(*) from nspl_rawdata;

-- list the structure of companydata table 
\d+ nspl_rawdata;



