create or replace
PROCEDURE SCORE_DIVES 
  (CURR_MEET_ID IN diver_meet.meet_id%TYPE)

AS
  --Creates a cursor to loop through every diver in a particular meet
  CURSOR diver_cursor IS
    SELECT DISTINCT dd.diver_id, dd.diver_name 
    FROM diver_diver dd JOIN diver_meet_dive dmd
    ON dd.diver_id = dmd.diver_id
    WHERE dmd.meet_id = curr_meet_id
    ORDER BY dd.diver_name;
  curr_diver diver_cursor%ROWTYPE; --Array of diver information
  total_meet_score NUMBER; --Total meet score for a diver
  required_score_count NUMBER; --Required number of scores per dive
  
BEGIN
  --Gets the required number of scores for each dive in a particular meet
  required_score_count := get_required_number_of_scores(curr_meet_id);

  --Begins to loop through each diver
  OPEN diver_cursor;
  LOOP
    FETCH diver_cursor INTO curr_diver;
    EXIT WHEN diver_cursor%NOTFOUND;
    
    --Displays a header
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(curr_diver.diver_name);
    DBMS_OUTPUT.PUT_LINE('SCORED DIVES');
    
    --Validates the number of scores for each of the diver's dives and updates them
    validate_scores(curr_meet_id, required_score_count, curr_diver.diver_id);
    
    --Stores the now updated total meet score
    SELECT SUM(dive_score) INTO total_meet_score
    FROM diver_meet_dive
    WHERE meet_id = curr_meet_id
    AND diver_id = curr_diver.diver_id;
  
    IF total_meet_score > 0 THEN
      --Display the total meet score
      DBMS_OUTPUT.PUT_LINE('TOTAL MEET SCORE: ' || total_meet_score);
    ELSE
      --Display nothing
      DBMS_OUTPUT.PUT_LINE('TOTAL MEET SCORE:');
    END IF;
    
  END LOOP;
  
  CLOSE diver_cursor;
  
END SCORE_DIVES;