UPDATE company_rawdata SET companyname = DEFAULT WHERE companyname IS NULL;
UPDATE company_rawdata SET careof = DEFAULT WHERE careof IS NULL; 
UPDATE company_rawdata SET pobox = DEFAULT WHERE pobox IS NULL; 
UPDATE company_rawdata SET addressline1 = DEFAULT WHERE addressline1 IS NULL; 
UPDATE company_rawdata SET addressline2 = DEFAULT WHERE addressline2 IS NULL;  

UPDATE company_rawdata SET posttown = DEFAULT WHERE posttown IS NULL; 
UPDATE company_rawdata SET pobox = DEFAULT WHERE pobox IS NULL; 
UPDATE company_rawdata SET county = DEFAULT WHERE county IS NULL; 
UPDATE company_rawdata SET country = DEFAULT WHERE country IS NULL;
UPDATE company_rawdata SET postcode = DEFAULT WHERE postcode IS NULL;

UPDATE company_rawdata SET dissolutiondate = DEFAULT WHERE dissolutiondate IS NULL; 
UPDATE company_rawdata SET incorporationdate = DEFAULT WHERE incorporationdate IS NULL; 
UPDATE company_rawdata SET accountingrefday = DEFAULT WHERE accountingrefday IS NULL; 
UPDATE company_rawdata SET accountingrefmonth = DEFAULT WHERE accountingrefmonth IS NULL;
UPDATE company_rawdata SET account_nextduedate = DEFAULT WHERE account_nextduedate IS NULL;

UPDATE company_rawdata SET account_lastmadeupdate = DEFAULT WHERE account_lastmadeupdate IS NULL; 
UPDATE company_rawdata SET siccode1 = DEFAULT WHERE siccode1 IS NULL; 
UPDATE company_rawdata SET siccode2 = DEFAULT WHERE siccode2 IS NULL; 
UPDATE company_rawdata SET siccode3 = DEFAULT WHERE siccode3 IS NULL;
UPDATE company_rawdata SET siccode4 = DEFAULT WHERE siccode4 IS NULL;

UPDATE company_rawdata SET pn1_condate = DEFAULT WHERE pn1_condate IS NULL; 
UPDATE company_rawdata SET pn1_companyname = DEFAULT WHERE pn1_companyname IS NULL; 
UPDATE company_rawdata SET pn2_condate = DEFAULT WHERE pn2_condate IS NULL; 
UPDATE company_rawdata SET pn2_companyname = DEFAULT WHERE pn2_companyname IS NULL; 
UPDATE company_rawdata SET pn3_condate = DEFAULT WHERE pn3_condate IS NULL; 
UPDATE company_rawdata SET pn3_companyname = DEFAULT WHERE pn3_companyname IS NULL; 

UPDATE company_rawdata SET pn4_condate = DEFAULT WHERE pn4_condate IS NULL; 
UPDATE company_rawdata SET pn4_companyname = DEFAULT WHERE pn4_companyname IS NULL; 
UPDATE company_rawdata SET pn5_condate = DEFAULT WHERE pn5_condate IS NULL; 
UPDATE company_rawdata SET pn5_companyname = DEFAULT WHERE pn5_companyname IS NULL; 
UPDATE company_rawdata SET pn6_condate = DEFAULT WHERE pn6_condate IS NULL; 
UPDATE company_rawdata SET pn6_companyname = DEFAULT WHERE pn6_companyname IS NULL; 

UPDATE company_rawdata SET pn7_condate = DEFAULT WHERE pn7_condate IS NULL; 
UPDATE company_rawdata SET pn7_companyname = DEFAULT WHERE pn8_companyname IS NULL; 
UPDATE company_rawdata SET pn8_condate = DEFAULT WHERE pn8_condate IS NULL; 
UPDATE company_rawdata SET pn8_companyname = DEFAULT WHERE pn8_companyname IS NULL; 
UPDATE company_rawdata SET pn9_condate = DEFAULT WHERE pn9_condate IS NULL; 
UPDATE company_rawdata SET pn9_companyname = DEFAULT WHERE pn9_companyname IS NULL; 
UPDATE company_rawdata SET pn10_condate = DEFAULT WHERE pn10_condate IS NULL; 
UPDATE company_rawdata SET pn10_companyname = DEFAULT WHERE pn10_companyname IS NULL;

UPDATE company_rawdata SET ConfStmtNextDueDate = DEFAULT WHERE ConfStmtNextDueDate IS NULL;
UPDATE company_rawdata SET ConfStmtLastMadeUpDate = DEFAULT WHERE ConfStmtLastMadeUpDate IS NULL;
