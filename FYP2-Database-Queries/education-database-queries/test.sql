DELETE FROM leo WHERE TRUE;

INSERT INTO leo (leo_detail_id) 
	SELECT leo_detail_id FROM leo_detail 	AS detail, 
				  leo_rawdata 	AS rawdata 
	WHERE 	detail.leo_ukprn = rawdata.ukprn 
	AND 	detail.leo_providername = rawdata.providername
	AND 	detail.leo_region = rawdata.region
	AND 	detail.leo_subject = rawdata.subject
	AND 	detail.leo_sex = rawdata.sex
	AND 	detail.leo_yearaftergraduation = rawdata.yearaftergraduation;

-- UDPATE 
UPDATE leo 
SET  leo_grads_id = grad.leo_grads_id
FROM leo_graduation as grad, leo_rawdata as rawdata 
WHERE 	grad.leo_grad = rawdata.grads;

