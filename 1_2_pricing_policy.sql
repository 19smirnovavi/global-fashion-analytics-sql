SELECT 
	"Currency",
	MIN ("Unit Price") AS min_price,
	MAX ("Unit Price") AS max_price,
	ROUND (AVG ("Unit Price")::numeric, 2) AS avg_price
FROM transactions
GROUP BY "Currency"
ORDER BY COUNT(*) DESC;
