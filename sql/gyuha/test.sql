ALTER TABLE `report`
    ADD COLUMN `report_date` TIMESTAMP NOT NULL DEFAULT NOW();
call InsertUserSampleData();
call InsertBoardSampleData();

select *
from board;
commit;



call InsertCommentSampleData();
call ReportBoardByAllExceptUser2();
call ReportCommentByAllExceptUser2();
call InsertReportSamples();

delete
from board;
select *
from board;
select *
from user;
ALTER TABLE profile
    MODIFY COLUMN profile_filepath text;
ALTER TABLE profile
    MODIFY COLUMN profile_filename text;
ALTER TABLE `report`
    ADD COLUMN `report_date` TIMESTAMP NOT NULL DEFAULT NOW();

SELECT u.user_nickname,
       u.id                                              u_id,
       u.user_id,
       b.id                                           AS _board_id,
       b.board_title,
       date_format(b.board_created_at, '%Y년 %m월 %d일') as board_created_at,
       b.board_thumbnail,
       IF(CHAR_LENGTH(b.board_content) > 136, CONCAT(SUBSTRING(b.board_content, 1, 136), '...'),
          b.board_content)                            AS board_content,
       COALESCE(l.count, 0)                           AS like_count,
       l.user_id                                      AS like_user,
       p.img_thumbnail,
       count(*) over (partition by b.id,c.id)         as comment_count
FROM `user` u
         JOIN
     board b ON u.id = b.user_id
         LEFT JOIN
     profile p ON u.id = p.user_id
         LEFT JOIN
     (SELECT board_id,
             user_id,
             count(*) as count
      FROM `like` l) l ON b.id = l.board_id
         LEFT JOIN
     comment c ON b.id = c.board_id;

select *, count(l.board_id)
from board b
         join `like` l on b.id = l.board_id
group by board_id;

insert into `like`(`like`.board_id, `like`.user_id, `like`.`like`)
    value (1, 9, 1);

SELECT *
FROM `user` u
         JOIN
     board b ON u.id = b.user_id
         LEFT JOIN
     profile p ON u.id = p.user_id
         LEFT JOIN
     LEFT
         JOIN
     comment c ON b.id = c.board_id;

select *
from board;
select *
from user;
INSERT INTO profile(user_id, profile_title)
SELECT MAX(u.id) + 1 as max, concat(user_nickname, '님의 블로그 입니다')
FROM USER u;
delete
FROM profile
where id = 6;
INSERT INTO profile(user_id, profile_title)
SELECT MAX(u.id) as dd, concat(user_nickname, '님의 블로그 입니다')
FROM user u
where id = (SELECT MAX(id) FROM user);
SELECT *
FROM profile;
select *
from profile
where user_id = 204;
from user;
where id =204;

select *
from user;
select *
from board;
SELECT *
FROM board
WHERE user_id = 201
  AND board_public = 1
ORDER BY board_created_at DESC;


select *
from user
where id = 201;
SELECT COUNT(*)
FROM board;
SELECT COUNT(*)
FROM comment;

insert into `like`(board_id, `like`, user_id)
    value (4, 1, 1);


insert into user(user_id, user_name, user_password, user_nickname, user_phone, user_email)
values ('aaaa', 'bbbb', 'cccc', 'dddd', '1234', 'asdf@asdf');

insert into category(user_id, category_name)
values (1, 'test3');

delete
from report;

SELECT board_title                           as title,
       concat(substr(board_content, 1, 200)) as info,
       board_created_at                      as created_at
FROM board
WHERE board_state != 0
  AND board_deleted_at IS NULL;

# where board_content = #{info}

select img_thumbnail, img_original
from profile
where user_id = 205;
select *
from user
where user_id = 'zxcv1234';
select img_original, img_thumbnail
from profile
where user_id = 205;
commit;
select *
from board
where id = 1;
select *
from comment;

insert into report(user_id, board_id, report_content, report_type)
    value (5, 3, '이 새기 순 나쁜 새끼에요', '게시글');


select *
from report
limit 10,10;


select *, b.board_state
from report r
         JOIN board b ON r.board_id = b.id;


