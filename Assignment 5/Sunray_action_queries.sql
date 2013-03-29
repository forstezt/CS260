/*Zach Forster*/

/*Commands to drop and create sequences*/
DROP SEQUENCE sunray_category_sequence;
DROP SEQUENCE sunray_format_sequence;
DROP SEQUENCE sunray_customer_sequence;
DROP SEQUENCE sunray_rental_sequence;
DROP SEQUENCE sunray_video_sequence;
DROP SEQUENCE sunray_video_format_sequence;

/*Creating sequence for sunray_category*/
CREATE SEQUENCE sunray_category_sequence
MINVALUE 0
START WITH 0
NOMAXVALUE;
/*Creating sequence for sunray_format*/
CREATE SEQUENCE sunray_format_sequence
MINVALUE 0
START WITH 0
NOMAXVALUE;
/*Creating sequence for sunray_customer*/
CREATE SEQUENCE sunray_customer_sequence
MINVALUE 0
START WITH 0
NOMAXVALUE;
/*Creating sequence for sunray_rental*/
CREATE SEQUENCE sunray_rental_sequence
MINVALUE 0
START WITH 0
NOMAXVALUE;
/*Creating sequence for sunray_video*/
CREATE SEQUENCE sunray_video_sequence
MINVALUE 0
START WITH 0
NOMAXVALUE;
/*Creating sequence for sunray_video_format*/
CREATE SEQUENCE sunray_video_format_sequence
MINVALUE 0
START WITH 0
NOMAXVALUE;




/*Inserting records into sunray_category*/
INSERT INTO sunray_category (category_id, category_desc)
VALUES(sunray_category_sequence.NEXTVAL, 'New Release');
INSERT INTO sunray_category (category_id, category_desc)
VALUES(sunray_category_sequence.NEXTVAL, 'Action');
INSERT INTO sunray_category (category_id, category_desc)
VALUES(sunray_category_sequence.NEXTVAL, 'Horror');
INSERT INTO sunray_category (category_id, category_desc)
VALUES(sunray_category_sequence.NEXTVAL, 'Comedy');
INSERT INTO sunray_category (category_id, category_desc)
VALUES(sunray_category_sequence.NEXTVAL, 'Children''s');




/*Inserting records into sunray_format*/
INSERT INTO sunray_format (format_id, format_desc)
VALUES(sunray_format_sequence.NEXTVAL, 'VHS');
INSERT INTO sunray_format (format_id, format_desc)
VALUES(sunray_format_sequence.NEXTVAL, 'DVD');
INSERT INTO sunray_format (format_id, format_desc)
VALUES(sunray_format_sequence.NEXTVAL, 'Blu-Ray');
INSERT INTO sunray_format (format_id, format_desc)
VALUES(sunray_format_sequence.NEXTVAL, 'Nintendo 64');
INSERT INTO sunray_format (format_id, format_desc)
VALUES(sunray_format_sequence.NEXTVAL, 'Sega');




/*Inserting records into sunray_customer*/
INSERT INTO sunray_customer (cust_id, cust_last_name, cust_first_name, cust_address, cust_city, cust_state, cust_zip, cust_phone)
VALUES(sunray_customer_sequence.NEXTVAL, 'Johnson', 'Edward', '222 Main Street', 'Boston', 'MA', '09222', '2205551212');
INSERT INTO sunray_customer (cust_id, cust_last_name, cust_first_name, cust_address, cust_city, cust_state, cust_zip, cust_phone)
VALUES(sunray_customer_sequence.NEXTVAL, 'Bailey', 'Bill', '4233 Oxford Drive', 'Cheyenne', 'WY', '82001', '3075551212');
INSERT INTO sunray_customer (cust_id, cust_last_name, cust_first_name, cust_address, cust_city, cust_state, cust_zip, cust_phone)
VALUES(sunray_customer_sequence.NEXTVAL, 'Freeman', 'Mary', '9822 Boston Road', 'Austin', 'TX', '54772', '5125551212');
INSERT INTO sunray_customer (cust_id, cust_last_name, cust_first_name, cust_address, cust_city, cust_state, cust_zip, cust_phone)
VALUES(sunray_customer_sequence.NEXTVAL, 'Harrison', 'Susan', '822 Water Street', 'Eau Claire', 'WI', '54703', '7155551212');
INSERT INTO sunray_customer (cust_id, cust_last_name, cust_first_name, cust_address, cust_city, cust_state, cust_zip, cust_phone)
VALUES(sunray_customer_sequence.NEXTVAL, 'Clemons', 'Arlo', '9833 Guthrie Street', 'Enid', 'OK', '77355', '4055551212');




