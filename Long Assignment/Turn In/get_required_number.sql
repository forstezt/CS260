create or replace
FUNCTION GET_REQUIRED_NUMBER 
  (CURR_MEET_ID IN diver_meet.meet_id%TYPE) 
  
RETURN NUMBER

AS
  required_dives diver_meet.meet_number_dives%TYPE; --Number of dives required from each group
  
BEGIN
  --Stores the required number of dives for this meet
  SELECT meet_number_dives INTO required_dives 
  FROM diver_meet
  WHERE curr_meet_id = meet_id; 
  
  --Returns the required number of dives from each group that corresponds to 
  --meet_number_dives
  IF required_dives = 6 THEN
    return 1;
  ELSE
    return 2;
  END IF;
  
END GET_REQUIRED_NUMBER;