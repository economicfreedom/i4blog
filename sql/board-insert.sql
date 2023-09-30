DELIMITER //

CREATE PROCEDURE InsertBoardSampleData()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 100 DO
        INSERT INTO `board` (`user_id`, `board_title`, `board_content`, `board_category`)
        VALUES (
            i,
            CONCAT('게시글 제목', i),
            CONCAT('게시글 내용입니다. 이것은 예시 ', i, '번째 게시글의 내용입니다.'),
            IF(MOD(i,2) = 0, '카테고리1', '카테고리2') -- 예시로 2개의 카테고리를 교대로 적용
        );
        SET i = i + 1;
    END WHILE;

END //

DELIMITER ;