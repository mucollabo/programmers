-- 코드를 작성해주세요
# SELECT 
#     CASE
#         WHEN (D.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME IN ('JavaScript', 'React', 'Vue'))) != 0
#              AND (D.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'Python')) != 0 THEN 'A'
#         WHEN (D.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'C#')) != 0 THEN 'B'
#         WHEN (D.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME IN ('JavaScript', 'React', 'Vue'))) != 0 THEN 'C'
#         ELSE NULL
#     END AS GRADE,
#     D.ID,
#     D.EMAIL
# FROM DEVELOPERS D
# WHERE (D.SKILLCODE & (
#     (SELECT CODE FROM SKILLCODES WHERE NAME IN ('JavaScript', 'React', 'Vue'))
#     | (SELECT CODE FROM SKILLCODES WHERE NAME = 'Python')
#     | (SELECT CODE FROM SKILLCODES WHERE NAME = 'C#')
# )) != 0
# ORDER BY GRADE, ID;

# SELECT
#     CASE
#         WHEN (d.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'JavaScript' OR NAME = 'React' OR NAME = 'Vue')) != 0
#              AND (d.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'Python')) != 0 THEN 'A'
#         WHEN (d.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'C#')) != 0 THEN 'B'
#         WHEN (d.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'JavaScript' OR NAME = 'React' OR NAME = 'Vue')) != 0 THEN 'C'
#         ELSE NULL
#     END AS GRADE,
#     d.ID,
#     d.EMAIL
# FROM DEVELOPERS d
# WHERE (d.SKILL_CODE & (
#     (SELECT CODE FROM SKILLCODES WHERE NAME = 'JavaScript' OR NAME = 'React' OR NAME = 'Vue')
#     | (SELECT CODE FROM SKILLCODES WHERE NAME = 'Python')
#     | (SELECT CODE FROM SKILLCODES WHERE NAME = 'C#')
# )) != 0
# ORDER BY GRADE ASC, ID ASC;

# SELECT
#     CASE
#         WHEN (d.SKILL_CODE & (SELECT SUM(CODE) FROM SKILLCODES WHERE NAME IN ('JavaScript', 'React', 'Vue'))) != 0
#              AND (d.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'Python')) != 0 THEN 'A'
#         WHEN (d.SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'C#')) != 0 THEN 'B'
#         WHEN (d.SKILL_CODE & (SELECT SUM(CODE) FROM SKILLCODES WHERE NAME IN ('JavaScript', 'React', 'Vue'))) != 0 THEN 'C'
#         ELSE NULL
#     END AS GRADE,
#     d.ID,
#     d.EMAIL
# FROM DEVELOPERS d
# WHERE (d.SKILL_CODE & (
#     (SELECT SUM(CODE) FROM SKILLCODES WHERE NAME IN ('JavaScript', 'React', 'Vue'))
#     | (SELECT CODE FROM SKILLCODES WHERE NAME = 'Python')
#     | (SELECT CODE FROM SKILLCODES WHERE NAME = 'C#')
# )) != 0
# ORDER BY GRADE ASC, ID ASC;

# SELECT
#     CASE
#         WHEN (d.SKILL_CODE & (
#             SELECT BIT_OR(CODE) FROM SKILLCODES WHERE NAME IN ('JavaScript', 'React', 'Vue')
#         )) != 0 AND (d.SKILL_CODE & (
#             SELECT CODE FROM SKILLCODES WHERE NAME = 'Python'
#         )) != 0 THEN 'A'
#         WHEN (d.SKILL_CODE & (
#             SELECT CODE FROM SKILLCODES WHERE NAME = 'C#'
#         )) != 0 THEN 'B'
#         WHEN (d.SKILL_CODE & (
#             SELECT BIT_OR(CODE) FROM SKILLCODES WHERE NAME IN ('JavaScript', 'React', 'Vue')
#         )) != 0 THEN 'C'
#         ELSE NULL
#     END AS GRADE,
#     d.ID,
#     d.EMAIL
# FROM DEVELOPERS d
# WHERE (d.SKILL_CODE & (
#     SELECT BIT_OR(CODE) FROM SKILLCODES WHERE NAME IN ('JavaScript', 'React', 'Vue', 'Python', 'C#')
# )) != 0
# ORDER BY GRADE ASC, ID ASC;

# WITH SkillCodes AS (
#     SELECT
#         'A' AS Grade,
#         BIT_OR(CODE) AS Code
#     FROM SKILLCODES
#     WHERE NAME IN ('JavaScript', 'React', 'Vue', 'Python') -- Front End + Python
#     UNION ALL
#     SELECT
#         'B' AS Grade,
#         BIT_OR(CODE) AS Code
#     FROM SKILLCODES
#     WHERE NAME = 'C#' -- C#
#     UNION ALL
#     SELECT
#         'C' AS Grade,
#         BIT_OR(CODE) AS Code
#     FROM SKILLCODES
#     WHERE NAME IN ('JavaScript', 'React', 'Vue') -- Front End Only
# ),
# DevelopersGrades AS (
#     SELECT
#         CASE
#             WHEN (d.SKILL_CODE & (SELECT Code FROM SkillCodes WHERE Grade = 'A')) = (SELECT Code FROM SkillCodes WHERE Grade = 'A') THEN 'A'
#             WHEN (d.SKILL_CODE & (SELECT Code FROM SkillCodes WHERE Grade = 'B')) != 0 THEN 'B'
#             WHEN (d.SKILL_CODE & (SELECT Code FROM SkillCodes WHERE Grade = 'C')) != 0 THEN 'C'
#             ELSE NULL
#         END AS GRADE,
#         d.ID,
#         d.EMAIL
#     FROM DEVELOPERS d
# )
# SELECT *
# FROM DevelopersGrades
# WHERE GRADE IS NOT NULL
# ORDER BY GRADE ASC, ID ASC;

WITH main AS (
    SELECT
        d.ID,
        d.EMAIL,
        group_concat(s.NAME) AS NAME,
        group_concat(s.CATEGORY) AS CATEGORY
    FROM DEVELOPERS d
    JOIN SKILLCODES s ON d.SKILL_CODE & s.CODE = s.CODE
    GROUP BY d.ID, d.EMAIL
)
SELECT *
FROM (SELECT
     CASE
        WHEN NAME LIKE '%Python%' AND CATEGORY LIKE '%Front End%' THEN 'A'
        WHEN NAME LIKE '%C#%' THEN 'B'
        WHEN CATEGORY LIKE '%Front End%' THEN 'C'
     END AS GRADE,
     ID,
     EMAIL
FROM main) A
WHERE GRADE IS NOT NULL
ORDER BY GRADE, ID;

