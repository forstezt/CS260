DELETE FROM diver_meet_dive;

--sample data for an 11-dive meet
--valid list for Greg Louganis
INSERT INTO diver_meet_dive VALUES
(100, NULL, 1, 1, 1);
INSERT INTO diver_meet_dive VALUES
(101, NULL, 1, 2, 1);
INSERT INTO diver_meet_dive VALUES
(102, NULL, 1, 6, 1);
INSERT INTO diver_meet_dive VALUES
(103, NULL, 1, 7, 1);
INSERT INTO diver_meet_dive VALUES
(104, NULL, 1, 10, 1);
INSERT INTO diver_meet_dive VALUES
(105, NULL, 1, 11, 1);
INSERT INTO diver_meet_dive VALUES
(106, NULL, 1, 13, 1);
INSERT INTO diver_meet_dive VALUES
(107, NULL, 1, 14, 1);
INSERT INTO diver_meet_dive VALUES
(108, NULL, 1, 16, 1);
INSERT INTO diver_meet_dive VALUES
(109, NULL, 1, 17, 1);
INSERT INTO diver_meet_dive VALUES
(110, NULL, 1, 18, 1);


--invalid list, not enough dives for Cynthia Potter
--INSERT INTO diver_meet_dive VALUES
--(111, NULL, 2, 1, 1);
INSERT INTO diver_meet_dive VALUES
(112, NULL, 2, 2, 1);
INSERT INTO diver_meet_dive VALUES
(113, NULL, 2, 6, 1);
INSERT INTO diver_meet_dive VALUES
(114, NULL, 2, 7, 1);
INSERT INTO diver_meet_dive VALUES
(115, NULL, 2, 10, 1);
INSERT INTO diver_meet_dive VALUES
(116, NULL, 2, 11, 1);
INSERT INTO diver_meet_dive VALUES
(117, NULL, 2, 13, 1);
INSERT INTO diver_meet_dive VALUES
(118, NULL, 2, 14, 1);
INSERT INTO diver_meet_dive VALUES
(119, NULL, 2, 16, 1);
INSERT INTO diver_meet_dive VALUES
(120, NULL, 2, 17, 1);
INSERT INTO diver_meet_dive VALUES
(121, NULL, 2, 1, 1);

--invalid list, wrong groups for Laura Wilkinson
INSERT INTO diver_meet_dive VALUES
(150, NULL, 3, 1, 1);
INSERT INTO diver_meet_dive VALUES
(151, NULL,3, 2, 1);
INSERT INTO diver_meet_dive VALUES
(152, NULL, 3, 3, 1);
INSERT INTO diver_meet_dive VALUES
(153, NULL, 3, 4, 1);
INSERT INTO diver_meet_dive VALUES
(154, NULL, 3, 9, 1);
INSERT INTO diver_meet_dive VALUES
(155, NULL, 3, 6, 1);
INSERT INTO diver_meet_dive VALUES
(156, NULL, 3, 15, 1);
INSERT INTO diver_meet_dive VALUES
(157, NULL, 3, 7, 1);
INSERT INTO diver_meet_dive VALUES
(158, NULL, 3, 8, 1);
INSERT INTO diver_meet_dive VALUES
(159, NULL, 3, 10, 1);
INSERT INTO diver_meet_dive VALUES
(160, NULL, 3, 11, 1);

--invalid list, wrong groups and has dives for Lauren Morrison
INSERT INTO diver_meet_dive VALUES
(161, NULL, 4, 1, 1);
INSERT INTO diver_meet_dive VALUES
(162, NULL,4, 1, 1);
INSERT INTO diver_meet_dive VALUES
(163, NULL, 4, 3, 1);
INSERT INTO diver_meet_dive VALUES
(164, NULL, 4, 3, 1);
INSERT INTO diver_meet_dive VALUES
(165, NULL, 4, 9, 1);
INSERT INTO diver_meet_dive VALUES
(166, NULL, 4, 6, 1);
INSERT INTO diver_meet_dive VALUES
(167, NULL, 4, 15, 1);
INSERT INTO diver_meet_dive VALUES
(168, NULL, 4, 8, 1);
INSERT INTO diver_meet_dive VALUES
(169, NULL, 4, 2, 1);
INSERT INTO diver_meet_dive VALUES
(170, NULL, 4, 18, 1);
INSERT INTO diver_meet_dive VALUES
(171, NULL, 4, 11, 1);



--sample data for a 6-dive meet
--invalid list, duplicate dives
INSERT INTO diver_meet_dive VALUES
(300, NULL, 1, 6, 3);
INSERT INTO diver_meet_dive VALUES
(301, NULL, 1, 3, 3);
INSERT INTO diver_meet_dive VALUES
(302, NULL, 1, 14, 3);
INSERT INTO diver_meet_dive VALUES
(303, NULL, 1, 14, 3);
INSERT INTO diver_meet_dive VALUES
(304, NULL, 1, 17, 3);
INSERT INTO diver_meet_dive VALUES
(305, NULL, 1, 6, 3);

--invalid list, wrong groups
INSERT INTO diver_meet_dive VALUES
(400, NULL, 2, 1, 3);
INSERT INTO diver_meet_dive VALUES
(401, NULL, 2, 3, 3);
INSERT INTO diver_meet_dive VALUES
(402, NULL, 2, 5, 3);
INSERT INTO diver_meet_dive VALUES
(403, NULL, 2, 6, 3);
INSERT INTO diver_meet_dive VALUES
(404, NULL, 2, 8, 3);
INSERT INTO diver_meet_dive VALUES
(405, NULL, 2, 11, 3);

--valid list
INSERT INTO diver_meet_dive VALUES
(406, NULL, 3, 1, 3);
INSERT INTO diver_meet_dive VALUES
(407, NULL, 3, 8, 3);
INSERT INTO diver_meet_dive VALUES
(408, NULL, 3, 13, 3);
INSERT INTO diver_meet_dive VALUES
(409, NULL, 3, 16, 3);
INSERT INTO diver_meet_dive VALUES
(410, NULL, 3, 21, 3);
INSERT INTO diver_meet_dive VALUES
(411, NULL, 3, 11, 3);
COMMIT;











