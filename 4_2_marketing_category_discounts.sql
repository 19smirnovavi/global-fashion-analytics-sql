SELECT 
	p. "Category",
	p. "Sub Category",
	ROUND(AVG (t. "Discount")::numeric,2) AS avg_discount
FROM transactions AS t
INNER JOIN products AS p
	ON t."Product ID" = p. "Product ID"
GROUP BY p. "Category", p. "Sub Category"
ORDER BY avg_discount DESC;
	