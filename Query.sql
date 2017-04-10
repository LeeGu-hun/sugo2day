// DB 작업 전 account 생성

CREATE TABLESPACE sugo2day DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\sugo2day.dbf' SIZE 500M;
CREATE USER sugo2day IDENTIFIED BY 1234 DEFAULT TABLESPACE sugo2day TEMPORARY TABLESPACE temp;
GRANT connect, resource, dba TO sugo2day;


// MEMBER TABLE

create table MEMBER(
	ID int not null,
	EMAIL varchar(255) not null constraint member_email_uk unique,
	PASSWORD varchar(100) not null,
	NAME varchar(100) not null constraint member_name_uk unique,
	BIRTHDAY date not null,
	GENDER varchar(100) not null,
	REGDATE date not null,
	constraint member_id_pk primary key(id)
);

// SEQUENCE 사용은 보류
CREATE SEQUENCE mID_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

INSERT INTO MEMBER
values(mID_seq.nextval, 'admin@admin.com', 1234, 'admin', '1987-11-14', 'male', '2017-03-15');



// BOARD TABLE

CREATE TABLE BOARD(
    NUM int not null,
    WRITER varchar(20) not null,
    PASS int not null,
    SUBJECT varchar2(50) not null,
    CONTENT varchar2(4000) not null,
    FILES varchar2(50) null,
    RE_REF int default 0 not null,
    RE_LEV smallint default 0 not null,
    RE_SEQ smallint default 0 not null,
    READCOUNT int default 0,
    REGDATE date not null,
    constraint board_num_pk primary key(NUM)
); 

// SEQUENCE 사용은 보류
CREATE SEQUENCE bNum_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

INSERT INTO BOARD
values(bNum_seq.nextval, 1, 1234, 'TEST', 'TEST', null, 1, 1, 1, 0, '2017-03-15');


// Foreign Key 설정(추후 사용)
ALTER TABLE BOARD ADD CONSTRAINT board_writer_fk FOREIGN KEY(WRITER) REFERENCES MEMBER(id);
select m.name from user_board b, member m where m.id = b.writer;