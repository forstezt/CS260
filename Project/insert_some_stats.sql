INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tom" AND player_last = "Brady"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Passing Yards"),
2012, 2408);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tom" AND player_last = "Brady"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Passing Attempts"),
2012, 320);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tom" AND player_last = "Brady"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Completions"),
2012, 209);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tom" AND player_last = "Brady"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Pass Touchdowns"),
2012, 16);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tom" AND player_last = "Brady"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Rushing Yards"),
2012, 12);



INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Aaron" AND player_last = "Rodgers"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Passing Yards"),
2012, 2165);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Aaron" AND player_last = "Rodgers"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Passing Attempts"),
2012, 297);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Aaron" AND player_last = "Rodgers"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Completions"),
2012, 205);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Aaron" AND player_last = "Rodgers"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Pass Touchdowns"),
2012, 21);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Aaron" AND player_last = "Rodgers"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Rushing Yards"),
2012, 129);



INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tim" AND player_last = "Tebow"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Passing Yards"),
2012, 32);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tim" AND player_last = "Tebow"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Passing Attempts"),
2012, 3);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tim" AND player_last = "Tebow"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Completions"),
2012, 2);

/*INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tim" AND player_last = "Tebow"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Pass Touchdowns"),
2012, 0);*/

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tim" AND player_last = "Tebow"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Rushing Yards"),
2012, 78);




INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Cam" AND player_last = "Newton"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Passing Yards"),
2012, 1701);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Cam" AND player_last = "Newton"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Passing Attempts"),
2012, 212);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Cam" AND player_last = "Newton"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Completions"),
2012, 121);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Cam" AND player_last = "Newton"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Pass Touchdowns"),
2012, 5);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Cam" AND player_last = "Newton"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Rushing Yards"),
2012, 310);



INSERT INTO nfl_player(player_first, player_last, player_dob, position_id)
VALUES ("Tim", "Masthay", "1987-03-16", 8);

INSERT INTO nfl_played(player_id, team_id, played_year)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tim" AND player_last = "Masthay"),
(SELECT team_id FROM nfl_team WHERE team_abbr = "GB"),
2012);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tim" AND player_last = "Masthay"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Passing Yards"),
2012, 27);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tim" AND player_last = "Masthay"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Passing Attempts"),
2012, 2);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tim" AND player_last = "Masthay"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Completions"),
2012, 1);

INSERT INTO nfl_player_stat(player_id,stat_id,player_stat_year,stat_value)
VALUES (
(SELECT player_id FROM nfl_player WHERE player_first = "Tim" AND player_last = "Masthay"),
(SELECT stat_id FROM nfl_stat WHERE stat_name = "Pass Touchdowns"),
2012, 1);

/* no rushing stats for Masthay (yet) */
