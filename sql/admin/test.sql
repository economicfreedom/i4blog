ALTER TABLE `report`
ADD COLUMN `report_date` TIMESTAMP NOT NULL DEFAULT NOW();
call InsertUserSampleData();
call InsertBoardSampleData();
call InsertCommentSampleData();
call ReportBoardByAllExceptUser2();
call ReportCommentByAllExceptUser2();
commit ;
select * from board;
select * from comment;

insert into report(user_id, board_id, report_content, report_type)
value (5,3,'이 새기 순 나쁜 새끼에요','게시글');


select * from report
limit 10,10;


select *,b.board_state from report r
JOIN board b ON r.board_id = b.id;


SELECT r.id
       ,r.user_id
       ,board_id
       ,report_content
       ,report_type
       ,report_date
       ,b.board_title
       ,(CASE
           WHEN b.board_state = 0 THEN '삭제된 게시글'
           WHEN b.board_state =1 THEN '존재하는 게시글'
           ELSE 'error'
        END   ) as state,
    count(*) over (partition by board_id)count
FROM report r
JOIN board b ON r.board_id = b.id
ORDER BY  id desc
limit 0,10;

select * from report;

SELECT
    r.user_id,
    r.board_id,
    b.board_title,
    (CASE
        WHEN b.board_state = 0 THEN '삭제된 게시글'
        WHEN b.board_state = 1 THEN '존재하는 게시글'
        ELSE 'error'
     END) as state,
    COUNT(r.board_id) as board_count
FROM report r
JOIN board b ON r.board_id = b.id
GROUP BY r.board_id, r.user_id, b.board_title, b.board_state
ORDER BY r.board_id;