SELECT r.id
     , r.user_id
     , board_id
     , report_content
     , report_type
     , report_date
     , b.board_title
     , (CASE
            WHEN b.board_state = 0 THEN '삭제된 게시글'
            WHEN b.board_state = 1 THEN '존재하는 게시글'
            ELSE 'error'
    END) as                                  state
     , count(*) over (partition by board_id) count
FROM report r
         JOIN board b ON r.board_id = b.id
ORDER BY id desc
limit 0,10;

select *
from report;

SELECT r.user_id,
       r.board_id,
       b.board_title,
       (CASE
            WHEN b.board_state = 0 THEN '삭제된 게시글'
            WHEN b.board_state = 1 THEN '존재하는 게시글'
            ELSE 'error'
           END)          as state,
       COUNT(r.board_id) as board_count
FROM report r
         JOIN board b ON r.board_id = b.id
GROUP BY r.board_id, r.user_id, b.board_title, b.board_state
ORDER BY r.board_id;


SELECT r.id
     , r.user_id
     , board_id
     , report_content
     , report_type
     , report_date
     , b.board_title
     , (CASE
            WHEN b.board_state = 0 THEN '삭제된 게시글'
            WHEN b.board_state = 1 THEN '존재하는 게시글'
            ELSE 'error'
    END) as                                  state
     , count(*) over (partition by board_id) count
FROM report r
         JOIN board b
              ON r.board_id = b.id
ORDER BY id
limit 14,10;

SELECT r.id
     , r.user_id
     , r.board_id
     , r.report_content
     , r.report_type
     , r.report_date
     , b.board_title
     , (CASE
            WHEN b.board_state = 0 THEN '삭제된 게시글'
            WHEN b.board_state = 1 THEN '존재하는 게시글'
            ELSE 'error'
    END)                                       as state
     , count(*) over (partition by r.board_id) as count
FROM report r
         JOIN board b ON r.board_id = b.id
ORDER BY r.id desc
LIMIT 0, 10;


SELECT r.id
     , r.user_id
     , r.board_id
     , r.comment_id
     , r.report_content
     , r.report_type
     , r.report_date
     , c.comment_content
     , (CASE
            WHEN c.comment_delete = 0 THEN '삭제된 게시글'
            WHEN c.comment_delete = 1 THEN '존재하는 게시글'
            ELSE 'error'
    END)                                       as state
     , count(*) over (partition by r.board_id) as count
FROM report r
         JOIN comment c ON r.comment_id = c.id

ORDER BY r.id desc
LIMIT 0, 10;


SELECT r.id
     , r.user_id
     , r.board_id
     , r.report_content
     , r.report_type
     , r.report_date
     , b.board_title
     , (CASE
            WHEN b.board_state = 0 THEN '삭제된 게시글'
            WHEN b.board_state = 1 THEN '존재하는 게시글'
            ELSE 'error'
    END)                                       as state
     , count(*) over (partition by r.board_id) as count
FROM report r
         LEFT JOIN board b ON r.board_id = b.id
WHERE report_type = '게시글'
  and b.board_title is not null
ORDER BY r.id desc;


select count(*)
from report
where report_type = '게시글';

select *
from report
where report_type = '게시글';

SELECT *
FROM board;
SELECT *
FROM report;

SELECT r.id
     , r.user_id
     , b.id                                    as board_id
     , r.comment_id
     , b.board_title
     , r.report_content
     , r.report_type
     , r.report_date
     , c.comment_content
     , (CASE
            WHEN c.comment_state = 0 THEN '삭제된 댓글'
            WHEN c.comment_state = 1 THEN '존재하는 댓글'
            ELSE 'error'
    END)                                       as state
     , count(*) over (partition by comment_id) as count
FROM report r
         JOIN comment c ON r.comment_id = c.id
         JOIN board b ON c.board_id = b.id
ORDER BY count desc;

