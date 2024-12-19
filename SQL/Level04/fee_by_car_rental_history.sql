SELECT 
    h.HISTORY_ID,
    FLOOR(
        c.DAILY_FEE * (DATEDIFF(h.END_DATE, h.START_DATE) + 1) *
        (1 - IFNULL(
            (SELECT DISCOUNT_RATE / 100.0
             FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
             WHERE CAR_TYPE = c.CAR_TYPE
             AND (
                 (DURATION_TYPE = '7일 이상' AND DATEDIFF(h.END_DATE, h.START_DATE) + 1 >= 7 AND DATEDIFF(h.END_DATE, h.START_DATE) + 1 < 30)
                 OR (DURATION_TYPE = '30일 이상' AND DATEDIFF(h.END_DATE, h.START_DATE) + 1 >= 30 AND DATEDIFF(h.END_DATE, h.START_DATE) + 1 < 90)
                 OR (DURATION_TYPE = '90일 이상' AND DATEDIFF(h.END_DATE, h.START_DATE) + 1 >= 90)
             )
             ORDER BY DISCOUNT_RATE DESC
             LIMIT 1
            ), 0)
        )
    ) AS FEE
FROM CAR_RENTAL_COMPANY_CAR c
JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY h ON c.CAR_ID = h.CAR_ID
WHERE c.CAR_TYPE = '트럭'
ORDER BY FEE DESC, h.HISTORY_ID DESC;
