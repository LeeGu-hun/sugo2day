CREATE TABLESPACE sugo2day DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\sugo2day.dbf' SIZE 500M;
CREATE USER sugo2day IDENTIFIED BY 1234 DEFAULT TABLESPACE sugo2day TEMPORARY TABLESPACE temp;
GRANT connect, resource, dba TO sugo2day;

create table MEMBER(
	ID number,
	EMAIL varchar(255) not null,
	PASSWORD varchar(100) not null,
	NAME varchar(100) not null,
	GENDER varchar(100) not null,
	REGDATE date not null,
	ENTERPRISE varchar(50));