select *
from comment;
SELECT (SELECT CONCAT(FORMAT(COUNT(*), 0), '명') FROM user WHERE DATE(user_regdate) = CURDATE()) AS t_joined_user
     , (SELECT CONCAT(FORMAT(COUNT(*), 0), '명')
        FROM user
        WHERE DATE(user_regdate) = CURDATE() - INTERVAL 1 DAY)                                  As y_joined_user

     , (SELECT CONCAT(FORMAT(COUNT(*), 0), '개')
        FROM board
        WHERE DATE(board_created) = CURDATE())                                                  AS t_created_board
     , (SELECT CONCAT(FORMAT(COUNT(*), 0), '개')
        FROM board
        WHERE DATE(board_created) = CURDATE() - INTERVAL 1 DAY)                                 AS y_created_board

     , (SELECT CONCAT(FORMAT(COUNT(*), 0), '개')
        FROM comment
        WHERE DATE(comment_date) = CURDATE())                                                   AS t_created_comment
     , (SELECT CONCAT(FORMAT(COUNT(*), 0), '개')
        FROM comment
        WHERE DATE(comment_date) = CURDATE() - INTERVAL 1 DAY)                                  AS y_created_comment
;
ALTER TABLE comment
    CHANGE comment_delete comment_state tinyint;
select *
from board;
select *
from comment;

select *
from report
order by report_date desc;

insert into user(id, user_id, user_name, user_password, user_nickname, user_phone, user_email)
values (1, 'aaaa', 'bbbb', 'cccc', 'dddd', '1234', 'asdf@asdf');

insert into profile(user_id, profile_title, profile_content)
values (1007, '타이틀은 뭐임?', '블로그 소개글');

ALTER TABLE category
    ADD COLUMN `order` INT NOT NULL;

SELECT id                 as id,
       board_img_original as img_path,
       board_title        as title,
       board_content      as info,
       board_created_at   as created_at
FROM board
WHERE board_public = 1
  AND board_state = 1
  AND board_title like '%좀%';

SELECT id                 as id,
       board_img_original as img_path,
       board_title        as title,
       board_content      as info,
       board_created_at   as created_at
FROM board
WHERE board_public = 1
  AND board_state = 1
  and board_title like '%게시글%';

update user
set user_nickname = 'test1'
where id = 1;

select *
from user;

SELECT p.id
     , u.id             AS user_id
     , profile_title
     , profile_content
     , profile_filename as img_original
     , profile_filepath as img_thumbnail
     , user_nickname
FROM user u
         JOIN profile p ON u.id = p.user_id;

select *
from profile;

insert into category(user_id, category_name)
values (43, 'test');

select *
from category
where user_id = 43;
update board
set board_state =1;

select *
from user;
(select id
 from user
 where user_id = 'aaaa');

select *
from profile;
insert into profile(user_id, profile_title)
values (1004, 'tets2');


update profile
set profile_filename = 'aaa',
    profile_filepath ='bbb'
where user_id = (select id
                 from user
                 where user_id = 'aaaa');

select *
from profile;
select *
from user
where user_id = 'test2';

SELECT p.id
     , u.id             AS user_id
     , profile_title
     , profile_content
     , profile_filename as img_original
     , profile_filepath as img_thumbnail
     , user_nickname
     , user_email
FROM user u
         JOIN profile p ON u.id = 1004;



select *
from user
where user_id = 'test2';

update profile
set profile_filename = 'src/main/resources/static/board/2023/10/08/s_8db84965-4db0-46d5-ac3d-f1f4fbdc0422_5207453.jpg',
    profile_filepath ='src/main/resources/static/board/2023/10/08/s_8db84965-4db0-46d5-ac3d-f1f4fbdc0422_5207453.jpg'
where user_id = (select id
                 from `user`
                 where user_id = 'test2');

select id
from `user`
where user_id = 'test2';

select *
from profile;

SELECT p.id
     , u.id             AS user_id
     , profile_title
     , profile_content
     , profile_filename as img_original
     , profile_filepath as img_thumbnail
     , user_nickname
     , user_email
FROM user u
         JOIN profile p ON u.id = p.user_id
where u.id = 1004;

select *
from user
where id = 1007;
select *
from profile;

ALTER TABLE board
    ADD board_thumbnail text;



select *
from board;


