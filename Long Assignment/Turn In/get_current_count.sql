create or replace
FUNCTION GET_CURRENT_COUNT 
  (CURR_MEET_ID IN diver_meet.meet_id%TYPE, CURR_DIVER_ID IN diver_diver.diver_id%TYPE, CURR_GROUP_ID IN diver_dive_group.group_id%TYPE)

RETURN NUMBER 

AS 
  curr_count NUMBER; --Number of dives from a particular group

BEGIN
  --Selects the number of dives in a diver's list from a particular group 
  --(and meet)
  SELECT COUNT(*) INTO curr_count
  FROM diver_meet_dive dmd JOIN diver_dive dd
  ON dmd.dive_id = dd.dive_id
  JOIN diver_dive_group ddg
  ON ddg.group_id = dd.group_id
  WHERE dmd.meet_id = curr_meet_id
  AND dmd.diver_id = curr_diver_id
  AND ddg.group_id = curr_group_id;
  
  RETURN curr_count;
  
END GET_CURRENT_COUNT;