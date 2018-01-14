DROP TABLE postcode CASCADE; 

create table postcode ( 
	pos_detail_id 			INT REFERENCES postcode_detail (pos_detail_id), 
	pos_county_id 			INT REFERENCES postcode_county (pos_county_id),
	pos_lac_id 			INT REFERENCES postcode_local_authority_county (pos_lac_id),
	pos_ward_id 			INT REFERENCES postcode_ward (pos_ward_id), 
	pos_country_id			INT REFERENCES postcode_country (pos_country_id),
	pos_region_id 			INT REFERENCES postcode_region (pos_region_id),	
	pos_par_cons_id 		INT REFERENCES postcode_parliament_constituency (pos_par_cons_id),
	pos_eer_id 			INT REFERENCES postcode_euro_electoral_region (pos_eer_id), 
	pos_pct_id			INT REFERENCES postcode_primary_care_trust (pos_pct_id),  
	pos_lsoa_id			INT REFERENCES postcode_lower_super_output_area (pos_lsoa_id), 
	pos_msoa_id			INT REFERENCES postcode_middle_super_output_area (pos_msoa_id), 
	pos_oac_id			INT REFERENCES postcode_output_area_classification (pos_oac_id),
	pos_greek_coordinate_id		INT REFERENCES postcode_greek_coordinate (pos_greek_coordinate_id)	
);

INSERT INTO postcode (pos_par_cons_id)
	SELECT pos_par_cons_id
	FROM nspl_rawdata AS rawdata
	JOIN postcode_parliament_constituency      AS ppc 
		ON      ppc.pos_par_cons_code 	= rawdata.par_cons_code
		AND     ppc.pos_par_cons_name   = rawdata.par_cons_name;
