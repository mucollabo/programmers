WITH BEST_FISH AS (
    SELECT FISH_TYPE, AVG(COALESCE(LENGTH, 10))
    FROM FISH_INFO
    GROUP BY FISH_TYPE
    HAVING AVG(COALESCE(LENGTH, 10)) >= 33
)
SELECT COUNT(*) FISH_COUNT, MAX(FI.LENGTH) MAX_LENGTH, FI.FISH_TYPE
FROM FISH_INFO FI
JOIN BEST_FISH BF
ON FI.FISH_TYPE = BF.FISH_TYPE
GROUP BY FI.FISH_TYPE
ORDER BY FI.FISH_TYPE;
