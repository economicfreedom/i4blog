DELIMITER //

CREATE PROCEDURE InsertCommentSampleData()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 100 DO
        INSERT INTO `comment` (`comment_writer`, `board_id`, `user_id`, `comment_content`)
        VALUES (
            i,
            i,
            i,
            CONCAT('이것은 ', i, '번째 게시글에 대한 댓글입니다.')
        );
        SET i = i + 1;
    END WHILE;

END //

DELIMITER ;