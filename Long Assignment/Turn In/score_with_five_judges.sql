create or replace
PROCEDURE SCORE_WITH_FIVE_JUDGES 
  (CURR_DMD_ID IN diver_meet_dive.dmd_id%TYPE)

AS
  score NUMBER; --Calculated score for dive
  curr_dive_desc diver_dive.dive_desc%TYPE; --Description of dive
  curr_score diver_meet_dive.dive_score%TYPE; --Current score for dive

BEGIN
  
  --Stores the current dive description
  SELECT dd.dive_desc INTO curr_dive_desc
  FROM diver_dive dd JOIN diver_meet_dive dmd
  ON dd.dive_id = dmd.dive_id
  WHERE dmd.dmd_id = curr_dmd_id;  
  
  --Stores the dive score for this specific dmd_id
  SELECT dive_score INTO curr_score
  FROM diver_meet_dive
  WHERE dmd_id = curr_dmd_id;
  
  --Updates the score in the diver_meet_dive table if the score is null
  IF curr_score IS NULL THEN
    --Stores the score, calculated by adding up the middle 3 raw scores and 
    --multiplying that sum by the difficulty of the dive
    SELECT ((SUM(djs.raw_score) - MAX(djs.raw_score) - MIN(djs.raw_score)) * dd.dive_dd) INTO score
    FROM diver_judge_score djs JOIN diver_meet_dive dmd
    ON djs.dmd_id = dmd.dmd_id
    JOIN diver_dive dd
    ON dd.dive_id = dmd.dive_id
    WHERE djs.dmd_id = curr_dmd_id
    GROUP BY dd.dive_dd;
    
    --Prints the dive description and the accompanying score
    DBMS_OUTPUT.PUT_LINE(curr_dive_desc || ' SCORE: ' || score);
    
    --Updates score
    UPDATE diver_meet_dive
    SET dive_score = score
    WHERE dmd_id = curr_dmd_id;    
    
    --Commits the transaction
    COMMIT;
  
  ELSE --The dive has already been scored
    --Prints the dive description and the accompanying score  
    DBMS_OUTPUT.PUT_LINE(curr_dive_desc || ' SCORE: ' || curr_score);
  
  END IF;
  
END SCORE_WITH_FIVE_JUDGES;