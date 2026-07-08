CREATE USER hr IDENTIFIED BY account

unlock;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE departmentid (
    deptid    INTEGER NOT NULL,
    deptloc   VARCHAR2(30 BYTE),
    deptphone CHAR(14 BYTE) NOT NULL,
    deptname  VARCHAR2(30 BYTE) NOT NULL
)
LOGGING;

COMMENT ON COLUMN departmentid.deptloc IS
    '부서의 위치입니다';

ALTER TABLE departmentid ADD CONSTRAINT departmentid_pk PRIMARY KEY ( deptid );

CREATE TABLE employees2 (
    empid    INTEGER NOT NULL,
    empname  CHAR(4 CHAR) NOT NULL,
    empemail VARCHAR2(4 CHAR) NOT NULL,
    deptid   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE employees2 ADD CONSTRAINT employees2_pk PRIMARY KEY ( empid );
