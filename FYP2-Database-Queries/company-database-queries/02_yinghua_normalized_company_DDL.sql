-- FILE: 02_yinghua_normalized_company_DDL.sql  
-- DATE: Mon Jan 7 17:00 MYT 2018
-- AUTHOR: Chai Ying Hua 
-- VERSION: 1.0
-- DATABASE: psql (PostgreSQL) 9.5.10
-- DESCRIPTION:
-- =======================================================
--
--    1. Drop all normalized company table in reverse order. 
--    2. Create all normalized table in proper order. 
--    3. Check whether all tables are created. 
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


-- CREATE TABLE IN PROPER ORDER 
CREATE TABLE company_uri (
	com_uri_id 			SERIAL PRIMARY KEY,
	com_uri 			VARCHAR(47) NOT NULL
); 

CREATE TABLE company_partnership (
	com_partnership_id 		SERIAL PRIMARY KEY, 
	com_num_genpartners 		INT NOT NULL,
	com_num_limpartners		INT NOT NULL
); 

CREATE TABLE company_siccodes ( 
	com_sic_id 			SERIAL PRIMARY KEY, 
	com_timeth_change		INT NULL DEFAULT 0,
	com_siccode 			VARCHAR(170) NOT NULL
);

CREATE TABLE company_mortgages ( 
	com_mort_id 			SERIAL PRIMARY KEY, 
	com_num_mortchanges		INT NOT NULL,
	com_num_mortoutstanding		INT NOT NULL,
	com_num_mortpartsatisfied	INT NOT NULL,
	com_num_mortsatisfied 		INT NOT NULL
);

CREATE TABLE company_returns ( 
	com_return_id 			SERIAL PRIMARY KEY, 
	com_return_nextduedate		DATE NULL DEFAULT NULL,
	com_num_mortoutstanding		DATE NULL DEFAULT NULL 
);

CREATE TABLE company_account_category (
	com_acc_category_id 		SERIAL PRIMARY KEY, 
	com_acc_category 		VARCHAR(100) NULL DEFAULT 'No Category'
);

CREATE TABLE company_account ( 
	com_acc_id 			SERIAL PRIMARY KEY, 
	com_acc_refday			INT NULL DEFAULT 0,
	com_acc_refmonth		INT NULL DEFAULT 0,
	com_acc_nextduedate 		DATE NULL DEFAULT NULL, 
	com_acc_lastmadeupdate		DATE NULL DEFAULT NULL, 
	com_acc_category_id 		INT REFERENCES company_account_category (com_acc_category_id) 
); 

CREATE TABLE company_previousname (
	com_pn_id 			SERIAL PRIMARY KEY, 
	com_timeth_change		INT NOT NULL DEFAULT 0,
	com_pn_name 			VARCHAR(160) NOT NULL DEFAULT 'No previous name',
	com_date_change			DATE NULL
); 

CREATE TABLE company_conf_stmt (
	com_conf_stmt_id	 	SERIAL PRIMARY KEY, 
	com_conf_stmt_id_nextduedate	DATE NULL DEFAULT NULL,
	com_conf_stmt_id_lastmadeupdate DATE NULL DEFAULT NULL
);

CREATE TABLE company_address (
	com_address_id			SERIAL       PRIMARY KEY, 
	com_careof			VARCHAR(100) NULL DEFAULT 'Unregistered',
	com_pobox 			VARCHAR(10)  NULL DEFAULT 'Unregistered', 
	com_addressline1		VARCHAR(300) NULL DEFAULT 'No address line 1', 
	com_addressline2		VARCHAR(300) NULL DEFAULT 'No address line 2', 
	com_posttown 			VARCHAR(50)  NULL DEFAULT 'No posttown', 
	com_county 			VARCHAR(50)  NULL DEFAULT 'Undefined',
	com_country			VARCHAR(50)  NULL DEFAULT 'Undefined', 
	com_postcode 			VARCHAR(20)  NULL DEFAULT 'Undefined' 
);

CREATE TABLE company_countryoforigin ( 
	com_countryoforigin_id 		SERIAL      PRIMARY KEY, 
	com_countryoforigin 		VARCHAR(50) NOT NULL DEFAULT 'Undefined'
); 

CREATE TABLE company_status ( 
	com_status_id	 		SERIAL      PRIMARY KEY, 
	com_status 			VARCHAR(70) NOT NULL DEFAULT 'Undefined'
);

CREATE TABLE company_category ( 
	com_category_id		 	SERIAL       PRIMARY KEY, 
	com_category 			VARCHAR(100) NOT NULL DEFAULT 'Undefined'
); 

CREATE TABLE company_detail ( 
	com_detail_id	 		SERIAL       PRIMARY KEY,
	com_name			VARCHAR(160) NULL DEFAULT 'No company name', 
	com_number 			INT	     NOT NULL, 
	com_address_id			INT	     REFERENCES company_address (com_address_id), 
	com_category_id			INT	     REFERENCES company_category (com_category_id),
	com_status_id			INT	     REFERENCES company_status (com_status_id),
	com_countryoforigin_id		INT	     REFERENCES company_countryoforigin (com_countryoforigin_id) 	     	
);

CREATE TABLE company ( 
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
	com_conf_stmt_id		INT REFERENCES company_conf_stmt (com_conf_stmt_id),

	PRIMARY KEY (com_detail_id) 
);


-- CHECK WHETHER ALL TABLE AND SEQUENCES ARE CREATED. 
\d+


	



