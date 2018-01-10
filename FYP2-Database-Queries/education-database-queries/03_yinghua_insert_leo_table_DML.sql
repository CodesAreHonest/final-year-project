-- File: 03_yinghua_insert_leo_table_DML.sql
-- Date: Mon Dec 8 10:10 MYT 2017
-- Author: Chai Ying Hua 
-- Version: 1.0 
-- Database: psql (PostgreSQL) 9.5.10
-- ====================================================================
-- (Version 1.0 Change: 8 Dec 2017) 
--  	1. Delete all data in reverse order.
--	2. Migrate all data from raw table into normalized lookup table. 
-- ====================================================================


-- DELETE ALL DATA FROM TABLE IN REVERSE ORDER 
DELETE FROM leo_prior_attainment 	WHERE TRUE;
DELETE FROM leo_polar 			WHERE TRUE;
DELETE FROM leo_earning 		WHERE TRUE;
DELETE FROM leo_sustain_employment 	WHERE TRUE;
DELETE FROM leo_uncaptured 		WHERE TRUE;
DELETE FROM leo_match 			WHERE TRUE;
DELETE FROM leo_graduation 		WHERE TRUE;
DELETE FROM leo_detail 			WHERE TRUE;
DELETE FROM leo				WHERE TRUE;

-- SELECT UNIQUE DATA FROM RAW TABLE AND INSERT INTO NORMALIZED DATA. 

----------------------------------------
-- LEO_PRIOR_ATTAINMENT TABLE INSERTION 
-- ROW COUNTS: 2139 
----------------------------------------
INSERT INTO leo_prior_attainment (leo_pr_att_band,leo_pr_att_included)
	SELECT DISTINCT prattband, prattincluded FROM leo_rawdata;

----------------------------------------
-- LEO_POLAR TABLE INSERTION 
-- ROW COUNTS: 6793 
---------------------------------------- 
INSERT INTO leo_polar (leo_polar_grp_one,leo_polar_grp_included)
	SELECT DISTINCT polargrpone, polargrponeincluded FROM leo_rawdata;

----------------------------------------
-- LEO_EARNING TABLE INSERTION 
-- ROW COUNTS: 14372
---------------------------------------- 
INSERT INTO leo_earning (leo_earning_include,leo_lower_ann_earn,leo_median_ann_earn,leo_upper_ann_earn)
	SELECT DISTINCT earningsinclude, lowerannearn, medianannearn, upperannearn FROM leo_rawdata;

----------------------------------------
-- LEO_SUSTAIN_EMPLOYMENT TABLE INSERTION 
-- ROW COUNTS: 6192
---------------------------------------- 
INSERT INTO leo_sustain_employment (leo_sust_emp_only,leo_sust_emp,leo_sust_emp_fs_or_both)
	SELECT DISTINCT sustemponly, sustemp, sustempfsorboth FROM leo_rawdata;

----------------------------------------
-- LEO_UNCAPTURED TABLE INSERTION 
-- ROW COUNTS: 6283
---------------------------------------- 
INSERT INTO leo_uncaptured (leo_activitynotcaptured,leo_no_sust_dest)
	SELECT DISTINCT activitynotcaptured, nosustdest FROM leo_rawdata;

----------------------------------------
-- LEO_MATCH TABLE INSERTION 
-- ROW COUNTS: 3992
---------------------------------------- 
INSERT INTO leo_match (leo_unmatched,leo_matched)
	SELECT DISTINCT unmatched, matched FROM leo_rawdata;

----------------------------------------
-- LEO_GRADUATION TABLE INSERTION 
-- ROW COUNTS: 195
---------------------------------------- 
INSERT INTO leo_graduation (leo_grad)
	SELECT DISTINCT grads FROM leo_rawdata;

----------------------------------------
-- LEO_DETAIL TABLE INSERTION 
-- ROW COUNTS: 32706		<- SAME COUNT WITH RAWDATA 
---------------------------------------- 
INSERT INTO leo_detail (leo_ukprn, leo_providername, leo_region, leo_subject, leo_sex, leo_yearaftergraduation)
	SELECT DISTINCT ukprn, providername, region, subject, sex, yearaftergraduation FROM leo_rawdata;

----------------
-- END SCRIPT -- 
----------------






 