SELECT u.user_nickname,
       u.id,
       b.id,
       b.board_title,
       date_format(b.board_created_at, '%Y년 %m월 %d일') as board_created_at,
       IF(CHAR_LENGTH(b.board_content) > 136, CONCAT(SUBSTRING(b.board_content, 1, 136), '...'),
          b.board_content)                            AS board_content,
       COALESCE(l.`like`, 0)                          AS like_count,
       l.user_id                                      AS like_user,
       count(*) over (partition by b.id,c.id)         as comment_count


FROM `user` u
         JOIN
     board b ON u.id = b.user_id
         LEFT JOIN
     profile p ON u.id = p.user_id
         LEFT JOIN
     `like` l ON b.id = l.board_id
         LEFT JOIN
     comment c ON b.id = c.board_id

group by u.user_nickname, u.id, b.id, b.board_title,
         IF(CHAR_LENGTH(b.board_content) > 136, CONCAT(SUBSTRING(b.board_content, 1, 136), '...'),
            b.board_content), COALESCE(l.`like`, 0), l.user_id, B.board_created_at
ORDER BY b.board_created_at

LIMIT 24,24;



select *
from board
where user_id = 43;
insert into board(user_id, board_title, board_content, board_category) value (43, '좀돼라', '시발진짜', '아아');
CREATE TABLE `user`
(
    `id`              int          NOT NULL COMMENT '고유 식별자 ID',
    `user_id`         varchar(20)  NOT NULL COMMENT '로그인 ID',
    `user_name`       varchar(45)  NOT NULL,
    `user_password`   varchar(100) NOT NULL,
    `user_nickname`   varchar(45)  NOT NULL,
    `user_phone`      varchar(13)  NOT NULL,
    `user_email`      varchar(100) NOT NULL,
    `user_created_at` timestamp    NOT NULL DEFAULT now(),
    `user_deleted_at` timestamp    NULL,
    `user_state`      tinyint      NOT NULL DEFAULT 1 COMMENT '0:탈퇴, 1:활성화',
    `user_role`       tinyint      NOT NULL DEFAULT 1 COMMENT '0:관리자, 1:회원'
);

CREATE TABLE `board`
(
    `id`               int          NOT NULL COMMENT '고유 식별자 ID',
    `user_id`          int          NOT NULL,
    `board_title`      varchar(150) NOT NULL,
    `board_content`    longtext     NOT NULL,
    `board_category`   varchar(30)  NOT NULL,
    `board_created_at` timestamp    NOT NULL DEFAULT now(),
    `board_updated_at` timestamp    NULL     DEFAULT now(),
    `board_deleted_at` timestamp    NULL,
    `board_count`      int          NULL     DEFAULT 0,
    `board_public`     tinyint      NOT NULL DEFAULT 1 COMMENT '0:비공개, 1:공개',
    `board_state`      tinyint      NOT NULL DEFAULT 1 COMMENT '0:삭제, 1:존재'
);

CREATE TABLE `comment`
(
    `id`                 int           NOT NULL COMMENT '고유 식별자 ID',
    `comment_writer`     int           NOT NULL COMMENT '고유 식별자 ID',
    `board_id`           int           NOT NULL COMMENT '고유 식별자 ID',
    `user_id`            int           NOT NULL,
    `comment_content`    varchar(3000) NOT NULL,
    `comment_created_at` timestamp     NOT NULL DEFAULT now(),
    `comment_updated_at` timestamp     NULL     DEFAULT now(),
    `comment_deleted_at` timestamp     NULL,
    `comment_public`     tinyint       NOT NULL DEFAULT 1 COMMENT '0:비공개, 1:공개',
    `comment_state`      tinyint       NOT NULL DEFAULT 1 COMMENT '0:삭제, 1:존재'
);

CREATE TABLE `report`
(
    `id`                int          NOT NULL COMMENT '고유 식별자 ID',
    `user_id`           int          NOT NULL COMMENT '고유 식별자 ID',
    `board_id`          int          NULL,
    `comment_id`        int          NULL,
    `report_content`    varchar(100) NOT NULL,
    `report_type`       varchar(10)  NOT NULL COMMENT '신고된 글 유형(게시글/댓글)',
    `report_created_at` timestamp    NOT NULL DEFAULT now()
);

