CREATE PROCEDURE ReportBoardByAllExceptUser2()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE curr_user_id INT;
    DECLARE cur CURSOR FOR SELECT id FROM `user` WHERE id <> 2;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO curr_user_id;

        IF done THEN
            LEAVE read_loop;
        END IF;

        INSERT INTO `report` (`user_id`, `board_id`, `report_content`, `report_type`)
        VALUES (curr_user_id, 2, '이 게시글을 신고합니다.', '게시글');
    END LOOP;

    CLOSE cur;
END;