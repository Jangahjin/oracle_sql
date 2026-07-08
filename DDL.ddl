-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2026-07-08 12:35:54 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



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

CREATE TABLE hr.lend_return (
    lr_code     NUMBER(5) NOT NULL,
    g_code      NUMBER(5) NOT NULL,
    v_code      NUMBER(5) NOT NULL,
    l_date      DATE,
    r_plan_date DATE,
    l_total_pay NUMBER(7)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX hr.pk_lend_return_lr_code ON
    hr.lend_return (
        lr_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.lend_return
    ADD CONSTRAINT pk_lend_return_lr_code PRIMARY KEY ( lr_code )
        USING INDEX hr.pk_lend_return_lr_code;

CREATE TABLE hr.v_gogek (
    g_code NUMBER(5) NOT NULL,
    g_name VARCHAR2(20 BYTE) NOT NULL,
    g_age  NUMBER(3),
    g_addr VARCHAR2(50 BYTE),
    g_tel  VARCHAR2(20 BYTE)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX hr.pk_v_gogek_code ON
    hr.v_gogek (
        g_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.v_gogek
    ADD CONSTRAINT pk_v_gogek_code PRIMARY KEY ( g_code )
        USING INDEX hr.pk_v_gogek_code;

CREATE TABLE hr.video (
    v_code         NUMBER(5) NOT NULL,
    v_title        VARCHAR2(50 BYTE) NOT NULL,
    v_genre        VARCHAR2(30 BYTE),
    v_pay          NUMBER(7) NOT NULL,
    v_lend_state   NUMBER(1),
    v_make_company VARCHAR2(50 BYTE),
    v_make_data    DATE,
    v_view_age     NUMBER(1)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE hr.video
    ADD CONSTRAINT ck_video_v_state CHECK ( v_lend_state IN ( 'N', 'Y' ) );

CREATE UNIQUE INDEX hr.pk_video_v_code ON
    hr.video (
        v_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.video
    ADD CONSTRAINT pk_video_v_code PRIMARY KEY ( v_code )
        USING INDEX hr.pk_video_v_code;

ALTER TABLE employees2
    ADD CONSTRAINT employees2_departmentid_fk
        FOREIGN KEY ( deptid )
            REFERENCES departmentid ( deptid )
                ON DELETE CASCADE
            NOT DEFERRABLE;

ALTER TABLE hr.lend_return
    ADD CONSTRAINT fk_lend_reture_gogek_g_code
        FOREIGN KEY ( g_code )
            REFERENCES hr.v_gogek ( g_code )
            NOT DEFERRABLE;

ALTER TABLE hr.lend_return
    ADD CONSTRAINT fk_lend_reture_video_v_code
        FOREIGN KEY ( v_code )
            REFERENCES hr.video ( v_code )
            NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             3
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
