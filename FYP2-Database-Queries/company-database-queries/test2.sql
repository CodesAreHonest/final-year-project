DROP TABLE company			CASCADE;

CREATE TABLE company ( 
	com_detail_id  			INT REFERENCES company_detail (com_detail_id), 
	com_dissolutiondate     	VARCHAR(20) NOT NULL, 
	com_incorporationdate		VARCHAR(20) NOT NULL, 
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
