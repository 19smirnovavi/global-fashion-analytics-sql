SELECT 
	s. "Country",
	s. "City",
	ROUND (SUM(
		CASE
			WHEN "Currency" = 'EUR' THEN "Invoice Total"::numeric
			WHEN "Currency" = 'USD' THEN "Invoice Total"::numeric*0.8616
			WHEN "Currency" = 'CNY' THEN "Invoice Total"::numeric*0.1282
			WHEN "Currency" = 'GBP' THEN "Invoice Total"::numeric*1.16
		END),
	2) AS total_revenue_eur,
	ROUND ((SUM(
		CASE
			WHEN "Currency" = 'EUR' THEN "Invoice Total"::numeric
			WHEN "Currency" = 'USD' THEN "Invoice Total"::numeric*0.8616
			WHEN "Currency" = 'CNY' THEN "Invoice Total"::numeric*0.1282
			WHEN "Currency" = 'GBP' THEN "Invoice Total"::numeric*1.16
		END)) / COUNT (DISTINCT e. "Employee ID")::numeric,
	2) AS revenue_per_employee
FROM transactions AS t
INNER JOIN employees AS e 
	ON t. "Employee ID" = e. "Employee ID"
INNER JOIN stores AS s
	ON e. "Store ID" = s. "Store ID"
GROUP BY s. "Country", s. "City"
HAVING SUM(
		CASE
			WHEN "Currency" = 'EUR' THEN "Invoice Total"::numeric
			WHEN "Currency" = 'USD' THEN "Invoice Total"::numeric*0.8616
			WHEN "Currency" = 'CNY' THEN "Invoice Total"::numeric*0.1282
			WHEN "Currency" = 'GBP' THEN "Invoice Total"::numeric*1.16
		END) >= 1000000
ORDER BY revenue_per_employee DESC;