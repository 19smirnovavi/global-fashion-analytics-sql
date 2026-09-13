SELECT 
	t. "Product ID",
	ROUND (AVG(
		CASE
			WHEN t."Currency" = 'EUR' THEN t."Unit Price"::numeric
			WHEN t."Currency" = 'USD' THEN t."Unit Price"::numeric*0.8616
			WHEN t."Currency" = 'CNY' THEN t."Unit Price"::numeric*0.1282
			WHEN t."Currency" = 'GBP' THEN t."Unit Price"::numeric*1.16
		END), 2) AS avg_unit_price_eur,
	ROUND (AVG (p. "Production Cost")::numeric,2) AS production_cost_eur,
	ROUND (AVG (
		(CASE
			WHEN t."Currency" = 'EUR' THEN t."Unit Price"::numeric
			WHEN t."Currency" = 'USD' THEN t."Unit Price"::numeric*0.8616
			WHEN t."Currency" = 'CNY' THEN t."Unit Price"::numeric*0.1282
			WHEN t."Currency" = 'GBP' THEN t."Unit Price"::numeric*1.16
		END) - p. "Production Cost")::numeric,2) AS product_marginality
FROM transactions AS t
INNER JOIN products AS p
	ON t. "Product ID" = p."Product ID"
GROUP BY t. "Product ID"
ORDER BY product_marginality DESC;
	
	