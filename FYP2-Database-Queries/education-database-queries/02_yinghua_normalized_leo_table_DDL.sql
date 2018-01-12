-- File: 02_yinghua_create_normalized_leo_table.sql
-- Date: Fri Dec 5 14:04 MYT 2017
-- Author: Chai Ying Hua 
-- Version: 1.0 
-- Database: psql (PostgreSQL) 9.5.10
-- ======================================
-- 
--  	1. Drop previous created table in proper order. 
--	2. Create sequence in proper order. 
--	3. Drop sequence in reverse order. 
-- 	4. Create table in reverse order for main table to reference foreign key
--	5. Check all the tables. 
-- ======================================

-- DROP TABLE IN PROPER ORDER 


drop table leo_prior_attainment CASCADE; 
drop table leo_polar CASCADE;
drop table leo_earning CASCADE;
drop table leo_sustain_employment CASCADE;
drop table leo_uncaptured CASCADE; 
drop table leo_match CASCADE;
drop table leo_graduation CASCADE;
drop table leo_detail CASCADE;
drop table leo CASCADE;

-- DROP SEQUENCE IN PROPER ORDER 
DROP SEQUENCE seq_leo_id;
DROP SEQUENCE seq_leo_detail_id;
DROP SEQUENCE seq_grads_id;
DROP SEQUENCE seq_match_id;
DROP SEQUENCE seq_uncaptured_id;
DROP SEQUENCE seq_sust_emp_id;
DROP SEQUENCE seq_earning_id;
DROP SEQUENCE seq_polar_id;
DROP SEQUENCE seq_pr_att_id;

-- CREATE SEQUENCE IN REVERSE ORDER 
CREATE SEQUENCE seq_pr_att_id 		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_polar_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_earning_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_sust_emp_id 	MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_uncaptured_id 	MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_match_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_grads_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_leo_detail_id	MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_leo_id		MINVALUE 1 INCREMENT 1;

-- CREATE TABLE IN REVERSE ORDER 
create table leo_prior_attainment (
	leo_pr_att_id 		INT DEFAULT NEXTVAL ('seq_pr_att_id'),
	leo_pr_att_band 	varchar(20) NOT NULL, 
	leo_pr_att_included 	varchar(20) NOT NULL, 
	PRIMARY KEY (leo_pr_att_id)
);

create table leo_polar (
	leo_polar_id 		INT DEFAULT NEXTVAL ('seq_polar_id'),
	leo_polar_grp_one 	varchar(20) NOT NULL, 
	leo_polar_grp_included 	varchar(20) NOT NULL, 
	PRIMARY KEY (leo_polar_id)
);

create table leo_earning (
	leo_earning_id 		INT DEFAULT NEXTVAL ('seq_earning_id'), 
	leo_earning_include 	varchar(20) NOT NULL, 
	leo_lower_ann_earn 	varchar(20) NOT NULL, 
	leo_median_ann_earn 	varchar(20) NOT NULL, 
	leo_upper_ann_earn 	varchar(20) NOT NULL,
	PRIMARY KEY (leo_earning_id) 
);

create table leo_sustain_employment (
	leo_sust_emp_id 		INT DEFAULT NEXTVAL ('seq_sust_emp_id'), 
	leo_sust_emp_only 		varchar(20) NOT NULL, 
	leo_sust_emp	 		varchar(20) NOT NULL, 
	leo_sust_emp_fs_or_both 	varchar(20) NOT NULL, 
	PRIMARY KEY (leo_sust_emp_id) 
);

create table leo_uncaptured (
	leo_uncaptured_id 		INT DEFAULT NEXTVAL ('seq_uncaptured_id'), 
	leo_activitynotcaptured 	varchar(20) NOT NULL, 
	leo_no_sust_dest	 	varchar(20) NOT NULL,  
	PRIMARY KEY (leo_uncaptured_id) 
);

create table leo_match (
	leo_match_id	 		INT DEFAULT NEXTVAL ('seq_match_id'), 
	leo_unmatched 			varchar(20) NOT NULL, 
	leo_matched	 		varchar(20) NOT NULL,
	PRIMARY KEY (leo_match_id)
);

create table leo_graduation (
	leo_grads_id	 		INT DEFAULT NEXTVAL ('seq_grads_id'), 
	leo_grad 			varchar(10) NOT NULL, 
	PRIMARY KEY (leo_grads_id) 
);

create table leo_detail (
	leo_detail_id		 	INT DEFAULT NEXTVAL ('seq_leo_detail_id'), 
	leo_ukprn 			int 		NOT NULL, 
	leo_providername 		varchar(100) 	NOT NULL, 
	leo_region 			varchar(50) 	NOT NULL, 
	leo_subject 			varchar(50) 	NOT NULL, 
	leo_sex 			varchar(30) 	NOT NULL, 
	leo_yearaftergraduation		int 		NOT NULL, 
	PRIMARY KEY (leo_detail_id)
);

create table leo (
	leo_id				INT DEFAULT NEXTVAL ('seq_leo_id'),
	leo_detail_id 			int NOT NULL,
	leo_grads_id 			int NOT NULL,
	leo_match_id 			int NOT NULL,
	leo_uncaptured_id		int NOT NULL, 
	leo_sust_emp_id 		int NOT NULL,
	leo_earning_id			int NOT NULL,
	leo_polar_id			int NOT NULL,
	leo_pr_att_id			int NOT NULL,

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

