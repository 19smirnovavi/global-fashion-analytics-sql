SELECT 
    "Currency" AS currency_name,
    COUNT(*) AS total_transactions,
    ROUND(SUM("Invoice Total"::numeric), 2) AS total_sales_volume
FROM transactions
GROUP BY "Currency"
ORDER BY total_transactions DESC;
