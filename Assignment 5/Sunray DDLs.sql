/*Sunray Database DDLs - Oracle */

DROP TABLE sunray_rental;
DROP TABLE sunray_video_format;
DROP TABLE sunray_video;
DROP TABLE sunray_format;
DROP TABLE sunray_customer;
DROP TABLE sunray_category;

CREATE TABLE sunray_category
(category_id NUMBER(6) CONSTRAINT category_category_id_pk PRIMARY KEY,
category_desc VARCHAR2(30));

CREATE TABLE sunray_customer
(cust_id NUMBER(6) CONSTRAINT customer_cust_id_pk PRIMARY KEY,
cust_last_name VARCHAR2(30),
cust_first_name VARCHAR2(30),
cust_address VARCHAR2(30),
cust_city VARCHAR2(30),
cust_state CHAR(2),
cust_zip VARCHAR2(10),
cust_phone VARCHAR2(15));

CREATE TABLE sunray_format
(format_id NUMBER(6) CONSTRAINT format_format_id_pk PRIMARY KEY,
format_desc VARCHAR2(20));

CREATE TABLE sunray_video
(video_id NUMBER(6) CONSTRAINT video_video_id_pk PRIMARY KEY,
video_title VARCHAR2(50),
category_id NUMBER(6) CONSTRAINT video_category_id_fk REFERENCES sunray_category(category_id));

CREATE TABLE sunray_video_format
(video_format_id NUMBER(6) CONSTRAINT video_format_id_pk PRIMARY KEY,
video_id NUMBER(6) CONSTRAINT video_format_video_id_fk REFERENCES sunray_video(video_id),
format_id NUMBER(6) CONSTRAINT video_format_format_id_fk REFERENCES sunray_format(format_id),
video_format_cost NUMBER(5,2));

CREATE TABLE sunray_rental
(rental_id NUMBER(6) CONSTRAINT rental_rental_id_pk PRIMARY KEY,
rental_date_out DATE,
rental_date_due DATE,
rental_date_returned DATE,
rental_late_fee NUMBER (5,2),
cust_id NUMBER(6) CONSTRAINT rental_customer_id_fk REFERENCES sunray_customer(cust_id),
video_format_id NUMBER(6) CONSTRAINT rental_video_format_id_fk REFERENCES sunray_video_format(video_format_id));












