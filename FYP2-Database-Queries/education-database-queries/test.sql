DELETE FROM leo WHERE TRUE;

INSERT INTO leo (leo_pr_att_id) 
	SELECT leo_pr_att_id FROM leo_prior_attainment   AS pa, 
			      	   leo_rawdata 		  AS rawdata 
	WHERE  pa.leo_pr_att_band 		= rawdata.prattband
	AND    pa.leo_pr_att_included           = rawdata.prattincluded;
