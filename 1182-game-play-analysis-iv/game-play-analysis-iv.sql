# Write your MySQL query statement below
WITH FirstLogin AS
(
    SELECT
        player_id,
        event_date,
        ROW_NUMBER() OVER (
            PARTITION BY player_id
            ORDER BY event_date
        ) AS rn
    FROM Activity
)

SELECT
    ROUND(
        COUNT(DISTINCT a.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM FirstLogin f
JOIN Activity a
    ON f.player_id = a.player_id
WHERE
    f.rn = 1
    AND DATEDIFF(a.event_date, f.event_date) = 1;