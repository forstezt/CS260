/*Zach Forster*/
/*BOOK_DDLs.sql*/
/*9/29/2012*/

DROP TABLE book_wrote;
DROP TABLE book_invent;
DROP TABLE book_title;
DROP TABLE book_publisher;
DROP TABLE book_branch;
DROP TABLE book_author;
DROP TABLE book_type;

CREATE TABLE book_type
(book_type VARCHAR2(5) 
CONSTRAINT book_type_book_type_pk PRIMARY KEY,
type_desc VARCHAR2(30));

CREATE TABLE book_author
(author_number NUMBER(3) 
CONSTRAINT book_author_author_number_pk PRIMARY KEY,
author_last VARCHAR2(30),
author_first VARCHAR2(30));

CREATE TABLE book_branch
(branch_number NUMBER(3) 
CONSTRAINT book_branch_branch_number_pk PRIMARY KEY,
branch_name VARCHAR2(30),
branch_location VARCHAR2(30),
number_employees NUMBER(3));

CREATE TABLE book_publisher
(publisher_code CHAR(2) 
CONSTRAINT book_publisher_pub_code_pk PRIMARY KEY,
publisher_name VARCHAR2(30),
publisher_city VARCHAR2(30) DEFAULT 'New York,',
publisher_state CHAR(2) DEFAULT 'NY');

CREATE TABLE book_title
(book_code CHAR(4) 
CONSTRAINT book_title_book_code_pk PRIMARY KEY,
title_name VARCHAR2(30),
publisher_code CHAR(2) 
CONSTRAINT book_title_publisher_code_fk REFERENCES book_publisher(publisher_code),
book_type VARCHAR2(5) 
CONSTRAINT book_title_book_type_fk REFERENCES book_type(book_type),
book_price NUMBER(5, 2) 
CONSTRAINT book_title_book_price_nn NOT NULL,
paperback CHAR(1),
CONSTRAINT book_title_paperback_cc
  CHECK((paperback = 'Y') OR (paperback = 'N')));
  
CREATE TABLE book_invent
(book_code CHAR(4) 
CONSTRAINT book_invent_book_code_fk REFERENCES book_title(book_code),
branch_number NUMBER(3) 
CONSTRAINT book_invent_branch_number_fk REFERENCES book_branch(branch_number),
units_on_hand NUMBER(3),
CONSTRAINT book_invent_bk_code_br_num_pk PRIMARY KEY (book_code, branch_number));
  
CREATE TABLE book_wrote
(book_code CHAR(4) 
CONSTRAINT book_wrote_book_code_fk REFERENCES book_title(book_code),
author_number NUMBER(3) 
CONSTRAINT book_wrote_author_number_fk REFERENCES book_author(author_number),
CONSTRAINT book_wrote_bk_code_auth_num_pk PRIMARY KEY (book_code, author_number));