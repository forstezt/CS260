DROP TABLE diver_judge_score;
DROP TABLE diver_judge;
DROP TABLE diver_meet_dive;
DROP TABLE diver_dive;
DROP TABLE diver_dive_group;
DROP TABLE diver_diver;
DROP TABLE diver_meet;

CREATE TABLE diver_meet 
(meet_id NUMBER(6) CONSTRAINT diver_meet_pk PRIMARY KEY,
meet_name VARCHAR2(45),
meet_date DATE,
meet_number_dives NUMBER(2));

CREATE TABLE diver_diver 
(diver_id NUMBER(6) CONSTRAINT diver_diver_pk PRIMARY KEY,
diver_name VARCHAR2(45));

CREATE TABLE diver_dive_group 
(group_id NUMBER(6) CONSTRAINT diver_group_pk PRIMARY KEY,
group_desc VARCHAR2(45));

CREATE TABLE diver_dive 
(dive_id NUMBER(6) CONSTRAINT diver_dive_pk PRIMARY KEY,
dive_desc VARCHAR2(45),
dive_dd NUMBER(2,1),
group_id NUMBER(6) CONSTRAINT diver_dive_group_id_fk REFERENCES diver_dive_group(group_ID));

CREATE TABLE diver_meet_dive 
(dmd_id NUMBER(6) CONSTRAINT diver_meet_dive_pk PRIMARY KEY,
dive_score NUMBER,
diver_id NUMBER(6) CONSTRAINT diver_meet_diver_id_fk REFERENCES diver_diver(diver_ID),
dive_id NUMBER(6) CONSTRAINT diver_meet_dive_id_fk REFERENCES diver_dive(dive_ID),
meet_id NUMBER(6) CONSTRAINT diver_meet_meet_id_fk REFERENCES diver_meet(meet_ID)
);

CREATE TABLE diver_judge
(judge_id NUMBER(6) CONSTRAINT diver_judge_pk PRIMARY KEY,
judge_name VARCHAR2(45));

CREATE TABLE diver_judge_score 
(dmd_id NUMBER(6) CONSTRAINT diver_judge_score_dmd_fk REFERENCES diver_meet_dive(dmd_id),
judge_id NUMBER(6) CONSTRAINT diver_judge_score_judge_fk REFERENCES diver_judge(judge_id),
raw_score NUMBER(3,1),
CONSTRAINT diver_judge_score_djr_pk PRIMARY KEY (dmd_id, judge_id));

INSERT INTO diver_dive_group VALUES
(1, 'Forward');
INSERT INTO diver_dive_group VALUES
(2, 'Back');
INSERT INTO diver_dive_group VALUES
(3, 'Reverse');
INSERT INTO diver_dive_group VALUES
(4, 'Inward');
INSERT INTO diver_dive_group VALUES
(5, 'Twisting');

INSERT INTO diver_meet VALUES
(1, '2012 Summer Olympics', TO_DATE('07/28/2012', 'MM/DD/YYYY'), 11);
INSERT INTO diver_meet VALUES
(2, '2012 Big Rivers Conference', TO_DATE('10/25/2012', 'MM/DD/YYYY'), 11);
INSERT INTO diver_meet VALUES
(3, '2012 EC Memorial Hudson Dual Meet', TO_DATE('9/15/2012', 'MM/DD/YYYY'), 6);

INSERT INTO diver_diver VALUES
(1, 'Greg Louganis');
INSERT INTO diver_diver VALUES
(2, 'Cynthia Potter');
INSERT INTO diver_diver VALUES
(3, 'Laura Wilkinson');
INSERT INTO diver_diver VALUES
(4, 'Lauren Morrison');

INSERT INTO diver_dive VALUES
(1, 'Forward Dive Tucked', 1.2, 1);
INSERT INTO diver_dive VALUES
(2, 'Forward Dive Pike', 1.3, 1);
INSERT INTO diver_dive VALUES
(3, 'Forward Triple Somersault', 2.9, 1);
INSERT INTO diver_dive VALUES
(4, 'Forward Double Somersault Tucked', 2.2, 1);
INSERT INTO diver_dive VALUES
(5, 'Forward 2 1/2 Somersault Tucked', 2.4, 1);
INSERT INTO diver_dive VALUES
(6, 'Back 1 1/2 Somersault Piked', 2.3, 2);
INSERT INTO diver_dive VALUES
(7, 'Back 2 1/2 Somersault Piked', 3.2, 2);
INSERT INTO diver_dive VALUES
(8, 'Back Dive Piked', 1.6, 2);
INSERT INTO diver_dive VALUES
(9, 'Reverse Double Somersault Tucked', 2.3, 3);
INSERT INTO diver_dive VALUES
(10, 'Reverse Dive Tucked', 1.6, 3);
INSERT INTO diver_dive VALUES
(11, 'Reverse 1 1/2 Somersault Piked', 2.4, 3);
INSERT INTO diver_dive VALUES
(12, 'Reverse 2 1/2 Somersault Tucked', 2.3, 3);
INSERT INTO diver_dive VALUES
(13, 'Inward Double Somersault Tucked', 2.8, 4);
INSERT INTO diver_dive VALUES
(14, 'Inward 1 1/2 Somersault Piked', 2.4, 4);
INSERT INTO diver_dive VALUES
(15, 'Inward Dive Straight', 1.8, 4);
INSERT INTO diver_dive VALUES
(16, 'Inward Somersault Piked', 1.7, 4);
INSERT INTO diver_dive VALUES
(17, 'Back 1 1/2 Somersault 1/2 Twist', 2.1, 5);
INSERT INTO diver_dive VALUES
(18, 'Forward 1 1/2 Somersault 1 Twist', 2.2, 5);
INSERT INTO diver_dive VALUES
(19, 'Forward 1 1/2 Somersault 1 Twist', 2.2, 5);
INSERT INTO diver_dive VALUES
(20, 'Back Dive 1/2 Twist', 1.8, 5);
INSERT INTO diver_dive VALUES
(21, 'Reverse 1 1/2 Somersault 1 1/2 Twist', 2.2, 5);

INSERT INTO diver_judge VALUES
(1, 'Al Hudacek');
INSERT INTO diver_judge VALUES
(2, 'Derek Black');
INSERT INTO diver_judge VALUES
(3, 'Jim Miller');
INSERT INTO diver_judge VALUES
(4, 'Tim Miller');
INSERT INTO diver_judge VALUES
(5, 'Slim Miller');

COMMIT;














