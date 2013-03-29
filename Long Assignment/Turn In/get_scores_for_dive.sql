create or replace
FUNCTION GET_SCORES_FOR_DIVE
  (CURR_DMD_ID IN diver_meet_dive.dmd_id%TYPE)

RETURN NUMBER 

AS 
  num_scores NUMBER; --Number of scores for a dive

BEGIN
  --Selects the number of scores that a particular dive has 
  SELECT COUNT(*) INTO num_scores
  FROM diver_judge_score djs JOIN diver_meet_dive dmd
  ON djs.dmd_id = dmd.dmd_id
  WHERE djs.dmd_id = curr_dmd_id;
  
  --Returns the number of scores
  RETURN num_scores;
  
END GET_SCORES_FOR_DIVE;