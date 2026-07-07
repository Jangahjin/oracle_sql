-- 무결성 제약조건 (not null, unique, primary key, check. foreign key)

-- 1. not null
-- 2. unique 제약조건 == primary key 제약조건이랑 같음. (다른점: null 허용)

-- emp02 생성한다.

DROP TABLE emp02;

create table emp02
as
SELECT * FROM employees;

desc emp02;
-- 제약조건 설정 employee_id primary key 제약조건을 설정

select * from user_constraints where table_name = 'EMP02';

alter table emp02
 add constranit pk_emp02_id primary key(employee_id);
 
 -- unique 제약조건
 alter table emp02
 add constraint uk_emp02_phone UNIQUE(phone_number);

-- phone_number not null 제약조건
alter table emp02
 modify phone_number not null;
 
 -- phone_number not null 제약조건을 삭제
 alter table emp02
 drop constraint nn_emp02_phone;
 
 desc emp02;

select * from user_constraints where table_name = 'EMP02';
select * from user_cons_columns where table_name = 'EMP02';
select * from user_tables;

-- 테이블 emp03 생성
create table emp03(
empno number(4),
empname varchar2(20) not null,
job varchar2(20),
constraint uk_emp02_no unique(empno)
);

insert into emp03 values(null, 'dkj','programmer');
insert into emp03 values(1234, 'dkj3','programmer');
insert into emp03 values(null, 'dkj2','db developer');
delete from emp03 where job = 'db developer';
select * from emp03;

update emp03 set empno = 0 where empno is null;
alter table emp03
modify empno number(4) not null;

-- 3. primary key(null 허용없음, 중복허용없음) == 자동 인덱스 설정

-- 4. foreign key (창조 무결성 제약조건)

-- 테이블 설계 부서(dept) 설계테이블 (부서명,부서번호,지역명)
drop table dept;
select * from user_tables where table_name = 'DEPT';

create table dept(
    deptno number(4),
    deptname varchar2(10),
    loc varchar2(30) constraint nn_dept_loc not null,
    constraint pk_dept_no primary key(deptno),
    constraint uk_dept_name unique(deptname)
);
insert into dept values(10, '관리과', '서울');
insert into dept values(20, '관리과2', '서울2');
insert into dept values(30, '관리과3', '서울3');
insert into dept values(40, '관리과4', '서울4');
select * from dept;

-- 사원테이블(emp) dept 참조테이블 설정
drop table emp;
create table emp(
  empid number(10),
  empname char(10),
  job varchar2(20),
  salary number(10),
  deptno number(10),
  constraint pk_emp_id Primary key (empid),
  constraint fk_emp_dept_no FOREIGN key (deptno) REFERENCES dept(deptno)on delete CASCADE
);

insert into emp values(1,'kdj','부장',100000,40);
update emp set deptno = 30;

select * from user_constraints;
