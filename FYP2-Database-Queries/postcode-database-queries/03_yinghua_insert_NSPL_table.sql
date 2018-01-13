-- File: 03_yinghua_insert_NSPL_table.sql
-- Date: Fri Jan 12 16:02 MYT 2018
-- Author: Chai Ying Hua 
-- Version: 1.0 
-- Database: psql (PostgreSQL) 9.5.10
-- =========================================================
-- =========================================================


DELETE FROM postcode_greek_coordinate;
DELETE FROM postcode_output_area_classification; 
DELETE FROM postcode_middle_super_output_area; 
DELETE FROM postcode_lower_super_output_area;
DELETE FROM postcode_primary_care_trust;
DELETE FROM postcode_euro_electoral_region;
DELETE FROM postcode_parliament_constituency;
DELETE FROM postcode_region;
DELETE FROM postcode_country;
DELETE FROM postcode_ward;
DELETE FROM postcode_local_authority_county;
DELETE FROM postcode_county;
DELETE FROM postcode_cartesian_coordinate;


-- SELECT UNIQUE DATA FROM RAW TABLE AND INSERT INTO NORMALIZED DATA. 
----------------------------------------
-- POSTCODE_GREEK_COORDINATE TABLE INSERTION 
-- ROW COUNTS: 1664728 
----------------------------------------
INSERT INTO postcode_greek_coordinate (pos_longitude, pos_latitude)
	SELECT DISTINCT longitude, latitude FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_AREA_OUTPUT_CLASSIFICATION TABLE INSERTION 
-- ROW COUNTS: 77 
----------------------------------------
INSERT INTO postcode_output_area_classification (pos_oac_code, pos_oac_name)
	SELECT DISTINCT oacc, oacn FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_MIDDLE_SUPER_OUTPUT_AREA TABLE INSERTION 
-- ROW COUNTS: 8484 
----------------------------------------
INSERT INTO postcode_middle_super_output_area (pos_msoa_code, pos_msoa_name)
	SELECT DISTINCT msoac, msoan FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_LOWER_SUPER_OUTPUT_AREA TABLE INSERTION 
-- ROW COUNTS: 42460 
----------------------------------------
INSERT INTO postcode_lower_super_output_area (pos_lsoa_code, pos_lsoa_name)
	SELECT DISTINCT isoac, isoan FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_PRIMARY_CARE_TRUST TABLE INSERTION 
-- ROW COUNTS:  200
----------------------------------------
INSERT INTO postcode_primary_care_trust (pos_pct_code, pos_pct_name)
	SELECT DISTINCT pctc, pctn FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_EURO_ELECTORAL_REGION TABLE INSERTION 
-- ROW COUNTS:  15
----------------------------------------
INSERT INTO postcode_euro_electoral_region (pos_eer_code, pos_eer_name)
	SELECT DISTINCT eerc, eern FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_PARLIAMENT_CONSTITUENCY TABLE INSERTION 
-- ROW COUNTS:  200
----------------------------------------
INSERT INTO postcode_parliament_constituency (pos_par_cons_code, pos_par_cons_name)
	SELECT DISTINCT pctc, pctn FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_REGION TABLE INSERTION 
-- ROW COUNTS:  15
----------------------------------------
INSERT INTO postcode_region (pos_region_code, pos_region_name)
	SELECT DISTINCT region_code, region_name FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_COUNTRY TABLE INSERTION 
-- ROW COUNTS:  7
----------------------------------------
INSERT INTO postcode_country (pos_country_code, pos_country_name)
	SELECT DISTINCT countrycode, countryname FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_WARD TABLE INSERTION 
-- ROW COUNTS:  9115
----------------------------------------
INSERT INTO postcode_ward (pos_ward_code, pos_ward_name)
	SELECT DISTINCT wardcode, wardname FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_LOCAL_AUTHORITY_COUNTY TABLE INSERTION 
-- ROW COUNTS:  394
----------------------------------------
INSERT INTO postcode_local_authority_county (pos_lac_code, pos_lac_name)
	SELECT DISTINCT county_lac, county_lan FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_COUNTY TABLE INSERTION 
-- ROW COUNTS:  34
----------------------------------------
INSERT INTO postcode_county (pos_county_code, pos_county_name)
	SELECT DISTINCT countycode, countyname FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_CARTESIAN_COORDINATE TABLE INSERTION 
-- ROW COUNTS:  1662088
----------------------------------------
INSERT INTO postcode_cartesian_coordinate (pos_easting, pos_northing)
	SELECT DISTINCT easting, northing FROM nspl_rawdata;

----------------------------------------
-- POSTCODE_DETAIL TABLE INSERTION 
-- ROW COUNTS:  1754882 		<--- SAME ROW WITH RAW DATA.  
----------------------------------------
INSERT INTO postcode_detail (pos1, pos2, pos3, pos_date_introduce, pos_usertype, pos_cart_coordinate_id, position_quality, pos_spatial_accuracy, pos_location, pos_socrataid, pos_last_upload)
	SELECT postcode1, postcode2, postcode3, date_introduce, usertype, pos_cart_coordinate_id, position_quality, spatial_accuracy, location, socrataid, last_upload
	FROM nspl_rawdata AS rawdata
	JOIN postcode_cartesian_coordinate AS pos_car_coor	
		ON rawdata.easting = pos_car_coor.pos_easting 
		AND rawdata.northing = pos_car_coor.pos_northing; 

	



