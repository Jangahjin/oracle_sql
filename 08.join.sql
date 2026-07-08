-- 조인

-- 1. cross join (두 개의 테이블을 크로스한다.)
select count(*) from employees; --107
select count(*) from departments; --27
select count (*) from employees, departments where first_name like '%a%';

-- ANSI 협회가 정한 cross join
select * from employees, departments;



-- 2. lnner join (employees 테이블과, departments 테이블을 join)
select * from user_cons_columns where table_name = 'EMPLOYEES';

select first_name, salary, d.department_id, d.department_name 
from EMPLOYEES e, DEPARTMENTS d 
where e.department_id = d.department_id and e.salary >= 15000;

select first_name, salary, d.department_id, d.department_name 
from EMPLOYEES e inner join DEPARTMENTS d 
on e.department_id = d.department_id 
where e.salary >= 15000;

-- <문제>
select * from user_cons_columns where table_name = 'DEPARTMENTS';
select e.first_name, e.email, e.job_id, e.salary, d.department_id, d.location_id
from employees e inner join departments d
on e.department_id = d.department_id
where upper(d.department_name) = 'Shipping' and e.salary >= 5000;

-- using 이용한 조인 조건 지정
select *
from employees e inner join departments d
using(department_id);


-- outer join
select e.first_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+) -- left outer join
--where e.department_id(+) = d.department_id :right outer join
order by d.department_id asc;

select * from departments order by department_id asc;

-- ANSI 협회가 정한 left outer join
select e.first_name, d.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
order by d.department_id asc;

-- ANSI 협회가 정한 right outer join
select e.first_name, d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id
order by d.department_id asc;


-- self join (한 개의 테이블을 두 개로 분리시킨다. 한 테이블에선 pk, 다른 테이블에서는 fk)
-- employees 를 self join 해서 사원의 정보와 사원의 사수의 정보를 출력하는 쿼리문 작성
select e1.first_name 사원, e2.first_name 사원사수 from employees e1, employees e2
where e1.employee_id = e2.manager_id;


-- non equl join(두 개의 테이블이 아무관계가 없다. FK 가지고 있지 않다.)
-- 등급을 나타내는 테이블 생성 gradetbl (등급, 최소연봉, 최대연봉)
create table gradetbl(
grade number(1) not null,
minsalary number not null,
maxsalary number not null,
CONSTRAINT pk_gradetbl_grade primary key(grade)
);

insert into gradetbl values (1,2000,5000);
insert into gradetbl values (2,5001,10000);
insert into gradetbl values (3,10001,20000);
insert into gradetbl values (4,20001,30000);
insert into gradetbl values (5,30001,50000);

commit;

select * from gradetbl;


-- 공동컬럼이 없는 employees 테이블과 gradetbl 조인을 해서 사원의 이름과, 사원의 월급, 사원의 월급 등급을 출력
select first_name, salary, grade, minsalary, maxsalary 
from employees e, gradetbl g
where e.salary >= g.minsalary and e.salary <= g.maxsalary;

select first_name, salary, grade, minsalary, maxsalary 
from employees e, gradetbl g
where e.salary between g.minsalary and g.maxsalary;
