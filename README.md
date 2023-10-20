# SpringBoot Project - i4blog
![I4-B logo 2](https://github.com/economicfreedom/i4blog/assets/113487440/da74ee20-a8d6-4592-808d-11f0ca93316a)


## 📝 프로젝트 개요

정보, 경험, 의견 등을 기록하고 공유, 전달하기 위한 블로그 사이트

### 개발 기간
- 2023.10.04 - 2023.10.18

### 팀 소개
- 모든 팀원이 풀스택으로 개발에 참여했으며, 주 포지션은 아래와 같습니다.

|Name|최규하|김민환|박용세|최예정|
|------|---|---|---|---|
|Position|관리자/메인 페이지,<br>프로필 관리 기능|댓글,<br>신고 기능|로그인/회원가입,<br>카테고리 관리|게시글, 좋아요,<br>신고 기능|

### 배포 주소
13.125.243.145:8080

## 🛠 기술 스택
### ✨ Front-End
- bootstrap : 4.6.2
- HTML
- CSS3
- JavaScript
- JQuery : 3.5.1
- summernote : 0.8.18

### 💻 Back-End
- spring boot : 2.7.15
- MySQL : 8.0.21 (로컬), 8.0.34
- jdk : Oracle 11 (로컬), Amazon 11
- Tomcat : 9
- lombok
- MyBatis
- JSP
- ubuntu : 20.04.xx
- gpt : gpt-3.5-turbo-0301
- aws lightsail


## 📋 ERD & 테이블 명세서
![image](https://github.com/economicfreedom/i4blog/assets/89882448/dc0c4ffd-1740-4149-8563-bdc1b769111c)


## 🖼 SiteMap
![SiteMap (1)](https://github.com/economicfreedom/i4blog/assets/113487440/d54d6627-7d75-4a7d-be3e-9a7646145c6e)
![siteMap (2)](https://github.com/economicfreedom/i4blog/assets/113487440/3766b82b-64e4-4994-91b8-fe6391d4ef6f)


## 🙋‍♂️ 주요 기능 - 사용자
### 회원가입
- 아이디 중복 확인
- 비밀번호 확인
- Validation 처리
- Email 인증
  
### 로그인
- 일반 로그인
- 아이디/비밀번호 찾기

### 회원 정보
- 프로필 사진, 블로그 소개 작성
- 카테고리 추가, 삭제

### 블로그
- 게시글 CRUD
- 댓글 CRUD
- 게시글 작성 시 GPT 이용
- 좋아요 수에 기반한 인기 게시글 조회
- 글 신고 기능
- 검색 및 페이징 처리

사진 추가하기

## 👩‍🔧 주요 기능 - 관리자
- 대시보드 조회
- 그래프를 통한 블로그 동향 파악
- 신고 게시글, 댓글 제재
- 관리자 권한 부여

사진 추가하기

