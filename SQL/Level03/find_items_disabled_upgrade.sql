WITH UPGRADE_ITEM AS (
    SELECT II.ITEM_ID
    FROM ITEM_INFO II
    JOIN ITEM_TREE IT
    ON II.ITEM_ID = IT.PARENT_ITEM_ID
)
SELECT II.ITEM_ID, II.ITEM_NAME, II.RARITY
FROM ITEM_INFO II
LEFT JOIN UPGRADE_ITEM UI
ON II.ITEM_ID = UI.ITEM_ID
WHERE UI.ITEM_ID IS NULL
ORDER BY 1 DESC;