CREATE TABLE `profile`
(
    `id`              int          NOT NULL COMMENT '고유 식별자 ID',
    `user_id`         int          NOT NULL COMMENT '고유 식별자 ID',
    `profile_title`   varchar(100) NOT NULL,
    `profile_content` text         NULL,
    `img_original`    text         NULL,
    `img_thumbnail`   text         NULL
);

CREATE TABLE `category`
(
    `id`            int         NOT NULL COMMENT '고유 식별자 ID',
    `user_id`       int         NOT NULL,
    `category_name` varchar(30) NOT NULL
);

CREATE TABLE `follow`
(
    `id`           int NOT NULL COMMENT '고유 식별자 ID',
    `follower_id`  int NOT NULL COMMENT '팔로우하려는 사람',
    `following_id` int NOT NULL COMMENT '팔로우 대상자'
);

CREATE TABLE `like`
(
    `board_id` int NOT NULL COMMENT '고유 식별자 ID',
    `like`     int NOT NULL DEFAULT 0 COMMENT '좋아요개수',
    `user_id`  int NOT NULL COMMENT '고유 식별자 ID'
);

CREATE TABLE `gpt`
(
    `id`       int      NOT NULL,
    `user_id`  int      NOT NULL COMMENT '고유 식별자 ID',
    `board_id` int      NOT NULL COMMENT '고유 식별자 ID',
    `request`  text     NOT NULL,
    `response` longtext NOT NULL,
    `count`    TINYINT  NOT NULL DEFAULT 3 COMMENT '0이 되면 사용불가'
);

CREATE TABLE `Untitled`
(
    `id`          int NOT NULL COMMENT '고유 식별자 ID',
    `follow_from` int NOT NULL COMMENT '팔로우 하는 회원 번호',
    `follow_to`   int NOT NULL COMMENT '팔로우 대상 회원 번호'
);

ALTER TABLE `user`
    ADD CONSTRAINT `PK_USER` PRIMARY KEY (
                                          `id`
        );

ALTER TABLE `board`
    ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
                                           `id`
        );

ALTER TABLE `comment`
    ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
                                             `id`
        );

ALTER TABLE `report`
    ADD CONSTRAINT `PK_REPORT` PRIMARY KEY (
                                            `id`
        );

ALTER TABLE `profile`
    ADD CONSTRAINT `PK_PROFILE` PRIMARY KEY (
                                             `id`
        );

ALTER TABLE `category`
    ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
                                              `id`
        );

ALTER TABLE `follow`
    ADD CONSTRAINT `PK_FOLLOW` PRIMARY KEY (
                                            `id`
        );

ALTER TABLE `gpt`
    ADD CONSTRAINT `PK_GPT` PRIMARY KEY (
                                         `id`
        );

ALTER TABLE `Untitled`
    ADD CONSTRAINT `PK_UNTITLED` PRIMARY KEY (
                                              `id`
        );

ALTER TABLE `user`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `board`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `comment`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `report`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `profile`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `category`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `follow`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `gpt`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `Untitled`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;

INSERT INTO `profile` (`user_id`, `profile_title`, `profile_content`, `img_original`, `img_thumbnail`)
VALUES (1, 'John\'s Profile', 'Hello, I am John from New York. I love hiking and photography.',
        'path/to/john/original.jpg', 'path/to/john/thumbnail.jpg'),
       (2, 'Jane\'s Profile', 'Hi, Jane here! I am a software developer and a tech enthusiast.',
        'path/to/jane/original.jpg', 'path/to/jane/thumbnail.jpg'),
       (3, 'Mike\'s Profile', 'Mike here. I am a professional chef. Cooking is my passion.',
        'path/to/mike/original.jpg', 'path/to/mike/thumbnail.jpg');

select *
from profile;

SELECT board_title                           AS title,
       concat(substr(board_content, 1, 200)) AS info,
       board_created_at                      AS created_at,
       u.user_nickname                       AS nickname
FROM board b
         LEFT JOIN user u ON b.user_id = u.id
WHERE board_state = 1
  AND board_public = 0;


SELECT *
FROM board
WHERE board_title like CONCAT('%', 'te', '%');

