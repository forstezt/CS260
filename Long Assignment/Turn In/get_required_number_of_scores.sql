create or replace
FUNCTION GET_REQUIRED_NUMBER_OF_SCORES 
  (CURR_MEET_ID IN diver_meet.meet_id%TYPE) 
  
RETURN NUMBER

AS
  required_dives diver_meet.meet_number_dives%TYPE; --Number of dives required from each group
  
BEGIN
  --Selects the number of dives for a particular meet
  SELECT meet_number_dives INTO required_dives 
  FROM diver_meet
  WHERE curr_meet_id = meet_id; 
  
  --Matches the required number of scores to the required number of dives in the meet
  --and returns it
  IF required_dives = 6 THEN
    return 3;
  ELSE
    return 5;
  END IF;
  
END GET_REQUIRED_NUMBER_OF_SCORES;