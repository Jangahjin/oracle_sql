-- select 문기능

-- 1.departments 클래스에 몇 개의 객체가 존재하는지 (레코드)조사
select * from departments;
-- 1-1.employees 클래스에 몇 개의 객체가 존재하는지 (레코드)조사
select * from employees;


-- 2. departments 테이블에서 department_id,  department_name 항목만 보고 싶다.
select department_id,  department_name from departments;
-- 2-1. 
select first_name, last_name, salary, hire_date from employees;


-- 3. 컬럼 이름 별칭 븥이기
select first_name as a, last_name as b , salary as c , hire_date as d from employees;
select first_name as 이름, last_name b , salary as c , hire_date as d from employees;


-- 4. 연결연산자(concatenation) : 자바에서 문자열 + 숫자
select * from employees;
-- 사원번호 100 이고 사원의 이름은 Stenven king 이메일 주소는 sking 입니다.
select '사원번호'|| employee_id || '이고 사원의 이름' || first_name || last_name || '입니다' as info from employees;


-- 5. 중복된 데이터를 한 번씩만 출력하는 기능 (DISTINCT)
select DISTINCT job_id from employees;
-- 5-1. 
select DISTINCT department_id from  employees;


-- 6. 조건문
--  employees 급여를 3000 달러 이상 받는 직원을 대상
select first_name, salary from  employees where salary >= 3000;

-- 부서번호가 110번인 직원 모든 정보 출력 
select * from  employees where department_id = 110;
-- 
select  job_id, first_name, last_name, salary from employees where salary < 5000;


-- 7. 이름(first_name)이 lex인 직원 출력
select * from employees where first_name = 'Lex';
-- 예시 문제 2
select   EMPLOYEE_ID, job_id, first_name, last_name from employees where first_name = 'John';


-- 8. 날짜 데이터 조회
select * from employees where hire_date > '2008/01/01';


-- 9. AND 조건 / or = in 조건
--<예> qntjqjsghrk 100번이고 직급이 FI_MGR인 직원
SELECT * from employees where department_id = 100 and job_id = 'FI_MGR';
-- 문제 : 급여가 5000에서 10000 이하인 직원 정보 출력
SELECT * from employees where salary >= 5000 and salary <= 10000;

-- or 조건
SELECT * from employees where department_id = 100 or job_id = 'FI_MGR';
-- 문제: 직원번호가 134이거나 201이거나 107인 직원 정보 출력
select * from employees where EMPLOYEE_ID=134 or EMPLOYEE_ID=201 or EMPLOYEE_ID=107;

-- <예> 부서번호가 100번이 아닌 직원
SELECT * from employees where department_id != 100; -- 강추
SELECT * from employees where department_id <> 100; -- 강추
SELECT * from employees where department_id ^= 100;
SELECT * from employees where NOT department_id = 100;
-- 문제: 직급이 FI_MGR이 아닌 직원 
SELECT * from employees where job_id != 'FI_MGR';


-- Between and 조건
SELECT * from employees where salary BETWEEN 5000 and 10000;
-- 문제: 
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary BETWEEN 2500 AND 4500;
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary >= 2500 AND salary <= 4500;


-- in 조건
select * from employees where EMPLOYEE_ID in (134,201,107);
-- 문제
select EMPLOYEE_ID, first_name, last_name, salary, commission_pct from employees where commission_pct in (0.3, 0.05, 0.1);
select EMPLOYEE_ID, first_name, last_name, salary, commission_pct from employees where commission_pct = 0.3 or commission_pct = 0.05 or commission_pct = 0.1;


-- LIKE 연산자 (_:1글자이고 (여기에 무엇이 와도 상관이 없다)) (%: 없거나, 1글자 무엇이 와도 상관이 없다.)
-- K로 시작하는 사원
SELECT * from employees where first_name like 'K%';
-- K로 끝나는 사원
SELECT * from employees where first_name like '%K';
-- 이름 두 번째가 d인 사원
SELECT * from employees where first_name like '_d%';
-- 문제:
SELECT employee_id, first_name FROM employees WHERE first_name NOT LIKE '%a%';


-- NULL (연산, 할당, 비교가 불가능)
select * from employees where commission_pct = NULL ;
select * from employees where commission_pct is NULL ;
select * from employees where commission_pct is not NULL ;
-- 문제
select first_name, last_name, job_id, employee_id from employees where manager_id is NULL;


-- order by 필드명 ssc, order by 필드명 desc 
--(사번을 기준으로 오름차순 정렬)
SELECT * from employees order by employee_id asc;
--(사번을 기준으로 오름차순 정렬 부서번호가 100이 아닌 부서)
select * from employees where department_id <> 100 order by employee_id asc;

SELECT employee_id, first_name, last_name, salary from employees order by salary asc;

SELECT employee_id,first_name, last_name, hire_date from employees order by hire_date desc;


