-- 코드를 입력하세요
SELECT B.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY, SUM(BS.SALES * B.PRICE) TOTAL_SALES
FROM BOOK_SALES BS
JOIN BOOK B
ON BS.BOOK_ID = B.BOOK_ID
JOIN AUTHOR A
ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-01'
GROUP BY 1, 2, 3
ORDER BY 1, 3 DESC;

