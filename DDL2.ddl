CREATE TABLE depatment3 (
    deptid  VARCHAR2(20 BYTE) NOT NULL,
    empname VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE depatment3 ADD CONSTRAINT depatment3_pk PRIMARY KEY ( deptid );

CREATE TABLE empyloees3 (
    deptid_1 VARCHAR2(20 BYTE) NOT NULL,
    deptname VARCHAR2(20 BYTE) NOT NULL,
    deptid   VARCHAR2(20 BYTE)
);

ALTER TABLE empyloees3
    ADD CONSTRAINT empyloees3_depatment3_fk
        FOREIGN KEY ( deptid_1 )
            REFERENCES depatment3 ( deptid )
                ON DELETE CASCADE;


