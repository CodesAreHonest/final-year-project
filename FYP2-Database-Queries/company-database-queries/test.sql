DROP SEQUENCE seq_sic_id;
DROP SEQUENCE seq_detail_id;
DROP SEQUENCE seq_pn_id;

CREATE SEQUENCE seq_sic_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_detail_id		MINVALUE 1 INCREMENT 1; 
CREATE SEQUENCE seq_pn_id		MINVALUE 1 INCREMENT 1; 

DROP TABLE company_previousname CASCADE;
DROP TABLE company_siccodes CASCADE; 
DROP TABLE company_detail CASCADE;
DROP TABLE company; 

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

CREATE TABLE company_siccodes ( 
	com_sic_id 			INT DEFAULT NEXTVAL ('seq_sic_id') PRIMARY KEY, 
	com_siccode1 			VARCHAR(170) NOT NULL,
	com_siccode2 			VARCHAR(170) NOT NULL,
	com_siccode3 			VARCHAR(170) NOT NULL,
	com_siccode4 			VARCHAR(170) NOT NULL
);

CREATE TABLE company_detail ( 
	com_detail_id	 		INT DEFAULT NEXTVAL ('seq_detail_id') PRIMARY KEY,
	com_name			VARCHAR(160) NULL DEFAULT 'Undefined', 
	com_number 			VARCHAR(10)  NOT NULL, 
	com_category_id			INT	     REFERENCES company_category (com_category_id),
	com_status_id			INT	     REFERENCES company_status (com_status_id)	     	
);

CREATE TABLE company ( 
	com_detail_id  			INT REFERENCES company_detail (com_detail_id), 
	com_dissolutiondate     	DATE NOT NULL, 
	com_incorporationdate		DATE NOT NULL, 
	com_countryoforigin 		VARCHAR(50) NOT NULL DEFAULT 'Undefined',
	com_careof			VARCHAR(100) NULL DEFAULT 'Undefined',
	com_pobox 			VARCHAR(10)  NULL DEFAULT 'Undefined', 
	com_addressline1		VARCHAR(300) NULL DEFAULT 'Undefined', 
	com_addressline2		VARCHAR(300) NULL DEFAULT 'Undefined', 
	com_posttown 			VARCHAR(50)  NULL DEFAULT 'Undefined', 
	com_county 			VARCHAR(50)  NULL DEFAULT 'Undefined',
	com_country			VARCHAR(50)  NULL DEFAULT 'Undefined', 
	com_postcode 			VARCHAR(20)  NULL DEFAULT 'Undefined',
	com_acc_id 			INT REFERENCES company_account (com_acc_id), 
	com_return_id			INT REFERENCES company_returns (com_return_id), 
	com_mort_id			INT REFERENCES company_mortgages (com_mort_id), 
	com_sic_id			INT REFERENCES company_siccodes (com_sic_id),
	com_partnership_id		INT REFERENCES company_partnership (com_partnership_id),
	com_uri_id			INT REFERENCES company_uri (com_uri_id),
	com_pn_id			INT REFERENCES company_previousname (com_pn_id),
	com_conf_stmt_id		INT REFERENCES company_conf_stmt (com_conf_stmt_id)
);

