SELECT 
	c. "Gender",
	c. "Job Title",
	SUM (CASE
			WHEN t."Currency" = 'EUR' THEN t."Invoice Total"::numeric
			WHEN t."Currency" = 'USD' THEN t."Invoice Total"::numeric*0.8616
			WHEN t."Currency" = 'CNY' THEN t."Invoice Total"::numeric*0.1282
			WHEN t."Currency" = 'GBP' THEN t."Invoice Total"::numeric*1.16
		END) AS sum_invoice_total_eur
FROM transactions AS t
INNER JOIN customers AS c
	ON t."Customer ID" = c."Customer ID"
WHERE c."Job Title" IS NOT NULL AND LENGTH(TRIM(c."Job Title")) > 0
GROUP BY c. "Gender", c. "Job Title"
HAVING COUNT(DISTINCT(t."Invoice ID"))>=5
ORDER BY sum_invoice_total_eur DESC
LIMIT 10;
