SELECT
	class_id,
-- 	string_agg(student_name)
	array_to_string(array_agg(student_name), ',')
FROM (
	SELECT 1 AS student_id, 'Jim' AS student_name, 1 AS class_id UNION ALL
	SELECT 2 AS student_id, 'Tom' AS student_name, 2 AS class_id UNION ALL
	SELECT 3 AS student_id, 'Lucy' AS student_name, 1 AS class_id UNION ALL
	SELECT 4 AS student_id, 'Lily' AS student_name, 2 AS class_id
) tmp_student
GROUP BY class_id;