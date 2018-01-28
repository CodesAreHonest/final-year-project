DROP TABLE company_previousname 	CASCADE;
DROP TABLE company_siccodes 		CASCADE; 
DROP TABLE company_returns 		CASCADE; 
DROP TABLE company_mortgages 		CASCADE; 
DROP TABLE company_partnership 		CASCADE;
DROP TABLE company_uri 			CASCADE; 
DROP TABLE company_conf_stmt 		CASCADE;

DROP SEQUENCE seq_sic_id;
DROP SEQUENCE seq_pn_id;
DROP SEQUENCE seq_return_id;
DROP SEQUENCE seq_mort_id;
DROP SEQUENCE seq_partnership_id;
DROP SEQUENCE seq_uri_id;
DROP SEQUENCE seq_conf_stmt_id;

CREATE SEQUENCE seq_sic_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_pn_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_return_id		MINVALUE 1 INCREMENT 1;
CREATE SEQUENCE seq_mort_id		MINVALUE 1 INCREMENT 1;  
CREATE SEQUENCE seq_partnership_id	MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_uri_id 		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_conf_stmt_id	MINVALUE 1 INCREMENT 1; 


CREATE TABLE company_siccodes ( 
	com_sic_id 			INT DEFAULT NEXTVAL ('seq_sic_id') PRIMARY KEY, 
	com_siccode1 			VARCHAR(170) NOT NULL,
	com_siccode2 			VARCHAR(170) NOT NULL,
	com_siccode3 			VARCHAR(170) NOT NULL,
	com_siccode4 			VARCHAR(170) NOT NULL
);

CREATE TABLE company_previousname (
	com_pn_id 			INT DEFAULT NEXTVAL ('seq_pn_id') PRIMARY KEY, 
	com_pn1_condate			VARCHAR(20) NOT NULL,
	com_pn1_companyname		VARCHAR(160) NOT NULL,
	com_pn2_condate			VARCHAR(20) NOT NULL,
	com_pn2_companyname		VARCHAR(160) NOT NULL,
	com_pn3_condate			VARCHAR(20) NOT NULL,
	com_pn3_companyname		VARCHAR(160) NOT NULL,
	com_pn4_condate			VARCHAR(20) NOT NULL,
	com_pn4_companyname		VARCHAR(160) NOT NULL,
	com_pn5_condate			VARCHAR(20) NOT NULL,
	com_pn5_companyname		VARCHAR(160) NOT NULL,
	com_pn6_condate			VARCHAR(20) NOT NULL,
	com_pn6_companyname		VARCHAR(160) NOT NULL,
	com_pn7_condate			VARCHAR(20) NOT NULL,
	com_pn7_companyname		VARCHAR(160) NOT NULL,
	com_pn8_condate			VARCHAR(20) NOT NULL,
	com_pn8_companyname		VARCHAR(160) NOT NULL,
	com_pn9_condate			VARCHAR(20) NOT NULL,
	com_pn9_companyname		VARCHAR(160) NOT NULL,
	com_pn10_condate		VARCHAR(20) NOT NULL,
	com_pn10_companyname		VARCHAR(160) NOT NULL

); 

CREATE TABLE company_returns ( 
	com_return_id 			INT DEFAULT NEXTVAL ('seq_return_id') PRIMARY KEY, 
	com_return_nextduedate		VARCHAR(50) NULL DEFAULT NULL,
	com_return_lastmadeupdate	VARCHAR(50) NULL DEFAULT NULL 
);

CREATE TABLE company_mortgages ( 
	com_mort_id 			INT DEFAULT NEXTVAL ('seq_mort_id') PRIMARY KEY, 
	com_num_mortchanges		INT NOT NULL,
	com_num_mortoutstanding		INT NOT NULL,
	com_num_mortpartsatisfied	INT NOT NULL,
	com_num_mortsatisfied 		INT NOT NULL
);

CREATE TABLE company_partnership (
	com_partnership_id 		INT DEFAULT NEXTVAL ('seq_partnership_id') PRIMARY KEY, 
	com_num_genpartners 		INT NOT NULL,
	com_num_limpartners		INT NOT NULL
); 

CREATE TABLE company_uri (
	com_uri_id 			INT DEFAULT NEXTVAL ('seq_uri_id') PRIMARY KEY,
	com_uri 			VARCHAR(47) NOT NULL
); 

CREATE TABLE company_conf_stmt (
	com_conf_stmt_id	 	INT DEFAULT NEXTVAL ('seq_conf_stmt_id') PRIMARY KEY, 
	com_conf_stmt_nextduedate	VARCHAR(50) NULL DEFAULT NULL,
	com_conf_stmt_lastmadeupdate 	VARCHAR(50) NULL DEFAULT NULL
);


