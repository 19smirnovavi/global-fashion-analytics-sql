SELECT
	p. "Category",
	p. "Sub Category",
	ROUND (SUM(
		CASE
			WHEN t."Currency" = 'EUR' THEN t."Invoice Total"::numeric
			WHEN t."Currency" = 'USD' THEN t."Invoice Total"::numeric*0.8616
			WHEN t."Currency" = 'CNY' THEN t."Invoice Total"::numeric*0.1282
			WHEN t."Currency" = 'GBP' THEN t."Invoice Total"::numeric*1.16
		END), 2) AS global_gmv_eur,
	COUNT(*) AS count_transactions
FROM transactions AS t
INNER JOIN products AS p
	ON t. "Product ID" = p."Product ID"
GROUP BY p. "Category", p. "Sub Category";