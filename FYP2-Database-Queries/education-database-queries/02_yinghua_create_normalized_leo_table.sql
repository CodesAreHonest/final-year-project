-- File: 02_yinghua_create_normalized_leo_table.sql
-- Date: Fri Dec 5 14:04 MYT 2017
-- Author: Chai Ying Hua 
-- Version: 1.0 
-- Database: psql (PostgreSQL) 9.5.10
-- ======================================

-- ======================================

-- DROP TABLE IN REVERSE ORDER 
drop table leo; 
drop table leo_polar;
drop table leo_prior_attainment; 
drop table leo_earning;
drop table leo_sustain_employment;
drop table leo_uncaptured; 
drop table leo_match;
drop table leo_graduation;
drop table leo_detail;


create table leo_prior_attainment (
	leo_pr_att_id 		SERIAL,
	leo_pr_att_band 	varchar(20) null DEFAULT null, 
	leo_pr_att_included 	varchar(20) null DEFAULT null, 
	PRIMARY KEY (leo_pr_att_id)
);

create table leo_polar (
	leo_polar_id 		SERIAL,
	leo_polar_grp_one 	varchar(20) null DEFAULT null, 
	leo_polar_grp_included 	varchar(20) null DEFAULT null, 
	PRIMARY KEY (leo_polar_id)
);

create table leo_earning (
	leo_earning_id 		SERIAL, 
	leo_earning_include 	varchar(20) null DEFAULT null, 
	leo_lower_ann_earn 	varchar(20) null DEFAULT null, 
	leo_median_ann_earn 	varchar(20) null DEFAULT null, 
	leo_upper_ann_earn 	varchar(20) null DEFAULT null,
	PRIMARY KEY (leo_earning_id) 
);

create table leo_sustain_employment (
	leo_sust_emp_id 		SERIAL, 
	leo_sust_emp_only 		varchar(20) null DEFAULT null, 
	leo_sust_emp	 		varchar(20) null DEFAULT null, 
	leo_sust_emp_fs_or_both 	varchar(20) null DEFAULT null, 
	PRIMARY KEY (leo_sust_emp_id) 
);

create table leo_uncaptured (
	leo_uncaptured_id 		SERIAL, 
	leo_sust_emp_only 		varchar(20) null DEFAULT null, 
	leo_sust_emp	 		varchar(20) null DEFAULT null, 
	leo_sust_emp_fs_or_both 	varchar(20) null DEFAULT null, 
	PRIMARY KEY (leo_uncaptured_id) 
);

create table leo_match (
	leo_match_id	 		SERIAL, 
	leo_unmatched 			varchar(20) null DEFAULT null, 
	leo_match	 		varchar(20) null DEFAULT null,
	PRIMARY KEY (leo_match_id)
);

create table leo_graduation (
	leo_grads_id	 		SERIAL, 
	leo_grad 			varchar(10) null DEFAULT null, 
	PRIMARY KEY (leo_grads_id) 
);

create table leo_detail (
	leo_id		 		SERIAL, 
	leo_ukprn 			int null DEFAULT null, 
	leo_providername 		varchar(100) null DEFAULT null, 
	leo_region 			varchar(50) null DEFAULT null, 
	leo_subject 			varchar(50) null DEFAULT null, 
	leo_sex 			varchar(30) null DEFAULT null, 
	leo_yearaftergraduation		int null DEFAULT null, 
	PRIMARY KEY (leo_id)
);

create table leo (
	leo_id 				int,
	leo_grads_id 			int,
	leo_match_id 			int, 
	leo_uncaptured_id		int, 
	leo_sust_emp_id 		int,
	leo_earning_id			int,
	leo_polar_id			int,
	leo_pr_att_id			int,
	PRIMARY KEY (leo_id),

	FOREIGN KEY (leo_id) REFERENCES leo_detail (leo_id),
	FOREIGN KEY (leo_grads_id) REFERENCES leo_graduation (leo_grads_id),
	FOREIGN KEY (leo_match_id) REFERENCES leo_match (leo_match_id),
	FOREIGN KEY (leo_uncaptured_id) REFERENCES leo_uncaptured (leo_uncaptured_id), 
	FOREIGN KEY (leo_sust_emp_id) REFERENCES leo_sustain_employment (leo_sust_emp_id),
	FOREIGN KEY (leo_earning_id) REFERENCES leo_earning (leo_earning_id),
	FOREIGN KEY (leo_polar_id) REFERENCES leo_polar (leo_polar_id),
	FOREIGN KEY (leo_pr_att_id) REFERENCES leo_prior_attainment (leo_pr_att_id)

);


\dt


