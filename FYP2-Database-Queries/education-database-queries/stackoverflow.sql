DROP TABLE company_detail   CASCADE; 
DROP TABLE company_category CASCADE; 
DROP TABLE company_status   CASCADE; 
DROP TABLE company 	    CASCADE; 

CREATE TABLE company_detail ( 
	com_detail_id SERIAL    PRIMARY KEY, 
	com_name      VARCHAR(20), 
	com_number    VARCHAR(20)
);

CREATE TABLE company_category ( 
	com_category_id SERIAL  PRIMARY KEY, 
	com_category 	VARCHAR(20)
);

CREATE TABLE company_status ( 
	com_status_id  SERIAL   PRIMARY KEY, 
	com_status     VARCHAR(50) 
); 

CREATE TABLE company ( 
	com_id 	 	SERIAL 	PRIMARY KEY, 
	com_detail_id   INT REFERENCES company_detail   (com_detail_id), 
	com_category_id INT REFERENCES company_category (com_category_id), 
	com_status_id   INT REFERENCES company_status   (com_status_id) 
);

INSERT INTO company_detail (com_name, com_number) VALUES ('Starbucks', 'Star0121'); 
INSERT INTO company_detail (com_name, com_number) VALUES ('KFC', 'KFC1122'); 
INSERT INTO company_detail (com_name, com_number) VALUES ('MCD', 'MCD0000'); 
INSERT INTO company_detail (com_name, com_number) VALUES ('MB', 'MB2202'); 
INSERT INTO company_detail (com_name, com_number) VALUES ('Chatime', 'Pizza99'); 

INSERT INTO company_category (com_category) VALUES ('Fast food'); 
INSERT INTO company_category (com_category) VALUES ('Drinks'); 
INSERT INTO company_category (com_category) VALUES ('Restaurant'); 

INSERT INTO company_status (com_status) VALUES ('Active'); 
INSERT INTO company_status (com_status) VALUES ('Liquidation'); 
INSERT INTO company_status (com_status) VALUES ('In Administration');

INSERT INTO company (com_detail_id, com_category_id, com_status_id)
SELECT com_detail_id, com_category_id, com_status_id
FROM companydata AS rawdata
JOIN company_detail AS detail ON detail.com_name = rawdata.companyname AND detail.com_number = rawdata.companynumber
JOIN company_category AS cat ON cat.com_category = rawdata.companycategory
JOIN company_status AS status ON status.com_status = rawdata.companystatus;

