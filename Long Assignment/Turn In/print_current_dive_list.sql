create or replace
PROCEDURE PRINT_CURRENT_DIVE_LIST 
  (CURR_MEET_ID IN diver_meet.meet_id%TYPE, CURR_DIVER_ID IN diver_diver.diver_id%TYPE) 
AS
  --Creates a cursor to loop through each dive for a specific diver and meet
  CURSOR dive_cursor IS
    SELECT dd.dive_desc
    FROM diver_dive dd JOIN diver_meet_dive dmd
    ON dd.dive_id = dmd.dive_id
    WHERE dmd.meet_id = curr_meet_id
    AND dmd.diver_id = curr_diver_id;
  curr_dive dive_cursor%ROWTYPE; --Array of dive descriptions
  
BEGIN
    
    --Prints a header
    DBMS_OUTPUT.PUT_LINE('CURRENT DIVE LIST:');
    
    --Loops through every dive and displays it  
    FOR curr_dive IN dive_cursor
    LOOP
      DBMS_OUTPUT.PUT_LINE('*****' || curr_dive.dive_desc);
    END LOOP;
 
END PRINT_CURRENT_DIVE_LIST;