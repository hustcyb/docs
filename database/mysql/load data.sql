LOAD DATA LOCAL INFILE 
"E:\\logs\\access_info.2019-12-15.log"
INTO TABLE access_log
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(@SYSTEM_CODE, @SYSTEM_NAME, @SYSTEM_ID,@REQ_URI,@RAW_URI,@REQ_STATUS,@ACCESS_TIME,@REQ_COST)
SET
	system_id = @SYSTEM_ID,
	req_cost = @REQ_COST,
	raw_uri = @RAW_URI,
	req_status = @REQ_STATUS,
	access_time = @ACCESS_TIME;