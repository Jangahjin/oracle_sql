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
select * from user_constraints;

select * from board;

select * from board where boardno > 0 order by regdate desc;

update board set title = 'aaa',content = 'aaa', writer ='aaaa' where boardno = 8;
commit;

-- jpa
-- jpaboard

create table jpaboard(
boardNo number,
title varchar2(200) not null,
content VARCHAR(1000),
writer VARCHAR2(100) not null,
regDate Date default sysdate not null,
CONSTRAINT pk_jpaboard_no PRIMARY key(boardNo)
);

create sequence jpaboard_seq 
start with 1 
increment by 1
NOCYCLE
CACHE 2;