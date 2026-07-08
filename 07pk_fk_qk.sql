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
-- 데이터 딕셔너리 (dba_XXXX, all_XXXX : user_table, user_constraints, user_cons_columne
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

delete from dept where deptno = 30;

-- 사원테이블(emp) dept 참조테이블 설정
drop table emp;
create table emp(
  empid number(10),
  empname char(10),
  job varchar2(20),
  salary number(10),
  deptno number(10),
  constraint pk_emp_id Primary key (empid),
  constraint fk_emp_dept_no FOREIGN key (deptno) REFERENCES dept(deptno)
);
-- 제약조선수정 (fk_emp_dept_no 삭제를 하고 다시 재설정)
alter table emp
deop constraint fk-emp_dept_no;
alter table emp
ass constraint fk_emp_dept_no FOREIGN key(deptno) Referencse dept(

insert into emp values(1,'kdj','부장',100000,null);
insert into emp values(2,'kdj2',null,null,0);
update emp set deptno = 50;
select * from user_constraints;
delete from where empid =1;

-- check 제약조건

-- emp 테이블에 gender char(1) defult'M' 추가하시오
Alter table emp
 add gender char(1) default 'M';
 select * from emp;
 
-- emp 테이블에 gender check 제약 조선을 넣어주세요 ('M', 'F', 'O')
Alter table emp
add constraint ck_emp_gender check (gender in('M', 'F', 'O'));

desc emp;
select * from user_constraints where table_name = 'EMP';
select * from user_cons_columns where table_name = 'EMP';

-- emp 테이블에 gender check 계약조건이 작동되는 확인할 것
select * from emp;
-- check 제약 조건에 위배가 된다.
lnsert into emp values (3,'kdj3','부장3',1000000,null,'A');

-- emp 테이블에 score number (4) 여기 체크 제약 조건을 걸어주시오 (0~100)
-- 체크제약조건을 걸어주시오 (0~100)
ALTER TABLE EMP
 ADD SCORE NUMBER(4) CONSTRAINT CK_EMP_SCORE CHECK (SCORE BETWEEN 0 AND 100);

insert into emp values(5, 'kdj5','부장5',1000000,40,'F',100);
select * from emp;
select * from dept;

delete from dept where deptno = 40;

-- foreign key 옵션 5가지
--NO ACTION : 참조 테이블에 변화가 있어도 기본 테이블에는 아무 조취를 취하지 않는다.
--CASCADE : 참조 테이블의 튜플이 삭제되면 기본 테이블의 관련 튜플도 삭제되고, 속성이 변경되면 관련 튜플의 속성 값도 모두 변경된다.
--SET NULL : 참조 테이블에 변화가 있으면 기본 테이블의관련 튜플의 속성 값을 NULL로 변경한다.
--SET DEFAULT : 참조 테이블에 변화가 있으면 기본 테이블의 관련 튜플의 속성 값을 기본값으로 변경한다.
--RESTRICT : 참조 테이블에 변화(삭제,수정)가 있으면 , 기본테이블경우 데이터 삭제나 수정 불가




-- 문제
create table v_gogek(
g_code number(5) not null,
g_name varchar2(20) not null,
g_age number(3),
g_addr varchar2(50),
g_tel varchar2(20),
constraint pk_v_gogek_code primary key (g_code)
);

create table video(
    v_code number(5) not null,
    v_title varchar2(50) not null,
    v_genre varchar2(30),
    v_pay number(7) not null,
    v_lend_state number(1),
    v_make_company varchar2(50),
    v_make_data Date,
    v_view_age number(1),
    constraint pk_video_v_code primary key(v_code),
    constraint ck_video_v_state check(v_lend_state in ('Y','N'))
);

create table lend_return (
lr_code number(5) not null,
g_code number(5) not null,
v_code number(5) not null,
l_date date,
r_plan_date date,
l_total_pay number(7),
constraint pk_lend_return_lr_code primary key (lr_code),
CONSTRAINT fk_lend_reture_gogek_g_code FOREIGN key(g_code) REFERENCES v_gogek(g_code),
CONSTRAINT fk_lend_reture_video_v_code FOREIGN key(v_code) REFERENCES video(v_code)
);