/*Inserting records into sunray_video*/
INSERT INTO sunray_video (video_id, video_title, category_id)
VALUES(sunray_video_sequence.NEXTVAL, 'The Matrix', 
  (SELECT category_id
  FROM sunray_category
  WHERE category_desc = 'Action'));
INSERT INTO sunray_video (video_id, video_title, category_id)
VALUES(sunray_video_sequence.NEXTVAL, 'The Evil', 
  (SELECT category_id
  FROM sunray_category
  WHERE category_desc = 'Horror'));
INSERT INTO sunray_video (video_id, video_title, category_id)
VALUES(sunray_video_sequence.NEXTVAL, 'Super Mario World', 
  (SELECT category_id
  FROM sunray_category
  WHERE category_desc = 'Children''s'));
INSERT INTO sunray_video (video_id, video_title, category_id)
VALUES(sunray_video_sequence.NEXTVAL, 'The Princess Bride', 
  (SELECT category_id
  FROM sunray_category
  WHERE category_desc = 'Children''s'));
INSERT INTO sunray_video (video_id, video_title, category_id)
VALUES(sunray_video_sequence.NEXTVAL, 'Men in Tights', 
  (SELECT category_id
  FROM sunray_category
  WHERE category_desc = 'Comedy'));




/*Inserting records into sunray_video_format*/
INSERT INTO sunray_video_format (video_format_id,video_id, format_id, video_format_cost)
VALUES(sunray_video_format_sequence.NEXTVAL, 
  (SELECT video_id
  FROM sunray_video
  WHERE video_title = 'The Matrix'), 
  
  (SELECT format_id
  FROM sunray_format
  WHERE format_desc = 'VHS'), 0.99);
INSERT INTO sunray_video_format (video_format_id,video_id, format_id, video_format_cost)
VALUES(sunray_video_format_sequence.NEXTVAL, 
  (SELECT video_id
  FROM sunray_video
  WHERE video_title = 'The Matrix'), 
  
  (SELECT format_id
  FROM sunray_format
  WHERE format_desc = 'DVD'), 2.99);
INSERT INTO sunray_video_format (video_format_id,video_id, format_id, video_format_cost)
VALUES(sunray_video_format_sequence.NEXTVAL, 
  (SELECT video_id
  FROM sunray_video
  WHERE video_title = 'The Evil'), 
  
  (SELECT format_id
  FROM sunray_format
  WHERE format_desc = 'VHS'), 1.99);
INSERT INTO sunray_video_format (video_format_id,video_id, format_id, video_format_cost)
VALUES(sunray_video_format_sequence.NEXTVAL, 
  (SELECT video_id
  FROM sunray_video
  WHERE video_title = 'The Evil'), 
  
  (SELECT format_id
  FROM sunray_format
  WHERE format_desc = 'Blu-Ray'), 3.99);
INSERT INTO sunray_video_format (video_format_id,video_id, format_id, video_format_cost)
VALUES(sunray_video_format_sequence.NEXTVAL, 
  (SELECT video_id
  FROM sunray_video
  WHERE video_title = 'Super Mario World'), 
  
  (SELECT format_id
  FROM sunray_format
  WHERE format_desc = 'Nintendo 64'), 1.59);




/*Inserting records into sunray_rental*/

