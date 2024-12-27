WITH RECURSIVE GenerationTree AS (
    -- 1. 세대 계산: 최초 개체의 세대를 0으로 설정
    SELECT
        ID,
        PARENT_ID,
        1 AS GENERATION
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
    UNION ALL
    -- 2. 부모의 세대를 기반으로 자식의 세대를 계산
    SELECT
        e.ID,
        e.PARENT_ID,
        gt.GENERATION + 1
    FROM ECOLI_DATA e
    JOIN GenerationTree gt ON e.PARENT_ID = gt.ID
),
LeafCount AS (
    -- 3. 자식이 없는 개체를 식별
    SELECT
        gt.GENERATION,
        gt.ID
    FROM GenerationTree gt
    LEFT JOIN ECOLI_DATA e ON gt.ID = e.PARENT_ID
    WHERE e.PARENT_ID IS NULL
)
-- 4. 세대별 자식이 없는 개체의 수를 계산하고 정렬
SELECT
    COUNT(*) AS COUNT,
    GENERATION
FROM LeafCount
GROUP BY GENERATION
ORDER BY GENERATION;

