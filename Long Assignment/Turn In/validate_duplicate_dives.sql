create or replace
PROCEDURE VALIDATE_DUPLICATE_DIVES 
  (CURR_MEET_ID IN diver_meet.meet_id%TYPE, CURR_DIVER_ID IN diver_diver.diver_id%TYPE)
  
AS
  --Stores every dive in a diver's dive list that occurs more than once
  CURSOR dive_cursor IS
    SELECT dmd.dive_id, dd.dive_desc, COUNT(*)
    FROM diver_meet_dive dmd JOIN diver_dive dd
    ON dmd.dive_id = dd.dive_id
    WHERE dmd.diver_id = curr_diver_id
    AND dmd.meet_id = curr_meet_id
    GROUP BY dmd.dive_id, dd.dive_desc
    HAVING COUNT(*) > 1;
  curr_dive dive_cursor%ROWTYPE; --Array of dive information
  first_duplicate_found NUMBER; --Whether or not there are any duplicates
  
BEGIN
      --Sets first_duplicate found to false
      first_duplicate_found := 1;

      --If there are any duplicate dives (any dives stored in dive_cursor), 
      --raises the proper exception
      OPEN dive_cursor;
      LOOP
        FETCH dive_cursor INTO curr_dive;
        EXIT WHEN dive_cursor%NOTFOUND;
                
        --FROM HERE ON OUT, THERE ARE DIVES IN DIVE_CURSOR, SO THERE ARE
        --DUPLICATE DIVES IN THE DIVER'S DIVE LIST
        
        --Prints a header at the top of the list, then sets first_duplicate_found
        --equal to true
        IF first_duplicate_found = 1 THEN
          DBMS_OUTPUT.PUT_LINE('***** ERROR:  DIVER HAS DUPLICATE DIVE(S) IN LIST *********************');
          first_duplicate_found := 0;
        END IF;
        
        --Displays the current dive
        DBMS_OUTPUT.PUT_LINE('*****' || curr_dive.dive_desc);
        
      END LOOP;
      
      CLOSE dive_cursor;   

END VALIDATE_DUPLICATE_DIVES;