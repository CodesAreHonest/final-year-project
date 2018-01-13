-- File: 04_yinghua_postcode_data_migration.sql
-- Date: Mon Dec 10 1:55 MYT 2017
-- Author: Chai Ying Hua 
-- Version: 1.0 
-- Database: psql (PostgreSQL) 9.5.10
-- ======================================
-- (Version 1.0 Change: 10 Dec 2017) 
--  	1. Delete all POSTCODE table data. 
--	2. Migrate all data from raw table into normalized table. 
-- ======================================

-- DELETE ALL LEO DATA 
DELETE FROM postcode WHERE TRUE;

----------------------------------------
-- POSTCODE TABLE INSERTION 
-- ROW COUNTS: -		<- SAME COUNT WITH RAWDATA
----------------------------------------

INSERT INTO postcode (pos_detail_id, pos_county_id, pos_lac_id, pos_ward_id, pos_country_id, pos_region_id, pos_par_cons_id, pos_eer_id, pos_pct_id, pos_lsoa_id, pos_msoa_id, pos_oac_id, pos_greek_coordinate_id)
	SELECT pos_detail_id, pos_county_id, pos_lac_id, pos_ward_id, pos_country_id, pos_region_id, pos_par_cons_id, pos_eer_id, pos_pct_id, pos_lsoa_id, pos_msoa_id, pos_oac_id, pos_greek_coordinate_id
	FROM nspl_rawdata AS rawdata
	JOIN postcode_greek_coordinate     AS pgc 
		ON      pgc.pos_longitude = rawdata.longitude 
		AND 	pgc.pos_latitude = rawdata.latitude
	JOIN postcode_output_area_classification AS oac 
		ON 	oac.pos_oac_code = rawdata.oacc
		AND 	oac.pos_oac_name = rawdata.oacn
	JOIN postcode_middle_super_output_area	  AS msoa 
		ON 	msoa.pos_msoa_code = rawdata.msoac
		AND    	msoa.pos_msoa_name   = rawdata.msoan
	JOIN leo_uncaptured AS uncaptured 
		ON      uncaptured.leo_activitynotcaptured = rawdata.activitynotcaptured
		AND     uncaptured.leo_no_sust_dest        = rawdata.nosustdest
	JOIN leo_sustain_employment       AS sustemp 
		ON      sustemp.leo_sust_emp_only 	= rawdata.sustemponly
		AND     sustemp.leo_sust_emp      	= rawdata.sustemp
		AND     sustemp.leo_sust_emp_fs_or_both = rawdata.sustempfsorboth
	JOIN leo_earning    AS earning 
		ON      earning.leo_earning_include 	= rawdata.earningsinclude
		AND     earning.leo_lower_ann_earn      = rawdata.lowerannearn
		AND     earning.leo_median_ann_earn     = rawdata.medianannearn
		AND     earning.leo_upper_ann_earn      = rawdata.upperannearn
	JOIN leo_polar      AS polar 
		ON      polar.leo_polar_grp_one 	= rawdata.polargrpone
		AND     polar.leo_polar_grp_included    = rawdata.polargrponeincluded
	JOIN leo_prior_attainment     AS pa 
		ON      pa.leo_pr_att_band 		= rawdata.prattband
		AND     pa.leo_pr_att_included          = rawdata.prattincluded;







 	 