/*Note:  The instructions seemed to state that simply using the 
cust_last_name field as an identifier for a foreign key here was
acceptable for this database. Therefore, I did not deem it necessary
to use both the first and last name, which would remove the possibility
of errors due to 2 customers sharing a last name.*/
INSERT INTO sunray_rental (rental_id, rental_date_out, rental_date_due, rental_date_returned, rental_late_fee, cust_id, video_format_id)
VALUES(sunray_rental_sequence.NEXTVAL, TO_DATE('22-SEP-12', 'DD-MON-YY'), TO_DATE('24-SEP-12', 'DD-MON-YY'), TO_DATE('24-SEP-12', 'DD-MON-YY'), 0, 
  (SELECT cust_id
  FROM sunray_customer
  WHERE cust_last_name = 'Johnson'),
  
  (SELECT video_format_id
  FROM sunray_video_format
  WHERE video_id = 
      (SELECT video_id
      FROM sunray_video
      WHERE video_title = 'The Evil')
  AND format_id = 
      (SELECT format_id
      FROM sunray_format
      WHERE format_desc = 'VHS')));  
INSERT INTO sunray_rental (rental_id, rental_date_out, rental_date_due, rental_late_fee, cust_id, video_format_id)
VALUES(sunray_rental_sequence.NEXTVAL, TO_DATE('23-SEP-12', 'DD-MON-YY'), TO_DATE('25-SEP-12', 'DD-MON-YY'), 1, 
  (SELECT cust_id
  FROM sunray_customer
  WHERE cust_last_name = 'Johnson'),
  
  (SELECT video_format_id
  FROM sunray_video_format
  WHERE video_id = 
      (SELECT video_id
      FROM sunray_video
      WHERE video_title = 'The Evil')
  AND format_id = 
      (SELECT format_id
      FROM sunray_format
      WHERE format_desc = 'Blu-Ray')));
INSERT INTO sunray_rental (rental_id, rental_date_out, rental_date_due, rental_date_returned, rental_late_fee, cust_id, video_format_id)
VALUES(sunray_rental_sequence.NEXTVAL, TO_DATE('25-SEP-12', 'DD-MON-YY'), TO_DATE('27-SEP-12', 'DD-MON-YY'), TO_DATE('26-SEP-12', 'DD-MON-YY'), 0, 
  (SELECT cust_id
  FROM sunray_customer
  WHERE cust_last_name = 'Bailey'),
  
  (SELECT video_format_id
  FROM sunray_video_format
  WHERE video_id = 
      (SELECT video_id
      FROM sunray_video
      WHERE video_title = 'The Evil')
  AND format_id = 
      (SELECT format_id
      FROM sunray_format
      WHERE format_desc = 'VHS')));
INSERT INTO sunray_rental (rental_id, rental_date_out, rental_date_due, rental_date_returned, rental_late_fee, cust_id, video_format_id)
VALUES(sunray_rental_sequence.NEXTVAL, TO_DATE('25-SEP-12', 'DD-MON-YY'), TO_DATE('27-SEP-12', 'DD-MON-YY'), TO_DATE('26-SEP-12', 'DD-MON-YY'), 0, 
  (SELECT cust_id
  FROM sunray_customer
  WHERE cust_last_name = 'Bailey'),
  
  (SELECT video_format_id
  FROM sunray_video_format
  WHERE video_id = 
      (SELECT video_id
      FROM sunray_video
      WHERE video_title = 'Super Mario World')
  AND format_id = 
      (SELECT format_id
      FROM sunray_format
      WHERE format_desc = 'Nintendo 64')));
INSERT INTO sunray_rental (rental_id, rental_date_out, rental_date_due, rental_late_fee, cust_id, video_format_id)
VALUES(sunray_rental_sequence.NEXTVAL, TO_DATE('27-SEP-12', 'DD-MON-YY'), TO_DATE('27-SEP-12', 'DD-MON-YY'), 1, 
  (SELECT cust_id
  FROM sunray_customer
  WHERE cust_last_name = 'Bailey'),
  
  (SELECT video_format_id
  FROM sunray_video_format
  WHERE video_id = 
      (SELECT video_id
      FROM sunray_video
      WHERE video_title = 'The Evil')
  AND format_id = 
      (SELECT format_id
      FROM sunray_format
      WHERE format_desc = 'Blu-Ray')));


/*Committing Changes to database*/
COMMIT;