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
	JOIN postcode_detail     AS detail
		ON      detail.pos1 			= rawdata.postcode1
		AND     detail.pos2        		= rawdata.postcode2
		AND     detail.pos3        		= rawdata.postcode3
		AND     detail.pos_date_introduce       = rawdata.date_introduce
		AND     detail.pos_usertype        	= rawdata.usertype
		AND     detail.position_quality        	= rawdata.position_quality
		AND     detail.pos_spatial_accuracy     = rawdata.spatial_accuracy
		AND     detail.pos_location        	= rawdata.location
		AND     detail.pos_socrataid        	= rawdata.socrataid
		AND     detail.pos_last_upload        	= rawdata.last_upload
	JOIN postcode_county     AS county
		ON      county.pos_county_code 	= rawdata.countycode
		AND     county.pos_county_name  = rawdata.countyname
	JOIN postcode_local_authority_county     AS lac
		ON      lac.pos_lac_code 	= rawdata.county_lac
		AND     lac.pos_lac_name        = rawdata.county_lan
	JOIN postcode_ward     AS ward
		ON      ward.pos_ward_code 	= rawdata.wardcode
		AND     ward.pos_ward_name      = rawdata.wardname
	JOIN postcode_country     AS country 
		ON      country.pos_country_code 	= rawdata.countrycode
		AND     country.pos_country_name        = rawdata.countryname
	JOIN postcode_region     AS region 
		ON      region.pos_region_code 		= rawdata.region_code
		AND     region.pos_region_name          = rawdata.region_name
	JOIN postcode_parliament_constituency      AS ppc 
		ON      ppc.pos_par_cons_code 	= rawdata.par_cons_code
		AND     ppc.pos_par_cons_name   = rawdata.par_cons_name
	JOIN postcode_euro_electoral_region    AS eer
		ON      eer.pos_eer_code 	= rawdata.eerc
		AND     eer.pos_eer_name        = rawdata.eern
	JOIN postcode_primary_care_trust       AS pct 
		ON      pct.pos_pct_code 	= rawdata.pctc
		AND     pct.pos_pct_name      	= rawdata.pctn
	JOIN postcode_lower_super_output_area AS lsoa 
		ON      lsoa.pos_lsoa_code = rawdata.isoac
		AND     lsoa.pos_lsoa_name = rawdata.isoan
	JOIN postcode_middle_super_output_area	  AS msoa 
		ON 	msoa.pos_msoa_code = rawdata.msoac
		AND    	msoa.pos_msoa_name   = rawdata.msoan
	JOIN postcode_output_area_classification AS oac 
		ON 	oac.pos_oac_code = rawdata.oacc
		AND 	oac.pos_oac_name = rawdata.oacn
	JOIN postcode_greek_coordinate     AS pgc 
		ON      pgc.pos_longitude = rawdata.longitude 
		AND 	pgc.pos_latitude = rawdata.latitude;






 	 

