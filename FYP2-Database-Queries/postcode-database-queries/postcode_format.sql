DROP TABLE postcode_temp; 
DROP TABLE postcode_format; 

create table postcode_format ( 
	pos_form_id 			INT DEFAULT NEXTVAL ('seq_pos_form_id'),
	pos_form_name			VARCHAR(15) NOT NULL, 
	pos_id 				INT NOT NULL,
	PRIMARY KEY(pos_form_id)
);

create table postcode_temp ( 
	pos_temp_id			INT DEFAULT NEXTVAL ('seq_pos_temp_id'),  		
	postcode1 			VARCHAR(15) NOT NULL, 
	postcode2			VARCHAR(15) NOT NULL, 
	postcode3 			VARCHAR(15) NOT NULL
);

----------------------------------------
-- POSTCODE_TEMP TABLE INSERTION 
-- ROW COUNTS: 1754882
----------------------------------------
INSERT INTO postcode_temp (postcode1, postcode2, postcode3)
	SELECT postcode1, postcode2, postcode3 FROM nspl_rawdata; 	

----------------------------------------
-- POSTCODE_FORMAT TABLE INSERTION 
-- ROW COUNTS: 
----------------------------------------
INSERT INTO postcode_format (pos_form_name, pos_id)
	SELECT DISTINCT postcode1, pos_temp_id FROM postcode_temp ORDER BY pos_temp_id ASC;

INSERT INTO postcode_format (pos_form_name, pos_id)
	SELECT DISTINCT postcode2, pos_temp_id FROM postcode_temp ORDER BY pos_temp_id ASC;

INSERT INTO postcode_format (pos_form_name, pos_id)
	SELECT DISTINCT postcode3, pos_temp_id FROM postcode_temp ORDER BY pos_temp_id ASC;
