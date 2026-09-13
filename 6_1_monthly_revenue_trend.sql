SELECT 
	DATE_TRUNC('month',"Date"::date)::date AS sales_month,
	ROUND (SUM(
		CASE
			WHEN "Currency" = 'EUR' THEN "Invoice Total"::numeric
			WHEN "Currency" = 'USD' THEN "Invoice Total"::numeric*0.8616
			WHEN "Currency" = 'CNY' THEN "Invoice Total"::numeric*0.1282
			WHEN "Currency" = 'GBP' THEN "Invoice Total"::numeric*1.16
		END), 2) AS monthly_revenue_eur
FROM transactions
GROUP BY sales_month
ORDER BY sales_month ASC;