-- update
-- update table_name
-- SET column_name1 = value1, column_name2 = value2, ... WHERE conditions;

-- employees 테이블을 emp 복사
CREATE table emp
as
select * from employees;

desc em2;
select * from emp;


-- 제약조건을 걸고 해제하는 기능
-- emp employees_id pk 제약조건입력
alter table emp
 add constraint pk_emp_empid primary key(employee_id);
 
 alter table emp
  drop constraint pk_emp_id;
  
  -- phone number not null 제약조건
ALTER TABLE EMP
 MODIFY phone_number varchar2(20) constraint nn_emp_phone NOT NULL;
  
alter table emp
 drop constraint nn_emp_phonr;
  
select * from user_constraints where table_name = 'EMP';
 
 
 -- 모든 사원(emp)의 부서번호를 30번으로 수정하자.
 desc emp;
 update emp set department_id= 30;
 select department_id from emp;
 
 -- DML (select, delte, update, insert => 롤백, 커밋이 대상이 된다.
 commit;
 rollback;
 
 -- <문제> 모든 사원의 급여를 10% 인상한다.
 desc emp;
 update emp set salary = salary * 1.1;
 -- salary_copy 컬럼을 추가 하고, salary 복사 update를 진행한다.
alter table emp
Add (salary_copy number(8,2));
update emp set salary_copy = salary;
select salary_copy from emp;

 -- <문제> emp에서 입사일을 오늘 날짜로 수정한다. (오라클은 오늘 날짜 : SYSDATE)
 update emp set HIRE_DATE = SYSDATE;
 select * from emp;
 desc emp;
 
 -- 부서번호가 10번인 사원의 부서번호를 30번으로 수정
update emp set department_id = 30 where department_id = 10;

-- emp 테이블에서 급여가 3000달러 이상인 사원만 급여 10% 인상
update emp set salary = salary * 1.1 where salary >= 3000;

-- 2007년에 입사한 사원의 입사일을 오늘로 수정
-- substr('03/06/17', 자바 기준 숫자 세기 0-2 / 오라클 기준 가져오는 위치와 갯수 1, 2 
select * from emp where substr(hire_date,1,2) = '07';
update emp set hire_date = sysdate where substr(hire_date,1,2) = '07';
 
 
-- LAST_NAME이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상된다.
update emp set salary = 17000, COMMISSION_PCT = 0.45 where last_name = 'Russell';
desc emp;
select * from emp where last_name = 'Russell';