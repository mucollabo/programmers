-- 코드를 입력하세요
SELECT UGU.USER_ID, 
       UGU.NICKNAME, 
       CONCAT(COALESCE(CITY, ''), ' ', 
              COALESCE(STREET_ADDRESS1, ''), ' ', 
              COALESCE(STREET_ADDRESS2, '')
             ) '전체주소', 
       CONCAT(SUBSTR(COALESCE(TLNO, ''), 1, 3), '-',
              SUBSTR(COALESCE(TLNO, ''), 4, 4), '-',
              SUBSTR(COALESCE(TLNO, ''), 8, 4)
              ) '전화번호'
FROM USED_GOODS_BOARD UGB
JOIN USED_GOODS_USER UGU
ON UGB.WRITER_ID = UGU.USER_ID
GROUP BY UGB.WRITER_ID
HAVING COUNT(WRITER_ID) > 2
ORDER BY 1 DESC;