alter table board
    add column
        board_img_original text null;

select *
from board
where id = 199;

select *
from user
where user_id = 'userid99';

delete
from user;

CREATE TABLE `user`
(
    `id`              int          NOT NULL COMMENT '고유 식별자 ID',
    `user_id`         varchar(20)  NOT NULL COMMENT '로그인 ID',
    `user_name`       varchar(45)  NOT NULL,
    `user_password`   varchar(100) NOT NULL,
    `user_nickname`   varchar(45)  NOT NULL,
    `user_phone`      varchar(13)  NOT NULL,
    `user_email`      varchar(100) NOT NULL,
    `user_created_at` timestamp    NOT NULL DEFAULT now(),
    `user_deleted_at` timestamp    NULL,
    `user_state`      tinyint      NOT NULL DEFAULT 1 COMMENT '0:탈퇴, 1:활성화',
    `user_role`       tinyint      NOT NULL DEFAULT 1 COMMENT '0:관리자, 1:회원'
);

CREATE TABLE `board`
(
    `id`                 int          NOT NULL COMMENT '고유 식별자 ID',
    `user_id`            int          NOT NULL,
    `board_title`        varchar(150) NOT NULL,
    `board_content`      longtext     NOT NULL,
    `board_category`     varchar(30)  NOT NULL,
    `board_created_at`   timestamp    NOT NULL DEFAULT now(),
    `board_updated_at`   timestamp    NULL     DEFAULT now(),
    `board_deleted_at`   timestamp    NULL,
    `board_count`        int          NULL     DEFAULT 0,
    `board_public`       tinyint      NOT NULL DEFAULT 1 COMMENT '0:비공개, 1:공개',
    `board_state`        tinyint      NOT NULL DEFAULT 1 COMMENT '0:삭제, 1:존재',
    `board_thumbnail`    text         NULL,
    `board_img_original` text         NULL
);

CREATE TABLE `comment`
(
    `id`                 int           NOT NULL COMMENT '고유 식별자 ID',
    `board_id`           int           NOT NULL COMMENT '고유 식별자 ID',
    `comment_content`    varchar(3000) NOT NULL,
    `comment_created_at` timestamp     NOT NULL DEFAULT now(),
    `comment_updated_at` timestamp     NULL     DEFAULT now(),
    `comment_deleted_at` timestamp     NULL,
    `comment_public`     tinyint       NOT NULL DEFAULT 1 COMMENT '0:비공개, 1:공개',
    `comment_state`      tinyint       NOT NULL DEFAULT 1 COMMENT '0:삭제, 1:존재',
    `user_id`            int           NOT NULL COMMENT '고유 식별자 ID'
);

CREATE TABLE `report`
(
    `id`                int          NOT NULL COMMENT '고유 식별자 ID',
    `user_id`           int          NOT NULL COMMENT '고유 식별자 ID',
    `board_id`          int          NULL,
    `comment_id`        int          NULL,
    `report_content`    varchar(100) NOT NULL,
    `report_type`       varchar(10)  NOT NULL COMMENT '신고된 글 유형(게시글/댓글)',
    `report_created_at` timestamp    NOT NULL DEFAULT now()
);

CREATE TABLE `profile`
(
    `id`              int          NOT NULL COMMENT '고유 식별자 ID',
    `user_id`         int          NOT NULL COMMENT '고유 식별자 ID',
    `profile_title`   varchar(100) NOT NULL,
    `profile_content` text         NULL,
    `img_original`    text         NULL,
    `img_thumbnail`   text         NULL
);

CREATE TABLE `category`
(
    `id`            int         NOT NULL COMMENT '고유 식별자 ID',
    `user_id`       int         NOT NULL,
    `category_name` varchar(30) NOT NULL,
    `order`         int         NOT NULL
);

CREATE TABLE `follow`
(
    `id`           int NOT NULL COMMENT '고유 식별자 ID',
    `follower_id`  int NOT NULL COMMENT '팔로우하려는 사람',
    `following_id` int NOT NULL COMMENT '팔로우 대상자'
);

