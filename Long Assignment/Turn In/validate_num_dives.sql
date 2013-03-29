create or replace
PROCEDURE VALIDATE_NUM_DIVES 
  (curr_meet_id IN diver_meet.meet_id%TYPE, curr_diver_id IN diver_diver.diver_id%TYPE)
  
AS
  required_dives diver_meet.meet_number_dives%TYPE; --Required number of dives
  curr_num_dives NUMBER; --Actual number of dives
  e_invalid_number_of_dives EXCEPTION; --Exception for invalid number of dives
  
BEGIN
  --Stores the required number of dives for the meet
  SELECT meet_number_dives INTO required_dives 
  FROM diver_meet
  WHERE curr_meet_id = meet_id; 
  
  --Stores the current number of dives in the diver's dive list
  SELECT COUNT(*) INTO curr_num_dives
  FROM (SELECT DISTINCT meet_id, dive_id, diver_id
        FROM diver_meet_dive) dmd 
  JOIN diver_meet dm
  ON dmd.meet_id = dm.meet_id
  WHERE dmd.meet_id = curr_meet_id
  AND dmd.diver_id = curr_diver_id; 
      
  --Checks whether the diver has enough dives
  IF curr_num_dives < required_dives THEN --The diver doesn't have enough dives
    RAISE e_invalid_number_of_dives;
  END IF;
  
  EXCEPTION
    --Prints the correct error message
    WHEN e_invalid_number_of_dives THEN
      DBMS_OUTPUT.PUT_LINE('***** ERROR: DIVER DOES NOT HAVE THE REQUIRED NUMBER OF DIVES FOR MEET*********************');
      DBMS_OUTPUT.PUT_LINE('**********'|| required_dives || ' dives required, diver has '|| curr_num_dives ||'*********************'); 
  
END VALIDATE_NUM_DIVES;