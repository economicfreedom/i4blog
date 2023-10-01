SELECT
    CURDATE() - INTERVAL days.num DAY AS reg_date,
    IFNULL(COUNT(user_regdate), 0) as count
FROM
    (SELECT 0 AS num
     UNION ALL SELECT 1
     UNION ALL SELECT 2
     UNION ALL SELECT 3
     UNION ALL SELECT 4
     UNION ALL SELECT 5
     UNION ALL SELECT 6) days
LEFT JOIN
    USER ON DATE(user_regdate) = CURDATE() - INTERVAL days.num DAY
GROUP BY
    days.num
ORDER BY
    days.num DESC;

SELECT
    CURDATE() - INTERVAL days.num DAY AS reg_date,
    IFNULL(COUNT(board_created), 0) as count
FROM
    (SELECT 0 AS num
     UNION ALL SELECT 1
     UNION ALL SELECT 2
     UNION ALL SELECT 3
     UNION ALL SELECT 4
     UNION ALL SELECT 5
     UNION ALL SELECT 6) days
LEFT JOIN
    board ON DATE(board_created) = CURDATE() - INTERVAL days.num DAY
GROUP BY
    days.num
ORDER BY
    days.num DESC;

SELECT
    CURDATE() - INTERVAL days.num DAY AS reg_date,
    IFNULL(COUNT(comment_date), 0) as count
FROM
    (SELECT 0 AS num
     UNION ALL SELECT 1
     UNION ALL SELECT 2
     UNION ALL SELECT 3
     UNION ALL SELECT 4
     UNION ALL SELECT 5
     UNION ALL SELECT 6) days
LEFT JOIN
    comment ON DATE(comment_date) = CURDATE() - INTERVAL days.num DAY
GROUP BY
    days.num
ORDER BY
    days.num DESC;

SELECT
    CURDATE() - INTERVAL days.num DAY AS reg_date,
    IFNULL(COUNT(report_date), 0) as count
FROM
    (SELECT 0 AS num
     UNION ALL SELECT 1
     UNION ALL SELECT 2
     UNION ALL SELECT 3
     UNION ALL SELECT 4
     UNION ALL SELECT 5
     UNION ALL SELECT 6) days
LEFT JOIN
    report ON DATE(report_date) = CURDATE() - INTERVAL days.num DAY
GROUP BY
    days.num
ORDER BY
    days.num DESC;