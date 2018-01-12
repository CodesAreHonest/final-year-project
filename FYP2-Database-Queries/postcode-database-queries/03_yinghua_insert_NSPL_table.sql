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

-- SELECT UNIQUE DATA FROM RAW TABLE AND INSERT INTO NORMALIZED DATA. 

----------------------------------------
-- POSTCODE_GREEK_COORDINATE TABLE INSERTION 
-- ROW COUNTS: 1664728 
----------------------------------------
--INSERT INTO postcode_greek_coordinate (pos_longitude, pos_latitude)
--	SELECT DISTINCT longitude, latitude FROM nspl_rawdata;

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


