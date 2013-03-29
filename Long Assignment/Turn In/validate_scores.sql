create or replace
PROCEDURE VALIDATE_SCORES 
  (CURR_MEET_ID IN diver_meet.meet_id%TYPE, REQUIRED_SCORE_COUNT IN NUMBER, CURR_DIVER_ID IN diver_diver.diver_id%TYPE)

AS
  --Creating a cursor to loop through the dives for a particular diver and meet
  CURSOR dive_cursor IS
    SELECT dmd.dive_id, dd.dive_desc, dmd.dmd_id
    FROM diver_meet_dive dmd JOIN diver_dive dd
    ON dmd.dive_id = dd.dive_id
    WHERE dmd.meet_id = curr_meet_id
    AND dmd.diver_id = curr_diver_id;
  curr_dive dive_cursor%ROWTYPE; --Array of dive information
  num_scores NUMBER; --Number of scores for a dive

BEGIN
  --Beginning to loop through the dives    
  OPEN dive_cursor;
  LOOP
    FETCH dive_cursor INTO curr_dive;
    EXIT WHEN dive_cursor%NOTFOUND;
    
    --Get the number of scores for this particular dive    
    num_scores := get_scores_for_dive(curr_dive.dmd_id);
    
    --Start a new block, so that exceptions can be thrown safely    
    DECLARE
      e_invalid_number_of_scores EXCEPTION;
      e_no_scores EXCEPTION;
      
    BEGIN
      IF num_scores != required_score_count THEN --The dive has an incorrect number of scores
        IF num_scores = 0 THEN --The dive has no scores
          --Raise an exception
          RAISE e_no_scores;
          
        ELSE --The dive has scores, but not the correct number
          --Raise an exception
          RAISE e_invalid_number_of_scores;
          
        END IF;
        
      END IF;
       
      --FROM HERE ON OUT, THE DIVE HAS THE CORRECT NUMBER OF SCORES
      IF required_score_count = 3 THEN
        --Score the dive without throwing out scores
        score_with_three_judges(curr_dive.dmd_id);
        
      ELSE
        --Throw out the high and low scores, and then score the dive
        score_with_five_judges(curr_dive.dmd_id);
        
      END IF;
       
      EXCEPTION
        --Display an error message for an incorrect number of scores (but not 0)
        WHEN e_invalid_number_of_scores THEN
          DBMS_OUTPUT.PUT_LINE(curr_dive.dive_desc || 'ERROR:  INCORRECT NUMBER OF RAW SCORES ENTERED');
        
        --Display an error message for 0 scores  
        WHEN e_no_scores THEN
          DBMS_OUTPUT.PUT_LINE(curr_dive.dive_desc || ' SCORE:');
          
    END;
        
  END LOOP;
  
  CLOSE dive_cursor;
          
END VALIDATE_SCORES;