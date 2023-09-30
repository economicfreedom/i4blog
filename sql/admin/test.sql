ALTER TABLE `report`
    ADD COLUMN `report_date` TIMESTAMP NOT NULL DEFAULT NOW();
call InsertUserSampleData();
call InsertBoardSampleData();
call InsertCommentSampleData();
call ReportBoardByAllExceptUser2();
call ReportCommentByAllExceptUser2();
call InsertReportSamples();

ALTER TABLE `report`
    ADD COLUMN `report_date` TIMESTAMP NOT NULL DEFAULT NOW();


SELECT COUNT(*) FROM board;
SELECT COUNT(*) FROM comment;

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
WHERE report_type = '게시글' and b.board_title is not null
ORDER BY r.id desc;


select count(*)
from report
where report_type = '게시글';

select * from report
where report_type='게시글';

SELECT * FROM board;
SELECT * FROM report;