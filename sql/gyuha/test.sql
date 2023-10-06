ALTER TABLE `report`
    ADD COLUMN `report_date` TIMESTAMP NOT NULL DEFAULT NOW();
call InsertUserSampleData();
call InsertBoardSampleData();
call InsertCommentSampleData();
call ReportBoardByAllExceptUser2();
call ReportCommentByAllExceptUser2();
call InsertReportSamples();

ALTER TABLE profile
    MODIFY COLUMN profile_filepath text;
ALTER TABLE profile
    MODIFY COLUMN profile_filename text;
ALTER TABLE `report`
    ADD COLUMN `report_date` TIMESTAMP NOT NULL DEFAULT NOW();


SELECT COUNT(*)
FROM board;
SELECT COUNT(*)
FROM comment;


insert into user(user_id, user_name, user_password, user_nickname, user_phone, user_email)
values ('aaaa', 'bbbb', 'cccc', 'dddd', '1234', 'asdf@asdf');

insert into category(user_id, category_name)
values (1, 'test3');

delete
from report;

commit;
select *
from board;
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
SELECT (SELECT CONCAT(FORMAT(COUNT(*), 0), '명') FROM user WHERE DATE(user_regdate) = CURDATE())                     AS t_joined_user
     , (SELECT CONCAT(FORMAT(COUNT(*), 0), '명')
        FROM user
        WHERE DATE(user_regdate) = CURDATE() - INTERVAL 1 DAY)                                                      As y_joined_user

     , (SELECT CONCAT(FORMAT(COUNT(*), 0), '개')
        FROM board
        WHERE DATE(board_created) = CURDATE())                                                                      AS t_created_board
     , (SELECT CONCAT(FORMAT(COUNT(*), 0), '개')
        FROM board
        WHERE DATE(board_created) = CURDATE() - INTERVAL 1 DAY)                                                     AS y_created_board

     , (SELECT CONCAT(FORMAT(COUNT(*), 0), '개')
        FROM comment
        WHERE DATE(comment_date) = CURDATE())                                                                       AS t_created_comment
     , (SELECT CONCAT(FORMAT(COUNT(*), 0), '개')
        FROM comment
        WHERE DATE(comment_date) = CURDATE() - INTERVAL 1 DAY)                                                      AS y_created_comment
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
values (1, '타이틀은 뭐임?', '블로그 소개글');

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

select * from profile;
insert into profile(user_id,profile_title)
values (43,'tets2');


update profile set profile_filename = 'aaa' , profile_filepath ='bbb'
where user_id = (select id
 from user
 where user_id = 'aaaa');

select * from profile;
select * from user
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
                 JOIN profile p ON u.id = 43;





