DELIMITER //

CREATE PROCEDURE InsertUserSampleData()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 100 DO
        INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_nickname`, `user_phone`, `user_email`)
        VALUES (
            CONCAT('userid', i), -- user_id
            CONCAT('홍길동', i), -- user_name
            CONCAT('password', i), -- user_password
            CONCAT('임시데이터-', i), -- user_nickname
            CONCAT('010-0000-', LPAD(i, 4, '0')), -- user_phone
            CONCAT('user', i, '@email.com') -- user_email
        );
        SET i = i + 1;
    END WHILE;

END //

DELIMITER ;


