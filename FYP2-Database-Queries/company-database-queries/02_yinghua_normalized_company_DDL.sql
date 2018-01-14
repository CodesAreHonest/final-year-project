-- FILE: 02_yinghua_normalized_company_DDL.sql  
-- DATE: Mon Jan 7 17:00 MYT 2018
-- AUTHOR: Chai Ying Hua 
-- VERSION: 1.0
-- DATABASE: psql (PostgreSQL) 9.5.10
-- DESCRIPTION:
-- =======================================================
--
--  	1. Drop previous created table in proper order. 
--	2. Create sequence in proper order. 
--	3. Drop sequence in reverse order. 
-- 	4. Create table in reverse order for main table to reference foreign key
--	5. Check all the tables. 
-- ========================================================

-- DROP TABLE IN REVERSE ORDER 
DROP TABLE company_uri 			CASCADE; 
DROP TABLE company_partnership 		CASCADE;
DROP TABLE company_siccodes 		CASCADE;
DROP TABLE company_mortgages 		CASCADE; 
DROP TABLE company_returns 		CASCADE; 
DROP TABLE company_account_category 	CASCADE; 
DROP TABLE company_account 		CASCADE;
DROP TABLE company_previousname 	CASCADE; 
DROP TABLE company_conf_stmt 		CASCADE;
DROP TABLE company_address 		CASCADE;
DROP TABLE company_countryoforigin 	CASCADE;
DROP TABLE company_status		CASCADE;
DROP TABLE company_category		CASCADE;
DROP TABLE company_detail		CASCADE;
DROP TABLE company			CASCADE;


-- DROP SEQUENCE IN PROPER ORDER 
DROP SEQUENCE seq_company_id;
DROP SEQUENCE seq_detail_id;
DROP SEQUENCE seq_category_id;
DROP SEQUENCE seq_status_id;
DROP SEQUENCE seq_address_id;
DROP SEQUENCE seq_conf_stmt_id;
DROP SEQUENCE seq_pn_id;
DROP SEQUENCE seq_acc_id;
DROP SEQUENCE seq_acc_category_id;
DROP SEQUENCE seq_return_id;
DROP SEQUENCE seq_mort_id;
DROP SEQUENCE seq_sic_id;
DROP SEQUENCE seq_partnership_id;
DROP SEQUENCE seq_uri_id;

-- DROP SEQUENCE IN PROPER ORDER 
CREATE SEQUENCE seq_uri_id 		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_partnership_id	MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_sic_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_mort_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_return_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_acc_category_id	MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_acc_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_pn_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_conf_stmt_id	MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_address_id		MINVALUE 1 INCREMENT 1;
CREATE SEQUENCE seq_countryoforigin_id	MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_status_id	 	MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_category_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_detail_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_company_id		MINVALUE 1 INCREMENT 1; 

-- CREATE TABLE IN PROPER ORDER 
CREATE TABLE company_uri (
	com_uri_id 			INT DEFAULT NEXTVAL ('seq_uri_id') PRIMARY KEY,
	com_uri 			VARCHAR(47) NOT NULL
); 

CREATE TABLE company_partnership (
	com_partnership_id 		INT DEFAULT NEXTVAL ('seq_partnership_id') PRIMARY KEY, 
	com_num_genpartners 		INT NOT NULL,
	com_num_limpartners		INT NOT NULL
); 

CREATE TABLE company_siccodes ( 
	com_sic_id 			INT DEFAULT NEXTVAL ('seq_sic_id') PRIMARY KEY, 
	com_timeth_change		INT NULL DEFAULT 0,
	com_siccode 			VARCHAR(170) NOT NULL
);

CREATE TABLE company_mortgages ( 
	com_mort_id 			INT DEFAULT NEXTVAL ('seq_mort_id') PRIMARY KEY, 
	com_num_mortchanges		INT NOT NULL,
	com_num_mortoutstanding		INT NOT NULL,
	com_num_mortpartsatisfied	INT NOT NULL,
	com_num_mortsatisfied 		INT NOT NULL
);

CREATE TABLE company_returns ( 
	com_return_id 			INT DEFAULT NEXTVAL ('seq_return_id') PRIMARY KEY, 
	com_return_nextduedate		DATE NULL DEFAULT NULL,
	com_num_mortoutstanding		DATE NULL DEFAULT NULL 
);

CREATE TABLE company_account_category (
	com_acc_category_id 		INT DEFAULT NEXTVAL ('seq_acc_category_id') PRIMARY KEY, 
	com_acc_category 		VARCHAR(100) NULL DEFAULT 'Undefined'
);

