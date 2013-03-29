/*Zach Forster*/
/*CANDY_MYSQL.sql*/

/*Some of these errors occurred so often that I'll just put them up here.
VARCHAR2 is not a datatype in MySQL.  All instances had to be changed to VARCHAR.
When creating primary keys, the CONSTRAINT keyword couldn't be used, and you don't need to name
primary key constraints in MySQL.  I deleted the extra/incorrect syntax and left only 'PRIMARY KEY' afer
after the field and datatype declarations.
NUMBER is not a datatype in MySQL.  All instances in which there were no decimal places
were changed to INT, those with fixed scales were changed to DECIMAL, and in the case of pounds,
which has a varying scale, I changed it to FLOAT.

I added 'IF EXISTS' after all of the 'DROP TABLE' commands because MySQL throws an error
if the table doesn't exist when you try to drop it.*/
DROP TABLE IF EXISTS candy_purchase, 
                    candy_customer,
                    candy_cust_type,
                    candy_product;
                    
CREATE TABLE candy_cust_type
(cust_type VARCHAR(5) PRIMARY KEY,
cust_type_desc VARCHAR(10));

CREATE TABLE candy_customer
(cust_id MEDIUMINT PRIMARY KEY,
cust_name VARCHAR(30),
/*The first error in the line below was that the data type of the cust_type foreign key did not match that
of the corresponding cust_type primary key in the candy_cust_type table.  I changed the data type
to VARCHAR2(5), which matches the data type of the primary key.
The second error here was that candy_cust_type was created after candy_customer, but
a foreign key was created in candy_customer referencing candy_cust_type, which
didn't exist yet.  I fixed this by simply moving candy_cust_type's creation command
to the top of the list.*/
cust_type VARCHAR(5),
cust_addr VARCHAR(30),
cust_zip VARCHAR(15),
cust_phone VARCHAR(15),
/*Foreign keys can only be named and created after the field definitions in MySQL, so I brought that down here.*/
CONSTRAINT candy_customer_cust_type_fk FOREIGN KEY (cust_type) REFERENCES candy_cust_type(cust_type));

CREATE TABLE candy_product
(prod_id MEDIUMINT PRIMARY KEY,
prod_desc VARCHAR(30),
prod_cost DECIMAL(5,2),
prod_price DECIMAL(5,2));

CREATE TABLE candy_purchase
(purch_id MEDIUMINT,
/*The error here was caused by the fact that, in the command to create the candy_product
table, prod_id was not listed as a primary key when it should have been.  This is an issue 
because we are trying to create a foreign key when the corresponding primary key was not 
created yet.  I fixed this by adding 'CONSTRAINT candy_product_prod_id_pk PRIMARY KEY' after
the field and datatype declarations of prod_id in the candy_product table.*/
prod_id MEDIUMINT,
cust_id MEDIUMINT,
purch_date DATE,
delivery_date DATE,
pounds FLOAT,
/* The error here was the fact that the constraint name was longer than 30 characters.
I fixed this by changing it to candy_purchase_purch_prod_pk.*/
CONSTRAINT candy_purchase_purch_prod_pk PRIMARY KEY (purch_id, prod_id),
/*Foreign keys can only be named and created after the field definitions in MySQL, so I brought those down here.*/
CONSTRAINT candy_purchase_prod_id_fk FOREIGN KEY (prod_id) REFERENCES candy_product(prod_id),
CONSTRAINT candy_customer_cust_id_fk FOREIGN KEY (cust_id) REFERENCES candy_customer(cust_id));