CREATE TABLE `like`
(
    `board_id` int NOT NULL COMMENT '고유 식별자 ID',
    `like`     int NOT NULL DEFAULT 0 COMMENT '좋아요개수',
    `user_id`  int NOT NULL COMMENT '고유 식별자 ID'
);

CREATE TABLE `gpt`
(
    `id`       int      NOT NULL,
    `user_id`  int      NOT NULL COMMENT '고유 식별자 ID',
    `board_id` int      NOT NULL COMMENT '고유 식별자 ID',
    `request`  text     NOT NULL,
    `response` longtext NOT NULL,
    `count`    TINYINT  NOT NULL DEFAULT 3 COMMENT '0이 되면 사용불가'
);

CREATE TABLE `Untitled`
(
    `id`          int NOT NULL COMMENT '고유 식별자 ID',
    `follow_from` int NOT NULL COMMENT '팔로우 하는 회원 번호',
    `follow_to`   int NOT NULL COMMENT '팔로우 대상 회원 번호'
);

ALTER TABLE `user`
    ADD CONSTRAINT `PK_USER` PRIMARY KEY (
                                          `id`
        );

ALTER TABLE `board`
    ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
                                           `id`
        );

ALTER TABLE `comment`
    ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
                                             `id`
        );

ALTER TABLE `report`
    ADD CONSTRAINT `PK_REPORT` PRIMARY KEY (
                                            `id`
        );

ALTER TABLE `profile`
    ADD CONSTRAINT `PK_PROFILE` PRIMARY KEY (
                                             `id`
        );

ALTER TABLE `category`
    ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
                                              `id`
        );

ALTER TABLE `follow`
    ADD CONSTRAINT `PK_FOLLOW` PRIMARY KEY (
                                            `id`
        );

ALTER TABLE `gpt`
    ADD CONSTRAINT `PK_GPT` PRIMARY KEY (
                                         `id`
        );

ALTER TABLE `Untitled`
    ADD CONSTRAINT `PK_UNTITLED` PRIMARY KEY (
                                              `id`
        );


ALTER TABLE user
    add
        column count tinyint not null default 3;

SELECT count
FROM user
WHERE user_id = 'zxcv1234';

UPDATE user
set count = (SELECT count FROM user) - 1
where user_id = 'zxcv1234';


UPDATE user
set count = 3
where user_id = 'zxcv1234';

SELECT r.id
     , r.user_id
     , r.board_id
     , r.report_content
     , r.report_type
     , r.report_created_at
     , b.board_title
     , u.user_id
     , (CASE
            WHEN b.board_state = 0 THEN '삭제된 게시글'
            WHEN b.board_state = 1 THEN '존재하는 게시글'
            ELSE 'error'
    END)                                       as state
     , count(*) over (partition by r.board_id) as count
FROM report r
         JOIN board b ON r.board_id = b.id
         JOIN user u ON b.user_id = u.id;

select *
from user
order by id desc;

alter table gpt
    drop board_id;
commit;

UPDATE user
set count = count - 1
where user_id = 'zxcv1234';

update user
set user_role = 0
where user_id = 'zxcv1234';

SELECT u.id,
       u.user_id,
       u.user_email,
       u.user_created_at,
       COALESCE(COUNT(b.id), 0) as board_count,
       COALESCE(COUNT(c.id), 0) as comment_count
FROM user u
         LEFT JOIN board b ON u.id = b.user_id
         LEFT JOIN comment c on c.user_id = u.id
GROUP BY u.id, u.user_id, u.user_email, u.user_created_at;

SELECT u.id,
       u.user_id,
       u.user_nickname,
       u.user_email,
       date_format(u.user_created_at, '%Y년 %m월 %d일') as user_created_at,
       COALESCE(COUNT(DISTINCT b.id), 0)             as board_count,
       COALESCE(COUNT(DISTINCT c.id), 0)             as comment_count
FROM user u
         LEFT JOIN board b ON u.id = b.user_id
         LEFT JOIN comment c on c.user_id = u.id
GROUP BY u.id, u.user_id, u.user_nickname, u.user_email, u.user_created_at
ORDER BY u.user_created_at
LIMIT 0,5;

select user_role from user
where id= 1;



