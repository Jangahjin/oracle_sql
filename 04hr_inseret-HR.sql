-- insert 문
-- insert INNO table anem (column_value,...) VALUES(column_value,...)
-- 주의: 컬럼명, 컬럼명갯수와 value 갯수가 맞아야 한다. + 컬럼명타입과 values 차입이 같아야 한다. + not null, primary key 제약 조건 조심

-- dept 테이블 생성
CREATE TABLE DEPT(
 DEPTNO NUMBER(2) primary key,
 DNAME VARCHAR2(14),
 LOC VARCHAR2(13) not null
);
-- 칼럼 DEPTNO에 10번 부서, DNAME에는 ‘ACCOUNTING’을, LOC에는 ‘NEW YORK’을 추가하자
insert into dept(deptno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(11, 'ACCOUNTING1', 'NEW YORK1');
insert into dept values(13, null, 'NEW YORK3');
insert into dept values(14, 'TEMP', 'NEW YORK4');
insert into dept(deptno, dname, loc) values(12, 'ACCOUNTING2', 'NEW YORK2');

select * from dept;

-- dname null 값을 임시값으로 변경
update dept set dname = '임시값' where dname is null;

-- 컬럼 deptno 사이즈 4로 변경, dname을 not null 변경하세요
alter table dept 
 modify(DEPTNO NUMBER(4), DNAME VARCHAR2(30) not null);
desc dept;

drop table TB_CUSTOMER02;

select * from tab where tname = 'DEPT';



CREATE TABLE TB_CUSTOMER02(
    CUSTOMER_CD NUMBER(7) PRIMARY key,
    CUSTOMER_NM VARCHAR2(20) NOT NULL,
    MW_FLG CHAR(20) NOT NULL,
    BIRTH_DAY DATE NOT NULL,
    PHONE_NUMBER CHAR(20),
    EMAIL VARCHAR(20) NOT NULL,
    TOTAL_POINT NUMBER(20) NOT NULL,
    REG_DTTM TIMESTAMP NOT NULL
);


INSERT INTO tb_customer02 (CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM)
VALUES (2017053, '나경숙', 'W', DATE '1989-12-25', '010-4509-0043', 'ksna#boram.co.kr', 4500, TIMESTAMP '2017-02-10 18:09:30');
INSERT INTO tb_customer02 (CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM)
VALUES (2017108, '박승대', 'M', DATE '1989-11-30', NULL, 'kslva#boram.co.kr', 24500, TIMESTAMP '2017-05-20 18:16:30');
INSERT INTO tb_customer02 (CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM)
VALUES (2017042, '강원진', 'W', DATE '1981-06-03', '010-8202-8790', 'wjagamgh@navi.com', 280300, TIMESTAMP '2017-01-23 13:24:32');

select * from tb_customer02;

