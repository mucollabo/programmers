WITH FAVORITE_CAR AS (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY CAR_ID
    HAVING COUNT(HISTORY_ID) >= 5
)
SELECT EXTRACT(MONTH FROM CRH.START_DATE) AS MONTH,
    CRH.CAR_ID, 
    COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY CRH
JOIN FAVORITE_CAR FC
ON CRH.CAR_ID = FC.CAR_ID
WHERE CRH.START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY EXTRACT(MONTH FROM CRH.START_DATE), CRH.CAR_ID
ORDER BY MONTH ASC, CRH.CAR_ID DESC;
