CREATE OR REPLACE PACKAGE BODY meet_scoring_package IS
  FUNCTION GET_CURRENT_COUNT 
   (CURR_MEET_ID IN diver_meet.meet_id%TYPE, CURR_DIVER_ID IN diver_diver.diver_id%TYPE, CURR_GROUP_ID IN diver_dive_group.group_id%TYPE)

  RETURN VARCHAR2 
  
  AS 
    curr_count NUMBER;
  
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
  
  FUNCTION GET_REQUIRED_NUMBER 
  (CURR_MEET_ID IN diver_meet.meet_id%TYPE) 

  RETURN NUMBER

  AS
    required_dives diver_meet.meet_number_dives%TYPE;

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
  
  FUNCTION GET_REQUIRED_NUMBER_OF_SCORES 
    (CURR_MEET_ID IN diver_meet.meet_id%TYPE) 
  
  RETURN NUMBER

  AS
    required_dives diver_meet.meet_number_dives%TYPE;
  
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
  
  FUNCTION GET_SCORES_FOR_DIVE
    (CURR_DMD_ID IN diver_meet_dive.dmd_id%TYPE)

  RETURN NUMBER 

  AS 
    num_judges NUMBER;

  BEGIN
    --Selects the number of scores that a particular dive has 
    SELECT COUNT(*) INTO num_judges
    FROM diver_judge_score djs JOIN diver_meet_dive dmd
    ON djs.dmd_id = dmd.dmd_id
    WHERE djs.dmd_id = curr_dmd_id;
  
    --Returns the number of scores
    RETURN num_judges;
  
  END GET_SCORES_FOR_DIVE;
  
  
  
  PROCEDURE PRINT_CURRENT_DIVE_LIST 
    (CURR_MEET_ID IN diver_meet.meet_id%TYPE, CURR_DIVER_ID IN diver_diver.diver_id%TYPE) 
  AS
    --Creates a cursor to loop through each dive for a specific diver and meet
    CURSOR dive_cursor IS
      SELECT dd.dive_desc
      FROM diver_dive dd JOIN diver_meet_dive dmd
      ON dd.dive_id = dmd.dive_id
      WHERE dmd.meet_id = curr_meet_id
      AND dmd.diver_id = curr_diver_id;
    curr_dive dive_cursor%ROWTYPE;
  
  BEGIN
    
    --Prints a header
    DBMS_OUTPUT.PUT_LINE('CURRENT DIVE LIST:');
    
    --Loops through every dive and displays it  
    FOR curr_dive IN dive_cursor
    LOOP
      DBMS_OUTPUT.PUT_LINE('*****' || curr_dive.dive_desc);
    END LOOP;
 
  END PRINT_CURRENT_DIVE_LIST;
  
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
    curr_diver diver_cursor%ROWTYPE;
    total_meet_score NUMBER;
    required_score_count NUMBER;
  
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
  
  PROCEDURE VALIDATE_DIVE_LIST 
    (CURR_MEET_ID IN diver_meet.meet_id%TYPE) 
  AS 
    --Creates a cursor to loop through each diver for a specific meet
    CURSOR diver_cursor IS
      SELECT DISTINCT dd.diver_id, dd.diver_name 
      FROM diver_diver dd JOIN diver_meet_dive dmd
      ON dd.diver_id = dmd.diver_id
      WHERE dmd.meet_id = curr_meet_id
      ORDER BY dd.diver_name;
    curr_diver diver_cursor%ROWTYPE;

  BEGIN

    --Begins to loop through each diver for a specific meet
    OPEN diver_cursor;
    LOOP
      FETCH diver_cursor INTO curr_diver;
      EXIT WHEN diver_cursor%NOTFOUND;
    
      --Prints a heading
      DBMS_OUTPUT.PUT_LINE('');
      DBMS_OUTPUT.PUT_LINE(curr_diver.diver_name);
    
      --Checks for duplicate dives, an incorrect number of dives, or an incorrect
      --number of dives per group
      validate_duplicate_dives(curr_meet_id, curr_diver.diver_id);
      validate_num_dives(curr_meet_id, curr_diver.diver_id);
      validate_group_requirements(curr_meet_id, curr_diver.diver_id);
    
      --Prints the divers entire dive list
      print_current_dive_list(curr_meet_id, curr_diver.diver_id);
    
    END LOOP;
    CLOSE diver_cursor;
  
  END VALIDATE_DIVE_LIST;
  
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
    curr_dive dive_cursor%ROWTYPE;
    first_duplicate_found NUMBER;
  
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
  
  PROCEDURE VALIDATE_GROUP_REQUIREMENTS 
    (CURR_MEET_ID IN diver_meet.meet_id%TYPE, CURR_DIVER_ID IN diver_diver.diver_id%TYPE) 

  AS
    --Creates a cursor to loop through each individual dive group
    CURSOR group_cursor IS
      SELECT group_id, group_desc
      FROM diver_dive_group;
    curr_group group_cursor%ROWTYPE;
    required_number NUMBER;
    e_invalid_group_count EXCEPTION;
    curr_count NUMBER;
    
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
  
  PROCEDURE VALIDATE_JUDGES 
    (CURR_MEET_ID IN diver_meet.meet_id%TYPE, REQUIRED_SCORE_COUNT IN NUMBER, CURR_DIVER_ID IN diver_diver.diver_id%TYPE)

  AS
    CURSOR dive_cursor IS
      SELECT dmd.dive_id, dd.dive_desc, dmd.dmd_id
      FROM diver_meet_dive dmd JOIN diver_dive dd
      ON dmd.dive_id = dd.dive_id
      WHERE dmd.meet_id = curr_meet_id
      AND dmd.diver_id = curr_diver_id;
    curr_dive dive_cursor%ROWTYPE;
    num_scores NUMBER;
  
  BEGIN
        
    OPEN dive_cursor;
    LOOP
      FETCH dive_cursor INTO curr_dive;
      EXIT WHEN dive_cursor%NOTFOUND;
          
      num_scores := get_scores_for_dive(curr_dive.dmd_id);
          
      DECLARE
        e_invalid_number_of_scores EXCEPTION;
        e_no_scores EXCEPTION;
      BEGIN
        IF num_scores != required_score_count THEN
          IF num_scores = 0 THEN
            RAISE e_no_scores;
          ELSE
            RAISE e_invalid_number_of_scores;
          END IF;
        END IF;
            
        IF required_score_count = 3 THEN
          score_with_three_judges(curr_dive.dmd_id);
        ELSE
          score_with_five_judges(curr_dive.dmd_id);
        END IF;
            
        EXCEPTION
          WHEN e_invalid_number_of_scores THEN
            DBMS_OUTPUT.PUT_LINE(curr_dive.dive_desc || 'ERROR:  INCORRECT NUMBER OF RAW SCORES ENTERED');
          WHEN e_no_scores THEN
            DBMS_OUTPUT.PUT_LINE(curr_dive.dive_desc || ' SCORE:');
            
      END;
          
    END LOOP;
            
  END VALIDATE_JUDGES;
  
  PROCEDURE VALIDATE_NUM_DIVES 
    (curr_meet_id IN diver_meet.meet_id%TYPE, curr_diver_id IN diver_diver.diver_id%TYPE)
    
  AS
    required_dives diver_meet.meet_number_dives%TYPE;
    curr_num_dives NUMBER;
    e_invalid_number_of_dives EXCEPTION;
    
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
  
  PROCEDURE VALIDATE_SCORES 
    (CURR_MEET_ID IN diver_meet.meet_id%TYPE, REQUIRED_SCORE_COUNT IN NUMBER, CURR_DIVER_ID IN diver_diver.diver_id%TYPE)
  
  AS
    --Creating a cursor to loop through the unscored dives for a particular diver and meet
    CURSOR dive_cursor IS
      SELECT dmd.dive_id, dd.dive_desc, dmd.dmd_id
      FROM diver_meet_dive dmd JOIN diver_dive dd
      ON dmd.dive_id = dd.dive_id
      WHERE dmd.meet_id = curr_meet_id
      AND dmd.diver_id = curr_diver_id;
    curr_dive dive_cursor%ROWTYPE;
    num_scores NUMBER;
  
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
            
  END VALIDATE_SCORES;

END;
    