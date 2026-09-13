SELECT 
	ROUND(SUM( CASE 
            WHEN "Currency" = 'EUR' THEN "Invoice Total"::numeric
            WHEN "Currency" = 'USD' THEN "Invoice Total"::numeric * 0.8616
            WHEN "Currency" = 'CNY' THEN "Invoice Total"::numeric * 0.1282
            WHEN "Currency" = 'GBP' THEN "Invoice Total"::numeric * 1.16
            ELSE 0
        END) FILTER (WHERE "Discount">0),2) AS discounted_invoice,
	ROUND(SUM( CASE 
            WHEN "Currency" = 'EUR' THEN "Invoice Total"::numeric
            WHEN "Currency" = 'USD' THEN "Invoice Total"::numeric * 0.8616
            WHEN "Currency" = 'CNY' THEN "Invoice Total"::numeric * 0.1282
            WHEN "Currency" = 'GBP' THEN "Invoice Total"::numeric * 1.16
            ELSE 0
        END) FILTER (WHERE "Discount"=0),2) AS clean_invoice
FROM transactions;
	