-- 1. 사용자가 정의한 테이블 생성(속성 - 사원번호, 이름, 연봉)
create table EMP01 (
    empNo NUMBER(4),
    name varchar2(20),
    salary number(7,2)
);

select * from emp01;

-- 2. 기존 테이블 복사 (employees - employees2)
create table employees02 
as 
select * from employees;

-- 3. 테이블에 대한 정보가 기록된 테이블
select * from TAB;

-- 4. 테이블 수정 (추가 alter add 컬럼, 수정 alter modify 컬럼, 삭제 alter drop 컬럼)
-- ALTER TABLE table_name ADD(column_name data_type expr, …);

-- <예> EMPoyees02 테이블에 문자 타입의 직급 칼럼 추가
desc employees02;
alter table employees02 add(job VARCHAR2 (10));

--<문제> 이미 존재하는 employees02 테이블에 입사일 칼럼(CREDATE)을 날짜형으로 추가하라.
desc employees02;
alter table employees02 add(CREDATE DATE);

-- ALTER TABLE table_name MODIFY(column_name    data_type expr, …);
-- <예> employees02 직급(job)을 최대 30자까지 입력할 수 있도록 크기 수정
select * from employees02;
desc employees02;
alter table employees02 modify(job VARCHAR2(20));

alter table employees02 modify(job VARCHAR2(10));

-- ALTER TABLE로 기존 칼럼명 변경
--ALTER TABLE table_name
--RENAME COLUMN old_name TO new_name;
--<예> employees02 직급(job) 컬러명을 job_copy 변경
alter table employees02
rename column job to job_copy;


-- ALTER TABLE table_name DROP COLUMN column_name;
--<예> employees02 직급(job_copy) 컬러명을 삭제
alter table employees02
 drop column job_copy;
 
 
-- 5. 테이블 삭제
-- drop table 테이블명;
drop table employees02;


-- 6. 테이블명 변경
-- rename 옛날 테이블명 to 변경하고자 하는 테이블명
rename employees02 to employees03;

select * from tab;

-- 7. 테이블에 모든 로우를 제거하는 TRUNCATE문
-- DROP EMPLOYEES03;
-- TRUNCATE TABLE EMPLOYEES03;

select * from employees03;
TRUNCATE Table employees03;
desc employees03;

Drop table employees03;

create table TB_CUSTOMER(
 CUSTOMER_CD CHAR(7) NOT NULL PRIMARY KEY,
 CUSTOMER_NM VARCHAR2(20) NOT NULL,
 MW_FLG CHAR(1) NOT NULL,
 BIRTH_DAY CHAR(1) NOT NULL,
 PHONE_NUMBER VARCHAR(16),
 EMAIL VARCHAR(30),
 TOTAL_POINT NUMBER(10),
 REG_DTTM CHAR(14)
);

desc TB_CUSTOMER;


--학생 성적 테이블을 만들어 봅시다.
--1.학번의 (숫자)데이터는 중복되거나 null값을 허용하면 안 되고
--2.이름은 문자데이터며 null값을 허용하지 않고
--국어, 영어, 수학 컬럼을 number 타입으로 가지고 모두 다 null값을 허용하지 않습니다.
--단, 국어,영어,수학 컬럼에 데이터를 넣지 않으면 기본값으로 0을 갖습니다.
--총점과 평균 컬럼은 기본값을 0을 갖습니다.

CREATE table STUDENT(
    student_id number(10) PRIMARY KEY,
    student_name VARCHAR(10) not null,
    student_kor number(5) DEFAULT 0 not null,
    student_eng number(5) DEFAULT 0 not null,
    student_math number(5) DEFAULT 0 not null,
    student_total number(5) DEFAULT 0,
    student_avg number(5)  DEFAULT 0
);
