

--이름 연략처 낫널
--연령은 체크 제약 조건 1세부터 130세

-- <문제1>
CREATE table customers(
CUSTOMER_ID NUMBER(5),
CUSTOMER_NAME VARCHAR2(10) not null,
age NUMBER(5) not null,
PHONE VARCHAR2(30),
CONSTRAINT pk_customers_CUSTOMER_ID PRIMARY key(CUSTOMER_ID),
CONSTRAINT ck_customers_age CHECK (age BETWEEN 1 and 130),
CONSTRAINT Uk_customers_PHONE UNIQUE (﻿PHONE)
);

INSERT INTO customers VALUES ('101', 'kdj', 65, '010-1234-5678');
INSERT INTO customers VALUES ('102', 'kdd', 72, '010-9876-5432');
INSERT INTO customers VALUES ('103', 'kdf', 61, '010-5555-4444');
INSERT INTO customers VALUES ('104', 'kdk', 68, '010-2222-3333');

select * from customers;


-- <문제2>
CREATE table ORDERS(
ORDER_ID  NUMBER(10),
CUSTOMER_ID NUMBER(10),
PRODUCT_NAME VARCHAR2(50) not null,
PRICE NUMBER not null,
CONSTRAINT pk_ORDERS_order_ID PRIMARY key(ORDER_ID),
CONSTRAINT fk_ORDERS_customers_CUSTOMER_ID FOREIGN key(CUSTOMER_ID) REFERENCES customers(CUSTOMER_ID) on DELETE set NULL
);

drop table ORDERS;
INSERT INTO ORDERS VALUES ('1', 101,'갤럭시 S24', 1150000);
INSERT INTO ORDERS VALUES ('2', 102,'아이폰 15', 1250000);
INSERT INTO ORDERS VALUES ('3', 101,'갤럭시 워치 6', 350000);
INSERT INTO ORDERS VALUES ('4', 103,'효도라이오', 45000);
INSERT INTO ORDERS VALUES ('5', 104,'스마트폰 케이스', 25000);

select * from ORDERS;
--<문제1>
SELECT c.customer_name, o.product_name, o.price 
FROM customers c inner join orders o 
ON c.customer_id = o.customer_id;

-- <문제2>
-- select * from user_cons_columns where table_name = 'ORDERS';

select c.CUSTOMER_NAME, o.PRODUCT_NAME, o.PRICE
from customers c inner join ORDERS o
on c.customer_id = o.customer_id 
where o.PRICE >= 1000000;




== -----------------------------------------

drop table VIDEOS;

CREATE table VIDEOS(
VIDEO_ID NUMBER(10),
TITLE VARCHAR2(50) not null,
VIEWS NUMBER(20),
UPLOAD_DATE DATE not null,
CONSTRAINT pk_VIDEOS_id primary key (VIDEO_ID)
);


insert into VIDEOS values(1001, '스마트폰 글자 크기 키우는 법', 5200, date '2026-01-10');
insert into VIDEOS values(1002, '보이스피싱 예방 필수 설정 3가지', 12000, date '2026-01-15');
insert into VIDEOS values(1003, '맛있는 돋보기 앱 추천 및 활용', 850, date '2026-01-20');
insert into VIDEOS values(1004, '단풍 구경하기 좋은 국내 여행지', 3100, date '2026-01-25');

select * from VIDEOS;

drop table COMMENTS;

CREATE table COMMENTS(
COMMENT_ID NUMBER(10),
VIDEO_ID NUMBER(10),
USER_NAME VARCHAR2(30) not null,
CONTENT VARCHAR2(1000) not NULL, 
CONSTRAINT pk_COMMENTS_id primary key (COMMENT_ID),
CONSTRAINT fk_COMMENTS_VIDEO_ID FOREIGN key(VIDEO_ID) REFERENCES VIDEOS(VIDEO_ID) on DELETE set NULL
);

insert into COMMENTS values(1, 1001, '박민석','덕분에 눈이 아주 시원해졌습니다!');
insert into COMMENTS values(2, 1001, '이영희','친구들에게도 공유해 줬어요');
insert into COMMENTS values(3, 1002, '김정수','친구들에게도 공유해 줬어요');
insert into COMMENTS values(4, 1003, '최순자','당장 설정했습니다. 감사합니다.');
insert into COMMENTS values(5, 1003, '홍길동','이 영상은 다시 볼 수 없나요?');

select * from COMMENTS;


--Q. 댓글이 작성된 동영상의 '영상제목'과 해당 댓글을 쓴 '작성자', '댓글내용'을 조회하는 SQL 문을 작성하세요.
SELECT v.title, c.USER_NAME, c.CONTENT
FROM  VIDEOS v inner join COMMENTS c
ON v.VIDEO_id = c.VIDEO_id;


--Q. 댓글 중에서 '조회수(VIEWS)가 5,000회 이상'인 인기 영상에 달린 댓글의 '영상제목', '작성자', '조회수'를 조회하세요.
SELECT v.title, c.user_name, v.views
FROM COMMENTS c INNER JOIN videos v ON c.video_id = v.video_id
WHERE v.views >= 5000;





















