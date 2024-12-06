SELECT A.APNT_NO, P.PT_NAME, A.PT_NO, A.MCDP_CD, D.DR_NAME, A.APNT_YMD
FROM APPOINTMENT A
JOIN PATIENT P
ON P.PT_NO = A.PT_NO
JOIN DOCTOR D
ON D.DR_ID = A.MDDR_ID
WHERE DATE_FORMAT(A.APNT_YMD, '%Y-%m-%d') = '2022-04-13'
    AND A.APNT_CNCL_YN = 'N' AND A.MCDP_CD = 'CS'
ORDER BY 6;

