-- 1. 테이블 스페이스 만들기 테이블 저장할 공간
-- 저장할 공간 이름 : first01.dbf 사이즈 : 10M
CREATE TABLESPACE firstData
DATAFILE 'C:\oraclexe\oradata\XE\first01.dbf' SIZE 10M;

-- 저장 공간 수정
alter tablespace firstData
add datafile 'C:\oraclexe\oradata\XE\first02.dbf' SIZE 10M;

-- 저장 공간 사이즈 수정
alter database
datafile 'C:\oraclexe\oradata\XE\first02.dbf' RESIZE 20M;

-- 저장 공간 삭제
drop TABLESPACE firstData INCLUDING contents and datafiles;

-- 저장공간 자동설정 (first01.dbf 기존용량이 부족하면 1M증가, 최대 20M 가능)
alter database
DATAFILE 'C:\oraclexe\oradata\XE\first01.dbf'
AUTOEXTEND on
next 1M
MAXSIZE 20M;

-- 사용자 설정
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user javauser IDENTIFIED by javauser
default TABLESPACE firstData
TEMPORARY TABLESPACE temp;

-- 사용자 권한 설정 (javauser에게 접속 권한, 테이블 curd 기능 부여)
grant CONNECT, RESOURCE to javauser;

-- 접속 요청을 진행하면 된다.
 