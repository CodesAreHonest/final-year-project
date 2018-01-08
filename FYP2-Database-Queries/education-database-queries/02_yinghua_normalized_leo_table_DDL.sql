-- File: 02_yinghua_create_normalized_leo_table.sql
-- Date: Fri Dec 5 14:04 MYT 2017
-- Author: Chai Ying Hua 
-- Version: 1.0 
-- Database: psql (PostgreSQL) 9.5.10
-- ======================================
-- 
--  	1. Drop previous created table in proper order. 
--	2. Create table in reverse order for main table to reference foreign key. 
--	3. Check all the tables. 
-- ======================================

-- DROP TABLE IN PROPER ORDER 
drop table leo CASCADE; 
drop table leo_polar CASCADE;
drop table leo_prior_attainment CASCADE; 
drop table leo_earning CASCADE;
drop table leo_sustain_employment CASCADE;
drop table leo_uncaptured CASCADE; 
drop table leo_match CASCADE;
drop table leo_graduation CASCADE;
drop table leo_detail CASCADE;

-- CREATE TABLE IN REVERSE ORDER 
create table leo_prior_attainment (
	leo_pr_att_id 		SERIAL,
	leo_pr_att_band 	varchar(20) NOT NULL, 
	leo_pr_att_included 	varchar(20) NOT NULL, 
	PRIMARY KEY (leo_pr_att_id)
);

create table leo_polar (
	leo_polar_id 		SERIAL,
	leo_polar_grp_one 	varchar(20) NOT NULL, 
	leo_polar_grp_included 	varchar(20) NOT NULL, 
	PRIMARY KEY (leo_polar_id)
);

create table leo_earning (
	leo_earning_id 		SERIAL, 
	leo_earning_include 	varchar(20) NOT NULL, 
	leo_lower_ann_earn 	varchar(20) NOT NULL, 
	leo_median_ann_earn 	varchar(20) NOT NULL, 
	leo_upper_ann_earn 	varchar(20) NOT NULL,
	PRIMARY KEY (leo_earning_id) 
);

create table leo_sustain_employment (
	leo_sust_emp_id 		SERIAL, 
	leo_sust_emp_only 		varchar(20) NOT NULL, 
	leo_sust_emp	 		varchar(20) NOT NULL, 
	leo_sust_emp_fs_or_both 	varchar(20) NOT NULL, 
	PRIMARY KEY (leo_sust_emp_id) 
);

create table leo_uncaptured (
	leo_uncaptured_id 		SERIAL, 
	leo_activitynotcaptured 	varchar(20) NOT NULL, 
	leo_no_sust_dest	 	varchar(20) NOT NULL,  
	PRIMARY KEY (leo_uncaptured_id) 
);

create table leo_match (
	leo_match_id	 		SERIAL, 
	leo_unmatched 			varchar(20) NOT NULL, 
	leo_matched	 		varchar(20) NOT NULL,
	PRIMARY KEY (leo_match_id)
);

create table leo_graduation (
	leo_grads_id	 		SERIAL, 
	leo_grad 			varchar(10) NOT NULL, 
	PRIMARY KEY (leo_grads_id) 
);

create table leo_detail (
	leo_detail_id		 	SERIAL, 
	leo_ukprn 			int 		NOT NULL, 
	leo_providername 		varchar(100) 	NOT NULL, 
	leo_region 			varchar(50) 	NOT NULL, 
	leo_subject 			varchar(50) 	NOT NULL, 
	leo_sex 			varchar(30) 	NOT NULL, 
	leo_yearaftergraduation		int 		NOT NULL, 
	PRIMARY KEY (leo_detail_id)
);

create table leo (
	leo_id				SERIAL PRIMARY KEY,
	leo_detail_id 			int NULL,
	leo_grads_id 			int NULL,
	leo_match_id 			int NULL,
	leo_uncaptured_id		int NULL, 
	leo_sust_emp_id 		int NULL,
	leo_earning_id			int NULL,
	leo_polar_id			int NULL,
	leo_pr_att_id			int NULL,

	FOREIGN KEY (leo_detail_id) REFERENCES leo_detail (leo_detail_id) ON DELETE CASCADE,
	FOREIGN KEY (leo_grads_id) REFERENCES leo_graduation (leo_grads_id) ON DELETE CASCADE,
	FOREIGN KEY (leo_match_id) REFERENCES leo_match (leo_match_id) ON DELETE CASCADE,
	FOREIGN KEY (leo_uncaptured_id) REFERENCES leo_uncaptured (leo_uncaptured_id) ON DELETE CASCADE, 
	FOREIGN KEY (leo_sust_emp_id) REFERENCES leo_sustain_employment (leo_sust_emp_id) ON DELETE CASCADE,
	FOREIGN KEY (leo_earning_id) REFERENCES leo_earning (leo_earning_id) ON DELETE CASCADE,
	FOREIGN KEY (leo_polar_id) REFERENCES leo_polar (leo_polar_id) ON DELETE CASCADE,
	FOREIGN KEY (leo_pr_att_id) REFERENCES leo_prior_attainment (leo_pr_att_id) ON DELETE CASCADE 

);

-- CHECK ALL THE TABLES 
\dt


