create or replace
PROCEDURE VALIDATE_DIVE_LIST 
  (CURR_MEET_ID IN diver_meet.meet_id%TYPE) 
AS 
  --Creates a cursor to loop through each diver for a specific meet
  CURSOR diver_cursor IS
    SELECT DISTINCT dd.diver_id, dd.diver_name 
    FROM diver_diver dd JOIN diver_meet_dive dmd
    ON dd.diver_id = dmd.diver_id
    WHERE dmd.meet_id = curr_meet_id
    ORDER BY dd.diver_name;
  curr_diver diver_cursor%ROWTYPE; --Array of diver information

BEGIN

  --Begins to loop through each diver for a specific meet
  OPEN diver_cursor;
  LOOP
    FETCH diver_cursor INTO curr_diver;
    EXIT WHEN diver_cursor%NOTFOUND;
    
    --Prints a heading
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(curr_diver.diver_name);
    
    --Checks for duplicate dives, an incorrect number of dives, or an incorrect
    --number of dives per group
    validate_duplicate_dives(curr_meet_id, curr_diver.diver_id);
    validate_num_dives(curr_meet_id, curr_diver.diver_id);
    validate_group_requirements(curr_meet_id, curr_diver.diver_id);
    
    --Prints the divers entire dive list
    print_current_dive_list(curr_meet_id, curr_diver.diver_id);
    
  END LOOP;
  CLOSE diver_cursor;
  
END VALIDATE_DIVE_LIST;