-- File: 03_yinghua_insert_company_table.sql
-- Date: Fri Jan 14 18:02 MYT 2018
-- Author: Chai Ying Hua 
-- Version: 1.0 
-- Database: psql (PostgreSQL) 9.5.10
-- =========================================================
-- =========================================================

--DELETE FROM company_uri WHERE TRUE; 
--DELETE FROM company_partnership WHERE TRUE; 
--DELETE FROM company_mortgages WHERE TRUE;
--DELETE FROM company_returns WHERE TRUE;
--DELETE FROM company_account_category WHERE TRUE;

-- SELECT UNIQUE DATA FROM RAW TABLE AND INSERT INTO NORMALIZED DATA. 
----------------------------------------
-- COMPANY_URI TABLE INSERTION 
-- ROW COUNTS: 4077979 
----------------------------------------
--INSERT INTO company_uri (com_uri)
--	SELECT DISTINCT uri FROM company_rawdata;

----------------------------------------
-- COMPANY_PARTNERSHIP TABLE INSERTION 
-- ROW COUNTS: 346
----------------------------------------
--INSERT INTO company_partnership (com_num_genpartners, com_num_limpartners)
--	SELECT DISTINCT numgenpartners, numlimpartners FROM company_rawdata;

----------------------------------------
-- COMPANY_MORTGAGES TABLE INSERTION 
-- ROW COUNTS: 4594
----------------------------------------
--INSERT INTO company_mortgages (com_num_mortchanges, com_num_mortoutstanding, com_num_mortpartsatisfied, com_num_mortsatisfied)
--	SELECT DISTINCT nummortcharges, nummortoutstanding, nummortpartsatisfied, nummortsatisfied FROM company_rawdata;

----------------------------------------
-- COMPANY_RETURNS TABLE INSERTION 
-- ROW COUNTS: 20185
----------------------------------------
--INSERT INTO company_returns (com_return_nextduedate, com_return_lastmadeupdate)
--	SELECT DISTINCT return_nextduedate, return_lastmadeupdate FROM company_rawdata;

----------------------------------------
-- COMPANY_ACCOUNT_CATEGORY TABLE INSERTION 
-- ROW COUNTS: 21
----------------------------------------
--INSERT INTO company_account_category (com_acc_category)
--	SELECT DISTINCT companycategory FROM company_rawdata;


----------------------------------------
-- COMPANY_ACCOUNT TABLE INSERTION 
-- ROW COUNTS: -
----------------------------------------
--INSERT INTO company_account (com_acc_refday, com_acc_refmonth, com_acc_nextduedate, --com_acc_lastmadeupdate, com_acc_category_id)
--	SELECT DISTINCT accountingrefday, accountingrefmonth, account_nextduedate, account_lastmadeupdate, com_acc_category_id 
--	FROM company_rawdata AS rawdata
--	JOIN company_account_category AS category 
--	ON rawdata.accountcategory = category.com_acc_category; 




