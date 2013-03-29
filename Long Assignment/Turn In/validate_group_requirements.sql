create or replace
PROCEDURE VALIDATE_GROUP_REQUIREMENTS 
  (CURR_MEET_ID IN diver_meet.meet_id%TYPE, CURR_DIVER_ID IN diver_diver.diver_id%TYPE) 

AS
    --Creates a cursor to loop through each individual dive group
    CURSOR group_cursor IS
      SELECT group_id, group_desc
      FROM diver_dive_group;
    curr_group group_cursor%ROWTYPE; --Array of group information
    required_number NUMBER; --Required number of dives per group
    e_invalid_group_count EXCEPTION; --Exception for invalid number of dives
    curr_count NUMBER; --Actual number of dives for a group
    
BEGIN
    --Stores the required number of dives from each group
    required_number := get_required_number(curr_meet_id);
    
    --Starts to loop through the different groups
    OPEN group_cursor;
    LOOP
      FETCH group_cursor INTO curr_group;
      EXIT WHEN group_cursor%NOTFOUND;
      
      --Stores the actual number of dives in a diver's dive list for this 
      --particular group
      curr_count := get_current_count(curr_meet_id, curr_diver_id, curr_group.group_id);
      
      BEGIN
        --Checks whether the diver has enough dives from this particular group
        IF curr_count < required_number THEN  --There aren't enough dives
          RAISE e_invalid_group_count;
        END IF;
      
        EXCEPTION
        --Displays the proper error message
        WHEN e_invalid_group_count THEN
          DBMS_OUTPUT.PUT_LINE('*****ERROR:  Diver does not have enough ' || curr_group.group_desc || ' dives ******');
        
      END;
    
    END LOOP;
    
    CLOSE group_cursor;
  
END VALIDATE_GROUP_REQUIREMENTS;