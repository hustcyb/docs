WITH RECURSIVE users AS (
	SELECT
		user_id,
		workcode,
		username,
		report_to,
		activity_id
	FROM
		hr_user
	WHERE
		workcode = '01373660'
	UNION ALL
	SELECT
		hr_user.user_id,
		hr_user.workcode,
		hr_user.username,
		hr_user.report_to,
		hr_user.activity_id
	FROM hr_user
	INNER JOIN users ON
		hr_user.workcode = users.report_to
) SELECT
	user_id,
	workcode,
	username,
	report_to,
	activity_id
FROM
	users;