-- FILE: 01_yinghua_create_companydata_table.sql  
-- DATE: Fri Jan 5 10:46 MYT 2018
-- AUTHOR: Chai Ying Hua 
-- VERSION: 1.0
-- DATABASE: psql (PostgreSQL) 9.5.10
-- DESCRIPTION:
--
--    1. Create companies table in company database
--
-- ========================================================

-- drop the previous table 
drop table company_rawdata; 

-- create new table for the database 
create table company_rawdata ( 
	CompanyName 		varchar(160) null default 'Undefined', 
	CompanyNumber 		varchar(8) not null primary key,
	CareOf 			varchar(100) null default 'Undefined', 
	POBox 			varchar(10) null default 'Undefined',
	AddressLine1 		varchar(300) null default 'Undefined',
	AddressLine2 		varchar(300) null default 'Undefined',
	PostTown 		varchar(50) null default 'Undefined',
	County 			varchar(50) null default 'Undefined',
	Country 		varchar(50) null default 'Undefined',
	PostCode 		varchar(20) null default 'Undefined',
	CompanyCategory 	varchar(100) not null,
	CompanyStatus 		varchar(70) not null,
	CountryOfOrigin 	varchar(50) not null,
	DissolutionDate 	date null default '3000-01-01',
	IncorporationDate 	date null default '3000-01-01',
	AccountingRefDay 	int null default 0,
	AccountingRefMonth 	int null default 0,
	Account_NextDueDate 	date null default '3000-01-01',
	Account_LastMadeUpdate 	date null default '3000-01-01',
	AccountCategory 	varchar(30) null default 'Undefined',
	Return_NextDueDate 	date null default '3000-01-01',
	Return_LastMadeUpDate 	date null default '3000-01-01',
	NumMortCharges 		int not null,
	NumMortOutstanding 	int not null,
	NumMortPartSatisfied	int not null,
	NumMortSatisfied 	int not null,
	SICCode1 		varchar(170) null default 'Undefined',
	SICCode2 		varchar(170) null default 'Undefined',
	SICCode3 		varchar(170) null default 'Undefined',
	SICCode4 		varchar(170) null default 'Undefined',
	NumGenPartners 		int not null,
	NumLimPartners 		int not null,
	URI 			varchar(47) not null,
	pn1_CONDate 		date null default '3000-01-01',
	pn1_CompanyName 	varchar(160) null default 'Undefined',
	pn2_CONDate 		date null default '3000-01-01',
	pn2_CompanyName 	varchar(160) null default 'Undefined',
	pn3_CONDate 		date null default '3000-01-01',
	pn3_CompanyName 	varchar(160) null default 'Undefined',
	pn4_CONDate 		date null default '3000-01-01',
	pn4_CompanyName 	varchar(160) null default 'Undefined',
	pn5_CONDate 		date null default '3000-01-01',
	pn5_CompanyName 	varchar(160) null default 'Undefined',
	pn6_CONDate 		date null default '3000-01-01',
	pn6_CompanyName		varchar(160) null default 'Undefined',
	pn7_CONDate 		date null default '3000-01-01',
	pn7_CompanyName 	varchar(160) null default 'Undefined',
	pn8_CONDate 		date null default '3000-01-01',
	pn8_CompanyName 	varchar(160) null default 'Undefined',
	pn9_CONDate 		date null default '3000-01-01',
	pn9_CompanyName 	varchar(160) null default 'Undefined',
	pn10_CONDate 		date null default '3000-01-01',
	pn10_CompanyName 	varchar(160) null default 'Undefined',
	ConfStmtNextDueDate 	date null default '3000-01-01',
	ConfStmtLastMadeUpDate 	date null default '3000-01-01'
);

-- copy the content of csv into the table
\copy company_rawdata from '/home/yinghua/Documents/FYP1/FYP-data/company-data/company-data-full.csv' with header csv;

-- verify whether all data are inserted
select count(*) from company_rawdata;

-- list the structure of company_rawdata table 
\d+ company_rawdata; 


