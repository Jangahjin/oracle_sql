-- delete
-- DELETE FROM table_name WHERE conditions;

--(dept1) 부서 테이블의 모두 삭제
select * from user_tables;
create table dept
as
select * from departments;

select * from dept;

delete from dept;

rollback;

-- dept 30번 부서를 삭제하시오
select * from dept where department_id = 30;
delete from dept where department_id = 30;


-- <문제1>
DROP TABLE emp01;
CREATE TABLE emp01 (
    empno    NUMBER(4),
    ename    VARCHAR2(10) NOT NULL,
    job      VARCHAR(9),
    mgr      NUMBER(4),
    hiredate DATE NOT NULL,
    sal      NUMBER(7,2) NOT NULL,
    comm     NUMBER(7,2),
    deptno   NUMBER(2) NOT NULL,
    CONSTRAINT pk_emp01_no primary KEY(empno)
);

INSERT INTO emp01 VALUES (7369, 'SMITH', 'CLERK', 7836, DATE '1980-12-17', 800, NULL, 20);
INSERT INTO emp01 VALUES (7499, 'ALLEN', 'SALESMAN', 7369, DATE '1987-12-20', 1600, 300, 30);
INSERT INTO emp01 VALUES (7839, 'KING', 'PRESIDENT', NULL, DATE '1981-02-08', 5000, NULL, 10);
SELECT * FROM emp01;
