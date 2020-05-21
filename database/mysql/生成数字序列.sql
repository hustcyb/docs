WITH recursive number(n) AS (
	SELECT 0 UNION ALL
	SELECT n + 1 AS id FROM number WHERE n < 9
)
SELECT 100000 * num1.n + 10000 * num2.n +  1000 * num3.n + 100 * num4.n + 10 * num5.n + num6.n AS num
FROM number num1, number num2, number num3, number num4, number num5, number num6;