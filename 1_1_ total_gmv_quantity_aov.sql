SELECT
	ROUND (SUM(
		CASE
			WHEN "Currency" = 'EUR' THEN "Invoice Total"::numeric
			WHEN "Currency" = 'USD' THEN "Invoice Total"::numeric*0.8616
			WHEN "Currency" = 'CNY' THEN "Invoice Total"::numeric*0.1282
			WHEN "Currency" = 'GBP' THEN "Invoice Total"::numeric*1.16
		END),
	2) AS global_gmv_eur,
	SUM ("Quantity") AS total_quantity,
	ROUND (AVG (
		CASE
			WHEN "Currency" = 'EUR' THEN "Invoice Total"::numeric
			WHEN "Currency" = 'USD' THEN "Invoice Total"::numeric*0.8616
			WHEN "Currency" = 'CNY' THEN "Invoice Total"::numeric*0.1282
			WHEN "Currency" = 'GBP' THEN "Invoice Total"::numeric*1.16
		END),
	2) AS aov_eur,
	MIN("Date")::timestamp AS start_date,
	MAX("Date")::timestamp AS end_date
FROM transactions;
		