-- 인덱스 설정
-- 장점 : 검색 속도가 빨라진다. / 시스템에 걸리는 부하를 줄여서 시스템 전체 성능을 향상
-- 단점 : 인덱스를 위한 추가 공간 필요 / 생성 시간 소모 / 데이터의 변경 작업이 자주 일어날 시 성능 저하

-- emp01 테이블 생성 (employees)
drop table emp01;

create table emp01
as
select * from employees;

-- 인덱스 테이블 내용을 조사 (데이터 딕셔너리 확인 체크)
select * from user_indexes where table_name = 'EMP01';

-- 인덱스 성능을 체크
select * from emp01;
select * from emp01 where employee_id = 100;

-- emp01 employee_id pk 설정
alter table emp01
add CONSTRAINT pk_emp01_id primary key(employee_id);

-- email으로 성능 체크
select * from emp01 where email like 'A%';

-- email 설정
create unique index ix_emp01_email
on emp01(email);
desc emp01;

drop index ix_emp01_email;



