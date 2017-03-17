// DB 작업 전 account 생성

CREATE TABLESPACE sugo2day DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\sugo2day.dbf' SIZE 500M;
CREATE USER sugo2day IDENTIFIED BY 1234 DEFAULT TABLESPACE sugo2day TEMPORARY TABLESPACE temp;
GRANT connect, resource, dba TO sugo2day;


// MEMBER TABLE

create table MEMBER(
	ID number,
	EMAIL varchar(255) not null constraint member_email_uk unique,
	PASSWORD varchar(100) not null,
	NAME varchar(100) not null constraint member_name_uk unique,
	BIRTHDAY date not null,
	GENDER varchar(100) not null,
	REGDATE date not null,
	constraint member_id_pk primary key(id)
);

// SEQUENCE 사용은 보류
CREATE SEQUENCE memberID_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

INSERT INTO MEMBER
values(memberID_seq.nextval, 'admin@admin.com', 1234, 'admin', '1987-11-14', 'male', '2017-03-15');



// BOARD TABLE

CREATE TABLE USER_BOARD(
    BOARD_NUM number,
    BOARD_WRITER varchar2(20) not null,
    BOARD_PASS varchar2(15) null,
    BOARD_SUBJECT varchar2(50) not null,
    BOARD_CONTENT varchar2(4000) not null,
    BOARD_FILE varchar2(50) null,
    BOARD_RE_REF number not null,
    BOARD_RE_LEV number not null,
    BOARD_RE_SEQ number not null,
    BOARD_READCOUNT number default 0,
    BOARD_DATE date not null,
    constraint board_num_pk primary key(BOARD_NUM)
); 

// SEQUENCE 사용은 보류
CREATE SEQUENCE boardNUM_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

INSERT INTO USER_BOARD
values(boardNUM_seq.nextval, 'admin', 1234, 'TEST', 'TEST', null, 1, 1, 1, 0, '2017-03-15');


// Foreign Key 설정
ALTER TABLE USER_BOARD ADD CONSTRAINT BOARD_WRITER_FK FOREIGN KEY(BOARD_WRITER) REFERENCES MEMBER(id);
select m.name from user_board b, member m where m.id = b.board_writer;