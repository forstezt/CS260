/* Zach Forster */
/* 9/22/2012 */

/* Exercise 1 */
SELECT DISTINCT invent.branch_number, branch.branch_name, SUM(invent.units_on_hand) AS b_units
FROM cs260user.book_branch branch 
JOIN cs260user.book_invent invent
ON branch.branch_number = invent.branch_number
JOIN cs260user.book_title title
ON title.book_code = invent.book_code
JOIN cs260user.book_type bktype
ON title.book_type = bktype.book_type
WHERE bktype.type_desc LIKE '%Science%'
GROUP BY invent.branch_number, branch.branch_name
ORDER BY SUM(invent.units_on_hand) DESC;

/* Exercise 2 */
SELECT author_first || ' ' || author_last AS author_name, branch_name, title_name, units_on_hand
FROM cs260user.book_author author 
FULL JOIN cs260user.book_wrote wrote
ON wrote.author_number = author.author_number
FULL JOIN cs260user.book_title title
ON title.book_code = wrote.book_code
FULL JOIN cs260user.book_invent invent
ON invent.book_code = title.book_code
FULL JOIN cs260user.book_branch branch
ON branch.branch_number = invent.branch_number
WHERE author.author_number IS NOT NULL
ORDER BY author_last;

/* Exercise 3 */
SELECT author_last, publisher_name AS criteria
FROM cs260user.book_author author 
JOIN cs260user.book_wrote wrote
ON author.author_number = wrote.author_number
JOIN cs260user.book_title title
ON wrote.book_code = title.book_code
JOIN cs260user.book_publisher publisher
ON publisher.publisher_code = title.publisher_code
WHERE publisher_name LIKE '%Books%'
UNION
SELECT author_last, type_desc AS criteria 
FROM cs260user.book_author author 
JOIN cs260user.book_wrote wrote
ON author.author_number = wrote.author_number
JOIN cs260user.book_title title
ON wrote.book_code = title.book_code
JOIN cs260user.book_type bktype
ON bktype.book_type = title.book_type
WHERE type_desc LIKE '%r%'
ORDER BY author_last, criteria DESC;

/* Exercise 4 */
SELECT title.title_name, branch_name
FROM cs260user.book_title title 
JOIN cs260user.book_invent invent
ON title.book_code = invent.book_code
JOIN cs260user.book_branch branch
ON branch.branch_number = invent.branch_number
JOIN (SELECT title_name, COUNT(*) AS branch_count
      FROM cs260user.book_branch branch 
      JOIN cs260user.book_invent invent
      ON branch.branch_number = invent.branch_number
      JOIN cs260user.book_title title
      ON title.book_code = invent.book_code
      GROUP BY title_name) number_of_branches
ON number_of_branches.title_name = title.title_name
WHERE branch_count >= 2
GROUP BY title.title_name, branch_name
ORDER BY title_name;


/* Exercise 5 */
SELECT title.title_name, branch_name
FROM cs260user.book_title title 
JOIN cs260user.book_invent invent
ON title.book_code = invent.book_code
JOIN cs260user.book_branch branch
ON branch.branch_number = invent.branch_number
JOIN (SELECT title_name, COUNT(*) AS branch_count
      FROM cs260user.book_branch branch 
      JOIN cs260user.book_invent invent
      ON branch.branch_number = invent.branch_number
      JOIN cs260user.book_title title
      ON title.book_code = invent.book_code
      GROUP BY title_name) number_of_branches
ON number_of_branches.title_name = title.title_name
WHERE branch_count = 1
GROUP BY title.title_name, branch_name
ORDER BY title_name;