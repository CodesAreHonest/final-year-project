-- File: 01_yinghua_create_raw_leo_table.sql
-- Date: Tue Aug 29 01:08:44 MYT 2017
-- Author: Chai Ying Hua 
-- Version: 1.1 
-- Database: psql (PostgreSQL) 9.5.8

-- ======================================
-- CHANGES IN V1.1(Tue Aug 29. 2017)
-- 	Create leo table
-- 	Import data from 'institution-subject-data.csv' to table
--  	Show the structure of LEO table. 
-- ======================================

drop table leo_rawdata;

create table leo_rawdata ( 

	ukprn 			int         not null, 
	providername 		varchar(100) not null,
	region 			varchar(50) not null, 
	subject 		varchar(50) not null, 
	sex 			varchar(30) not null,
	yearaftergraduation 	int 	    not null,
	grads 			varchar(10) null default null,
	unmatched 		varchar(20) null default null,
	matched 		varchar(20) null default null,
	activityNotCaptured 	varchar(20) null default null,
	nosustdest 		varchar(20) null default null,
	sustemponly 		varchar(20) null default null,
	sustemp 		varchar(20) null default null,
	sustempfsorboth 	varchar(20) null default null,
	earningsinclude 	varchar(20) null default null,
	lowerannearn 		varchar(20) null default null,
	medianannearn 		varchar(20) null default null,
	upperannearn 		varchar(20) null default null,
	polargrpone 		varchar(20) null default null,
	polargrponeincluded 	varchar(20) null default null,
	prattband 		varchar(20) null default null,
	prattincluded 		varchar(20) null default null

);

-- copy the content of csv into the table
\copy leo_rawdata from '/home/yinghua/Documents/FYP1/FYP-data/subject-data/institution-subject-data.csv' with header csv;

-- verify whether all data are inserted
select count(*) from leo_rawdata;


