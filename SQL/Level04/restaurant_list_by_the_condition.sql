-- 코드를 입력하세요
SELECT MP.MEMBER_NAME, RR1.REVIEW_TEXT, DATE_FORMAT(RR1.REVIEW_DATE, '%Y-%m-%d') REVIEW_DATE
FROM REST_REVIEW RR1
JOIN (
      SELECT MEMBER_ID
      FROM REST_REVIEW
      GROUP BY MEMBER_ID
      HAVING COUNT(REVIEW_TEXT) = (
        SELECT MAX(REVIEW_COUNT)
        FROM (
            SELECT COUNT(REVIEW_TEXT) REVIEW_COUNT
            FROM REST_REVIEW
            GROUP BY MEMBER_ID
        ) SQ
      )
) MAX_REVIEW_IDS
ON RR1.MEMBER_ID = MAX_REVIEW_IDS.MEMBER_ID
JOIN MEMBER_PROFILE MP
ON RR1.MEMBER_ID = MP.MEMBER_ID
ORDER BY 3, 2;

