create table MEMBER(
	ID INT auto_increment PRIMARY KEY,
	EMAIL varchar(255) not null,
	PASSWORD varchar(100) not null,
	NAME varchar(100) not null,
	GENDER varchar(100) not null,
	REGDATE datetime not null,
	ENTERPRISE boolean default false,
unique key (EMAIL)) engine=InnoDB character set = utf8;