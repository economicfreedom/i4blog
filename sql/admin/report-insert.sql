DELIMITER //

CREATE PROCEDURE InsertReportSamples()
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE random_board_id INT;
  DECLARE random_comment_id INT;

  WHILE i <= 1000 DO
    SET random_board_id = FLOOR(1 + RAND() * 1000);
    SET random_comment_id = FLOOR(1 + RAND() * 1000);

    IF MOD(i, 2) = 0 THEN
      INSERT INTO report (user_id, board_id, report_content, report_type)
      VALUES (FLOOR(1 + RAND() * 100), random_board_id, CONCAT('Report Content ', i), '게시글');
    ELSE
      INSERT INTO report (user_id, comment_id, report_content, report_type)
      VALUES (FLOOR(1 + RAND() * 100), random_comment_id, CONCAT('Report Content ', i), '댓글');
    END IF;

    SET i = i + 1;
  END WHILE;
END //

DELIMITER ;
