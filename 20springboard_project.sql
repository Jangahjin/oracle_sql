create table board(
boardNo number,
title varchar2(200) not null,
content VARCHAR(1000),
writer VARCHAR2(100) not null,
regDate Date default sysdate not null,
CONSTRAINT pk_board_no PRIMARY key(boardNo)
);

drop table board;

create sequence board_seq 
start with 1 
increment by 1
NOCYCLE
CACHE 2;

insert into board(boardNo,title,content,writer) values(board_seq.nextval, 'title', 'content', 'zeus');
select * from board;

select * from user_tables;
select * from user_sequences;
select * from user_constraints where table_name = 'MYBATISMEMBER_AUTH';

select * from board;

select * from board where boardno > 0 order by regdate desc;

update board set title = 'aaa',content = 'aaa', writer ='aaaa' where boardno = 8;
commit;

-- jpa
-- jpaboard

-- jpa board
CREATE TABLE jpaboard( 
    board_no NUMBER, 
    title VARCHAR2(200) NOT NULL, 
    content VARCHAR2(1000), 
    writer VARCHAR2(100) NOT NULL, 
    reg_date DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT pk_jpaboard_no PRIMARY KEY (board_no) 
);
desc jpaboard;
drop table jpaboard

create sequence jpaboard_seq 
start with 1 
increment by 1
NOCYCLE
CACHE 2;


CREATE TABLE mybatisboard( 
board_no NUMBER, 
title VARCHAR2(100) NOT NULL, 
content VARCHAR2(500) NULL, 
writer VARCHAR2(50) NOT NULL, 
reg_date DATE DEFAULT SYSDATE, 
CONSTRAINT pk_mybatisboard_no PRIMARY KEY (board_no) 
);

create sequence mybatisboard_seq 
start with 1 
increment by 1;

SELECT board_no, title, content, writer, reg_date 
FROM mybatisboard WHERE board_no > 0 
AND title LIKE CONCAT('%', CONCAT('하', '%'))
ORDER BY board_no DESC, reg_date DESC ;




CREATE TABLE mybatismember( 
user_no NUMBER, 
user_id VARCHAR2(50) NOT NULL, 
user_pw VARCHAR2(50) NOT NULL, 
user_name VARCHAR2(100) NOT NULL, 
coin NUMBER(10) DEFAULT 0, 
reg_date DATE DEFAULT SYSDATE, 
upd_date DATE DEFAULT SYSDATE, 
enabled CHAR(1) DEFAULT '1', 
CONSTRAINT pk_member_no PRIMARY KEY (user_no) 
); 
 -- 권한: 권한이 없음, 회원권한, 관리자 권한
CREATE TABLE mybatismember_auth(
user_no NUMBER NOT NULL, 
auth VARCHAR2(50) NOT NULL
);

alter table mybatismember_auth
add CONSTRAINT fk_member_auth_no FOREIGN KEY(user_no) REFERENCES mybatismember(user_no) on delete CASCADE;

alter table mybatismember_auth
drop CONSTRAINT fk_member_auth_no;

CREATE SEQUENCE mybatismember_seq
start with 1
INCREMENT by 1;

select mybatismember_seq.NEXTVAL FROM DUAL;


select * from mybatismember;
select * from mybatismember_auth;

drop table mybatismember_auth;

SELECT user_no, user_id,user_pw,user_name,reg_date
FROM mybatismember
ORDER BY reg_date DESC;

UPDATE mybatismember SET user_name = 'tomcat' WHERE user_no = 2;
DELETE FROM mybatismember WHERE user_no = 2;
DELETE FROM mybatismember_auth WHERE user_no = 3;
ROLLBACK;


INSERT INTO mybatismember_auth VALUES (4, 'ROLE_MEMBER');
INSERT INTO mybatismember_auth VALUES (4, 'ROLE_ADMIN');
INSERT INTO mybatismember_auth VALUES (3, 'ROLE_MEMBER');
Commit;


SELECT m.user_no, m.user_id, user_pw,user_name,reg_date,upd_date, auth 
FROM mybatismember M INNER JOIN mybatismember_auth A ON M.user_no = A.user_no 
WHERE M.user_no = 4;

--....................

CREATE TABLE item( 
item_id NUMBER(5), 
item_name VARCHAR2(20), 
price NUMBER(6), 
description VARCHAR2(50), 
picture_url VARCHAR2(200), 
CONSTRAINT pk_item_id PRIMARY KEY (item_id) 
); 
 
 select * from item;
 rollback;
 commit;
create sequence item_seq 
start with 1 
increment by 1;

SELECT item_seq.NEXTVAL FROM DUAL;
INSERT INTO item (item_id,item_name,price,description,picture_url)
VALUES(item_seq.nextval,'고객',100,'고객의그림','picture.jpg');

select * from item;
rollback;

SELECT item_id,item_name,price,description,picture_url
FROM item
WHERE item_id = 4;

UPDATE item SET 
item_name = '고객2',
price = 1000,
description = '고객의 그림2',
picture_url = 'picture2.jpg'
WHERE item_id = 4;

DELETE FROM item WHERE item_id = 5;

SELECT item_id, item_name, price, description, picture_url 
FROM item WHERE item_id > 0 ORDER BY item_id DESC;

SELECT picture_url FROM item WHERE item_id = 6;



-- *************

CREATE TABLE item2( 
item_id NUMBER(5), 
item_name VARCHAR2(20), 
price NUMBER(6), 
description VARCHAR2(50), 
picture_url VARCHAR2(200), 
picture_url2 VARCHAR2(200), 
CONSTRAINT PK_item2_id PRIMARY KEY (item_id) 
); 
 
create sequence item2_seq 
start with 1 
increment by 1;