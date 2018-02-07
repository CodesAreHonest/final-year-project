-- FILE: 03_yinghua_insert_company_table_DML.sql  
-- DATE: Mon Jan 9 17:00 MYT 2018
-- AUTHOR: Chai Ying Hua 
-- VERSION: 1.0
-- DATABASE: psql (PostgreSQL) 9.5.10
-- DESCRIPTION:
-- =======================================================
--
--    	1. Delete all data in reverse order.
--	2. Migrate all data from raw table into normalized lookup table. 
-- ========================================================

-- SELECT UNIQUE DATA FROM RAW TABLE AND INSERT INTO NORMALIZED TABLE. 

----------------------------------------
-- COMPANY_RETURNS TABLE MIGRATION 
-- ROW COUNTS:  28697
----------------------------------------
INSERT INTO company_returns (com_return_nextduedate, com_return_lastmadeupdate)
	SELECT DISTINCT return_nextduedate, return_lastmadeupdate FROM company_rawdata;

----------------------------------------
-- COMPANY_MORTGAGES TABLE MIGRATION 
-- ROW COUNTS: 3710
----------------------------------------
INSERT INTO company_mortgages (com_num_mortchanges, com_num_mortoutstanding, com_num_mortpartsatisfied, com_num_mortsatisfied)
	SELECT DISTINCT nummortcharges, nummortoutstanding, nummortpartsatisfied, nummortsatisfied FROM company_rawdata;

----------------------------------------
-- COMPANY_SICCODE TABLE MIGRATION 
-- ROW COUNTS: 51693
----------------------------------------
INSERT INTO company_siccodes (com_siccode1, com_siccode2, com_siccode3, com_siccode4)	
	SELECT DISTINCT siccode1, siccode2, siccode3, siccode4 FROM company_rawdata;

----------------------------------------
-- COMPANY_PARTNERSHIP TABLE MIGRATION 
-- ROW COUNTS: 279
----------------------------------------
INSERT INTO company_partnership (com_num_genpartners, com_num_limpartners)
	SELECT DISTINCT numgenpartners, numlimpartners FROM company_rawdata;

----------------------------------------
-- COMPANY_URI TABLE MIGRATION 
-- ROW COUNTS: 2033290
----------------------------------------
INSERT INTO company_uri (com_uri)
	SELECT DISTINCT uri FROM company_rawdata;

----------------------------------------
-- COMPANY_CONF_STMT TABLE MIGRATION 
-- ROW COUNTS: 14900
----------------------------------------
INSERT INTO company_conf_stmt (com_conf_stmt_nextduedate, com_conf_stmt_lastmadeupdate)
	SELECT DISTINCT confstmtnextduedate, confstmtlastmadeupdate FROM company_rawdata;

----------------------------------------
-- COMPANY_PREVIOUSNAME TABLE MIGRATION 
-- ROW COUNTS: 190185
----------------------------------------
INSERT INTO company_previousname (com_pn1_condate, com_pn1_companyname, com_pn2_condate, com_pn2_companyname, com_pn3_condate, com_pn3_companyname, com_pn4_condate, com_pn4_companyname, com_pn5_condate, com_pn5_companyname, com_pn6_condate, com_pn6_companyname, com_pn7_condate, com_pn7_companyname, com_pn8_condate, com_pn8_companyname, com_pn9_condate, com_pn9_companyname, com_pn10_condate, com_pn10_companyname) 
	SELECT DISTINCT pn1_condate, pn1_companyname, pn2_condate, pn2_companyname, pn3_condate, pn3_companyname, pn4_condate, pn4_companyname, pn5_condate, pn5_companyname, pn6_condate, pn6_companyname,pn7_condate, pn7_companyname, pn8_condate, pn8_companyname, pn9_condate, pn9_companyname, pn10_condate, pn10_companyname FROM company_rawdata;



