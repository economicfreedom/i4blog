CREATE TABLE `user` (
	`id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`user_id`	varchar(20)	NOT NULL	COMMENT '로그인 ID',
	`user_name`	varchar(45)	NOT NULL,
	`user_password`	varchar(100)	NOT NULL,
	`user_nickname`	varchar(45)	NOT NULL,
	`user_phone`	varchar(13)	NOT NULL,
	`user_email`	varchar(100)	NOT NULL,
	`user_created_at`	timestamp	NOT NULL	DEFAULT now(),
	`user_deleted_at`	timestamp	NULL,
	`user_state`	tinyint	NOT NULL	DEFAULT 1	COMMENT '0:탈퇴, 1:활성화',
	`user_role`	tinyint	NOT NULL	DEFAULT 1	COMMENT '0:관리자, 1:회원'
);

CREATE TABLE `board` (
	`id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`user_id`	int	NOT NULL,
	`board_title`	varchar(150)	NOT NULL,
	`board_content`	longtext	NOT NULL,
	`board_category`	varchar(30)	NOT NULL,
	`board_created_at`	timestamp	NOT NULL	DEFAULT now(),
	`board_updated_at`	timestamp	NULL	DEFAULT now(),
	`board_deleted_at`	timestamp	NULL,
	`board_count`	int	NULL	DEFAULT 0,
	`board_public`	tinyint	NOT NULL	DEFAULT 1	COMMENT '0:비공개, 1:공개',
	`board_state`	tinyint	NOT NULL	DEFAULT 1	COMMENT '0:삭제, 1:존재',
	`board_thumbnail`	text	NULL,
	`board_img_original`	text	NULL
);

CREATE TABLE `comment` (
	`id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`comment_writer`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`board_id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`user_id`	int	NOT NULL,
	`comment_content`	varchar(3000)	NOT NULL,
	`comment_created_at`	timestamp	NOT NULL	DEFAULT now(),
	`comment_updated_at`	timestamp	NULL	DEFAULT now(),
	`comment_deleted_at`	timestamp	NULL,
	`comment_public`	tinyint	NOT NULL	DEFAULT 1	COMMENT '0:비공개, 1:공개',
	`comment_state`	tinyint	NOT NULL	DEFAULT 1	COMMENT '0:삭제, 1:존재'
);

CREATE TABLE `report` (
	`id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`user_id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`board_id`	int	NULL,
	`comment_id`	int	NULL,
	`report_content`	varchar(100)	NOT NULL,
	`report_type`	varchar(10)	NOT NULL	COMMENT '신고된 글 유형(게시글/댓글)',
	`report_created_at`	timestamp	NOT NULL	DEFAULT now()
);

CREATE TABLE `profile` (
	`id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`user_id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`profile_title`	varchar(100)	NOT NULL,
	`profile_content`	text	NULL,
	`img_original`	text	NULL,
	`img_thumbnail`	text	NULL
);

CREATE TABLE `category` (
	`id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`user_id`	int	NOT NULL,
	`category_name`	varchar(30)	NOT NULL
);

CREATE TABLE `follow` (
	`id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`follower_id`	int	NOT NULL	COMMENT '팔로우하려는 사람',
	`following_id`	int	NOT NULL	COMMENT '팔로우 대상자'
);

CREATE TABLE `like` (
	`board_id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`like`	int	NOT NULL	DEFAULT 0	COMMENT '좋아요개수',
	`user_id`	int	NOT NULL	COMMENT '고유 식별자 ID'
);

CREATE TABLE `gpt` (
	`id`	int	NOT NULL,
	`user_id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`board_id`	int	NOT NULL	COMMENT '고유 식별자 ID',
	`request`	text	NOT NULL,
	`response`	longtext	NOT NULL,
	`count`	TINYINT	NOT NULL	DEFAULT 3	COMMENT '0이 되면 사용불가'
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`id`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`id`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`id`
);

ALTER TABLE `report` ADD CONSTRAINT `PK_REPORT` PRIMARY KEY (
	`id`
);

ALTER TABLE `profile` ADD CONSTRAINT `PK_PROFILE` PRIMARY KEY (
	`id`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`id`
);

ALTER TABLE `follow` ADD CONSTRAINT `PK_FOLLOW` PRIMARY KEY (
	`id`
);

ALTER TABLE `gpt` ADD CONSTRAINT `PK_GPT` PRIMARY KEY (
	`id`
);

ALTER TABLE `user` MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `board` MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `comment` MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `report` MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `profile` MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `category` MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `follow` MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `gpt` MODIFY `id` bigint NOT NULL AUTO_INCREMENT;