CREATE TABLE company_account ( 
	com_acc_id 			INT DEFAULT NEXTVAL ('seq_acc_id') PRIMARY KEY, 
	com_acc_refday			INT NULL DEFAULT 0,
	com_acc_refmonth		INT NULL DEFAULT 0,
	com_acc_nextduedate 		DATE NULL DEFAULT NULL, 
	com_acc_lastmadeupdate		DATE NULL DEFAULT NULL, 
	com_acc_category_id 		INT REFERENCES company_account_category (com_acc_category_id) 
); 

CREATE TABLE company_previousname (
	com_pn_id 			INT DEFAULT NEXTVAL ('seq_pn_id') PRIMARY KEY, 
	com_timeth_change		INT NOT NULL DEFAULT 0,
	com_pn_name 			VARCHAR(160) NOT NULL DEFAULT 'Undefined',
	com_date_change			DATE NULL
); 

CREATE TABLE company_conf_stmt (
	com_conf_stmt_id	 	INT DEFAULT NEXTVAL ('seq_conf_stmt_id') PRIMARY KEY, 
	com_conf_stmt_id_nextduedate	DATE NULL DEFAULT NULL,
	com_conf_stmt_id_lastmadeupdate DATE NULL DEFAULT NULL
);

CREATE TABLE company_address (
	com_address_id			INT DEFAULT NEXTVAL ('seq_address_id') PRIMARY KEY, 
	com_careof			VARCHAR(100) NULL DEFAULT 'Undefined',
	com_pobox 			VARCHAR(10)  NULL DEFAULT 'Undefined', 
	com_addressline1		VARCHAR(300) NULL DEFAULT 'Undefined', 
	com_addressline2		VARCHAR(300) NULL DEFAULT 'Undefined', 
	com_posttown 			VARCHAR(50)  NULL DEFAULT 'Undefined', 
	com_county 			VARCHAR(50)  NULL DEFAULT 'Undefined',
	com_country			VARCHAR(50)  NULL DEFAULT 'Undefined', 
	com_postcode 			VARCHAR(20)  NULL DEFAULT 'Undefined' 
);

CREATE TABLE company_countryoforigin ( 
	com_countryoforigin_id 		INT DEFAULT NEXTVAL ('seq_countryoforigin_id')  PRIMARY KEY, 
	com_countryoforigin 		VARCHAR(50) NOT NULL DEFAULT 'Undefined'
); 

CREATE TABLE company_status ( 
	com_status_id	 		INT DEFAULT NEXTVAL ('seq_status_id') PRIMARY KEY, 
	com_status 			VARCHAR(70) NOT NULL DEFAULT 'Undefined'
);

CREATE TABLE company_category ( 
	com_category_id		 	INT DEFAULT NEXTVAL ('seq_category_id') PRIMARY KEY, 
	com_category 			VARCHAR(100) NOT NULL DEFAULT 'Undefined'
); 

CREATE TABLE company_detail ( 
	com_detail_id	 		INT DEFAULT NEXTVAL ('seq_detail_id') PRIMARY KEY,
	com_name			VARCHAR(160) NULL DEFAULT 'Undefined', 
	com_number 			INT	     NOT NULL, 
	com_address_id			INT	     REFERENCES company_address (com_address_id), 
	com_category_id			INT	     REFERENCES company_category (com_category_id),
	com_status_id			INT	     REFERENCES company_status (com_status_id),
	com_countryoforigin_id		INT	     REFERENCES company_countryoforigin (com_countryoforigin_id) 	     	
);

CREATE TABLE company ( 
	company_id			INT DEFAULT NEXTVAL ('seq_company_id') PRIMARY KEY,
	com_detail_id  			INT REFERENCES company_detail (com_detail_id), 
	com_dissolutiondate     	DATE NOT NULL, 
	com_incorporationdate		DATE NOT NULL, 
	com_acc_id 			INT REFERENCES company_account (com_acc_id), 
	com_return_id			INT REFERENCES company_returns (com_return_id), 
	com_mort_id			INT REFERENCES company_mortgages (com_mort_id), 
	com_sic_id			INT REFERENCES company_siccodes (com_sic_id),
	com_partnership_id		INT REFERENCES company_partnership (com_partnership_id),
	com_uri_id			INT REFERENCES company_uri (com_uri_id),
	com_pn_id			INT REFERENCES company_previousname (com_pn_id),
	com_conf_stmt_id		INT REFERENCES company_conf_stmt (com_conf_stmt_id)
);


-- CHECK WHETHER ALL TABLE AND SEQUENCES ARE CREATED. 
\d+


	



