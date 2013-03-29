/*Zach Forster*/
/*CANDY_ORACLE.sql*/

DROP TABLE candy_purchase;
DROP TABLE candy_customer;
DROP TABLE candy_cust_type;
DROP TABLE candy_product;

CREATE TABLE candy_cust_type
(cust_type VARCHAR2(5) 
CONSTRAINT candy_cust_type_cust_type_pk PRIMARY KEY,
cust_type_desc VARCHAR2(10));

CREATE TABLE candy_customer
(cust_id NUMBER(6) 
CONSTRAINT candy_customer_cust_id_pk PRIMARY KEY,
cust_name VARCHAR2(30),
/*The first error in the line below was that the data type of the cust_type foreign key did not match that
of the corresponding cust_type primary key in the candy_cust_type table.  I changed the data type
to VARCHAR2(5), which matches the data type of the primary key.
The second error here was that candy_cust_type was created after candy_customer, but
a foreign key was created in candy_customer referencing candy_cust_type, which
didn't exist yet.  I fixed this by simply moving candy_cust_type's creation command
to the top of the list.*/
cust_type VARCHAR2(5) 
CONSTRAINT candy_customer_cust_type_fk REFERENCES candy_cust_type(cust_type),
cust_addr VARCHAR2(30),
cust_zip VARCHAR2(15),
cust_phone VARCHAR2(15));

CREATE TABLE candy_product
(prod_id NUMBER(6) 
CONSTRAINT candy_product_prod_id_pk PRIMARY KEY,
prod_desc VARCHAR2(30),
prod_cost NUMBER(5,2),
prod_price NUMBER(5,2));

CREATE TABLE candy_purchase
(purch_id NUMBER(6),
/*The error here was caused by the fact that, in the command to create the candy_product
table, prod_id was not listed as a primary key when it should have been.  This is an issue 
because we are trying to create a foreign key when the corresponding primary key was not 
created yet.  I fixed this by adding 'CONSTRAINT candy_product_prod_id_pk PRIMARY KEY' after
the field and datatype declarations of prod_id in the candy_product table.*/
prod_id NUMBER(6) 
CONSTRAINT candy_purchase_prod_id_fk REFERENCES candy_product(prod_id),
cust_id NUMBER(6) 
CONSTRAINT candy_customer_cust_id_fk REFERENCES candy_customer(cust_id),
purch_date DATE,
delivery_date DATE,
pounds NUMBER,
/* The error here was the fact that the constraint name was longer than 30 characters.
I fixed this by changing it to candy_purchase_purch_prod_pk.*/
CONSTRAINT candy_purchase_purch_prod_pk PRIMARY KEY (purch_id, prod_id));