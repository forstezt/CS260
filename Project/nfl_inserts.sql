INSERT INTO nfl_admin(admin_username, admin_password)
VALUES ('wisbymn', 'matt password'),
       ('forstezt', 'zach password'),
       ('schemmim', 'isaac password'),
       ('kubicect', 'cody password');

INSERT INTO nfl_team (team_nickname, team_location, team_conference, team_division, team_abbr, team_owner)
VALUES ('Packers', 'Green Bay', 'NFC', 'North', 'GB', 'Green Bay Packers, Inc.'),
	   ('Bears', 'Chicago', 'NFC', 'North', 'CHI', 'Virginia Halas McCaskey'),
	   ('Vikings', 'Minnesota', 'NFC', 'North', 'MIN', 'Zygi Wilf'),
	   ('Lions', 'Detroit', 'NFC', 'North', 'DET', 'William Clay Ford Sr.'),
	   ('Cowboys', 'Dallas', 'NFC', 'East', 'DAL', 'Jerry Jones'),
	   ('Giants', 'New York', 'NFC', 'East', 'NYG', 'John Mara and Steve Tisch'),
	   ('Eagles', 'Philadelphia', 'NFC', 'East', 'PHI', 'Jeffrey Lurie'),
	   ('Redskins', 'Washington', 'NFC', 'East', 'WAS', 'Dan Snyder'),
	   ('Saints', 'New Orleans', 'NFC', 'South', 'NO', 'Tom Benson'),
	   ('Falcons', 'Atlanta', 'NFC', 'South', 'ATL', 'Arthur Blank'),
	   ('Panthers', 'Carolina', 'NFC', 'South', 'CAR', 'Jerry Richardson'),
	   ('Buccaneers', 'Tampa Bay', 'NFC', 'South', 'TB', 'Malcolm Glazer'),
	   ('49ers', 'San Francisco', 'NFC', 'West', 'SF', 'Jed York'),
	   ('Rams', 'St. Louis', 'NFC', 'West', 'STL', 'Stan Kroenke'),
	   ('Seahawks', 'Seattle', 'NFC', 'West', 'SEA', 'Paul Allen'),
	   ('Cardinals', 'Arizona', 'NFC', 'West', 'ARI', 'Bill Bidwill'),
	   ('Steelers', 'Pittsburgh', 'AFC', 'North', 'PIT', 'Dan Rooney'),
	   ('Ravens', 'Baltimore', 'AFC', 'North', 'BAL', 'Steve Bisciotti'),
	   ('Bengals', 'Cincinnati', 'AFC', 'North', 'CIN', 'Mike Brown'),
	   ('Browns', 'Cleveland', 'AFC', 'North', 'CLE', 'Jimmy Haslam'),
	   ('Jets', 'New York', 'AFC', 'East', 'NYJ', 'Robert Wood Johnson IV'),
	   ('Patriots', 'New England', 'AFC', 'East', 'NE', 'Robert Kraft'),
	   ('Bills', 'Buffalo', 'AFC', 'East', 'BUF', 'Ralph Wilson'),
	   ('Dolphins', 'Miami', 'AFC', 'East', 'MIA', 'Stephen M. Ross'),
	   ('Texans', 'Houston', 'AFC', 'South', 'HOU', 'Robert C. McNair'),
	   ('Colts', 'Indianapolis', 'AFC', 'South', 'IND', 'Jim Irsay'),
	   ('Titans', 'Tennessee', 'AFC', 'South', 'TEN', 'Bud Adams'),
	   ('Jaguars', 'Jacksonville', 'AFC', 'South', 'JAX', 'Shahid Khan'),
	   ('Chiefs', 'Kansas City', 'AFC', 'West', 'KC', 'Clark Hunt'),
	   ('Raiders', 'Oakland', 'AFC', 'West', 'OAK', 'Carol and Mark Davis'),
	   ('Chargers', 'San Diego', 'AFC', 'West', 'SD', 'Alex Spanos'),
	   ('Broncos', 'Denver', 'AFC', 'West', 'DEN', 'Pat Bowlen');

SELECT 
    *
FROM
    nfl_team;

INSERT INTO NFL_POSITION(position_abbr, position_name)
VALUES ('QB', 'Quarterback'),
	   ('RB', 'Running back'),
	   ('FB', 'Full back'),
	   ('WR', 'Wide Reciever'),
	   ('TE', 'Tight End'),
	   ('OL', 'Offensive Lineman'),
	   ('K', 'Kicker'),
	   ('P', 'Punter'),
	   ('S', 'Safety'),
	   ('CB', 'Cornerback'),
	   ('LB', 'Linebacker'),
	   ('DT', 'Defensive Tackle'),
	   ('DE', 'Defensive End');

SELECT 
    *
FROM
    nfl_position;

INSERT INTO nfl_stat_category(stat_category_desc, stat_category_type)
VALUES ('Passing', 'Offense'),
	   ('Rushing', 'Offense'),
	   ('Receiving', 'Offense'),
	   ('Return', 'Special Teams'),
	   ('Kicking', 'Special Teams'),
	   ('Punting', 'Special Teams'),
	   ('Defense', 'Defense');

SELECT 
    *
FROM
    nfl_stat_category;

INSERT INTO nfl_stat(stat_name, stat_category_id)
VALUES ('Passing Yards', (SELECT stat_category_id
						  FROM nfl_stat_category
						  WHERE stat_category_desc = 'Passing')),
	   ('Passing Attempts', (SELECT stat_category_id
						     FROM nfl_stat_category
						     WHERE stat_category_desc = 'Passing')),
	   ('Completions', (SELECT stat_category_id
						FROM nfl_stat_category
						WHERE stat_category_desc = 'Passing')),
	   ('Pass Touchdowns', (SELECT stat_category_id
						    FROM nfl_stat_category
						    WHERE stat_category_desc = 'Passing')),
	   ('Interceptions', (SELECT stat_category_id
						  FROM nfl_stat_category
						  WHERE stat_category_desc = 'Passing')),
	   ('Rushing Attempts', (SELECT stat_category_id
						     FROM nfl_stat_category
						     WHERE stat_category_desc = 'Rushing')),
	   ('Rushing Yards', (SELECT stat_category_id
						  FROM nfl_stat_category
						  WHERE stat_category_desc = 'Rushing')),
	   ('Rush Touchdowns', (SELECT stat_category_id
						    FROM nfl_stat_category
						    WHERE stat_category_desc = 'Rushing')),
	   ('Fumbles', (SELECT stat_category_id
					FROM nfl_stat_category
					WHERE stat_category_desc = 'Rushing')),
	   ('Receptions', (SELECT stat_category_id
					   FROM nfl_stat_category
					   WHERE stat_category_desc = 'Receiving')),
	   ('Targets', (SELECT stat_category_id
					FROM nfl_stat_category
					WHERE stat_category_desc = 'Receiving')),
	   ('Receiving Yards', (SELECT stat_category_id
						     FROM nfl_stat_category
						     WHERE stat_category_desc = 'Receiving')),
	   ('Receiving Touchdowns', (SELECT stat_category_id
						         FROM nfl_stat_category
						         WHERE stat_category_desc = 'Receiving')),
	   ('Yards After Catch', (SELECT stat_category_id
						      FROM nfl_stat_category
						      WHERE stat_category_desc = 'Receiving')),
	   ('Return Yards', (SELECT stat_category_id
						 FROM nfl_stat_category
						 WHERE stat_category_desc = 'Return')),
	   ('Return Touchdowns', (SELECT stat_category_id
						      FROM nfl_stat_category
						      WHERE stat_category_desc = 'Return')),
	   ('Field Goals Attempted', (SELECT stat_category_id
								  FROM nfl_stat_category
								  WHERE stat_category_desc = 'Kicking')),
	   ('Field Goals Made', (SELECT stat_category_id
						     FROM nfl_stat_category
						     WHERE stat_category_desc = 'Kicking')),
	   ('Extra Points Attempted', (SELECT stat_category_id
						           FROM nfl_stat_category
						           WHERE stat_category_desc = 'Kicking')),
	   ('Extra Points Made', (SELECT stat_category_id
						      FROM nfl_stat_category
						      WHERE stat_category_desc = 'Kicking')),
	   ('Punts', (SELECT stat_category_id
				  FROM nfl_stat_category
				  WHERE stat_category_desc = 'Punting')),
	   ('Punt Yards', (SELECT stat_category_id
					   FROM nfl_stat_category
					   WHERE stat_category_desc = 'Punting')),
	   ('Blocked Punts', (SELECT stat_category_id
						  FROM nfl_stat_category
						  WHERE stat_category_desc = 'Punting')),
	   ('Punts Inside 20', (SELECT stat_category_id
						      FROM nfl_stat_category
						  WHERE stat_category_desc = 'Punting')),
	   ('Touchbacks', (SELECT stat_category_id
					   FROM nfl_stat_category
					   WHERE stat_category_desc = 'Punting')),
	   ('Tackles', (SELECT stat_category_id
					FROM nfl_stat_category
					WHERE stat_category_desc = 'Defense')),
	   ('Sacks', (SELECT stat_category_id
				  FROM nfl_stat_category
				  WHERE stat_category_desc = 'Defense')),
	   ('Defensive Interceptions', (SELECT stat_category_id
						            FROM nfl_stat_category
						            WHERE stat_category_desc = 'Defense')),
	   ('Interception Return Touchdowns', (SELECT stat_category_id
						                   FROM nfl_stat_category
						                   WHERE stat_category_desc = 'Defense')),
	   ('Fumbles Forced', (SELECT stat_category_id
						    FROM nfl_stat_category
						  WHERE stat_category_desc = 'Defense')),
	   ('Fumbles Recovered', (SELECT stat_category_id
						      FROM nfl_stat_category
						      WHERE stat_category_desc = 'Defense'));

SELECT stat_name, stat_category_desc
FROM nfl_stat JOIN nfl_stat_category
ON nfl_stat.stat_category_id = nfl_stat_category.stat_category_id;

INSERT INTO nfl_player(player_first, player_last, player_dob, position_id)
VALUES ('Aaron', 'Rodgers', '1983-12-2', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'QB')),
	   ('Randall', 'Cobb', '1990-8-22', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'WR')),
	   ('Tim', 'Tebow', '1987-8-14', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'QB')),
	   ('Adrian', 'Peterson', '1985-3-21', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'RB')),
	   ('Greg', 'Olsen', '1985-3-11', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'TE')),
	   ('Connor', 'Barth', '1986-4-11', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'K')),
	   ('Shane', 'Lechler', '1976-8-7', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'P')),
	   ('Troy', 'Polamalu', '1981-4-19', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'S')),
	   ('Darrelle', 'Revis', '1985-7-14', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'CB')),
	   ('Brian', 'Cushing', '1987-1-24', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'LB')),
	   ('Jared', 'Allen', '1982-4-3', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'DE')),
	   ('B.J.', 'Raji', '1986-7-11', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'DT')),
	   ('Maurice', 'Jones-Drew', '1985-3-23', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'RB')),
	   ('Cam', 'Newton', '1989-5-11', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'QB')),
	   ('Devin', 'Hester', '1982-11-4', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'WR')),
	   ('Jimmy', 'Graham', '1985-11-24', (SELECT position_id
										  FROM nfl_position
										  WHERE position_abbr = 'TE'));

SELECT player_first, player_last, player_dob, position_abbr
FROM nfl_player JOIN nfl_position
ON nfl_player.position_id = nfl_position.position_id;

INSERT INTO nfl_played(player_id, team_id, played_year)
VALUES ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2005'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2006'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2007'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2008'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2009'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Broncos'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Broncos'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jets'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2007'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2008'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2009'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2007'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2008'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2009'),
	    ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Panthers'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Panthers'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Chiefs'),
		'2008'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Buccaneers'),
		'2009'),
	    ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Buccaneers'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Buccaneers'),
		'2011'),
	    ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Buccaneers'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2000'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2001'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2002'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2003'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2004'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2005'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2006'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2007'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2008'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2009'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Raiders'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Steelers'),
		'2003'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Steelers'),
		'2004'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Steelers'),
		'2005'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Steelers'),
		'2006'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Steelers'),
		'2007'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Steelers'),
		'2008'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Steelers'),
		'2009'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Steelers'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Steelers'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Steelers'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darelle' AND player_last = 'Revis'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jets'),
		'2007'),
	    ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darelle' AND player_last = 'Revis'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jets'),
		'2008'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darelle' AND player_last = 'Revis'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jets'),
		'2009'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darelle' AND player_last = 'Revis'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jets'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darelle' AND player_last = 'Revis'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jets'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darelle' AND player_last = 'Revis'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jets'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Brian' AND player_last = 'Cushing'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Texans'),
		'2009'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Brian' AND player_last = 'Cushing'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Texans'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Brian' AND player_last = 'Cushing'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Texans'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Brian' AND player_last = 'Cushing'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Texans'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jared' AND player_last = 'Allen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Chiefs'),
		'2004'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jared' AND player_last = 'Allen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Chiefs'),
		'2005'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jared' AND player_last = 'Allen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Chiefs'),
		'2006'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jared' AND player_last = 'Allen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Chiefs'),
		'2007'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jared' AND player_last = 'Allen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2008'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jared' AND player_last = 'Allen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2009'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jared' AND player_last = 'Allen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jared' AND player_last = 'Allen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jared' AND player_last = 'Allen'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Vikings'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'B.J.' AND player_last = 'Raji'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2009'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'B.J.' AND player_last = 'Raji'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'B.J.' AND player_last = 'Raji'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'B.J.' AND player_last = 'Raji'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Packers'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Maurice' AND player_last = 'Jones-Drew'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jaguars'),
		'2006'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Maurice' AND player_last = 'Jones-Drew'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jaguars'),
		'2007'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Maurice' AND player_last = 'Jones-Drew'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jaguars'),
		'2008'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Maurice' AND player_last = 'Jones-Drew'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jaguars'),
		'2009'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Maurice' AND player_last = 'Jones-Drew'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jaguars'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Maurice' AND player_last = 'Jones-Drew'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jaguars'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Maurice' AND player_last = 'Jones-Drew'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Jaguars'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Cam' AND player_last = 'Newton'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Panthers'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Cam' AND player_last = 'Newton'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Panthers'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Devin' AND player_last = 'Hester'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2006'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Devin' AND player_last = 'Hester'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2007'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Devin' AND player_last = 'Hester'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2008'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Devin' AND player_last = 'Hester'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2009'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Devin' AND player_last = 'Hester'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Devin' AND player_last = 'Hester'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Devin' AND player_last = 'Hester'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Bears'),
		'2012'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jimmy' AND player_last = 'Graham'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Saints'),
		'2010'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jimmy' AND player_last = 'Graham'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Saints'),
		'2011'),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Jimmy' AND player_last = 'Graham'),
		(SELECT team_id
		 FROM nfl_team
		 WHERE team_nickname = 'Saints'),
		'2012');

SELECT player_first, player_last, team_nickname, played_year
FROM nfl_player JOIN nfl_played
ON nfl_player.player_id = nfl_played.player_id
JOIN nfl_team
ON nfl_played.team_id = nfl_team.team_id;

INSERT INTO nfl_player_stat(player_id, stat_id, player_stat_year, stat_value)
VALUES ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2005', 65),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2006', 46),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2007', 218),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2008', 4038),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2009', 4434),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2010', 3922),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2011', 4643),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2012', 2165),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Touchdowns'),
		'2005', 0),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Touchdowns'),
		'2006', 0),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Touchdowns'),
		'2007', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Touchdowns'),
		'2008', 28),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Touchdowns'),
		'2009', 30),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Touchdowns'),
		'2010', 28),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Touchdowns'),
		'2011', 45),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Touchdowns'),
		'2012', 21),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2005', 16),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2006', 15),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2007', 28),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2008', 536),
	   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2009', 541),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2010', 475),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2011', 502),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2012', 297),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2005', 9),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2006', 6),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2007', 20),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2008', 341),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2009', 350),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2010', 312),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2011', 343),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2012', 205),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interceptions'),
		'2005', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interceptions'),
		'2006', 0),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interceptions'),
		'2007', 0),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interceptions'),
		'2008', 13),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interceptions'),
		'2009', 7),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interceptions'),
		'2010', 11),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interceptions'),
		'2011', 6),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interceptions'),
		'2012', 4),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2005', 7),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2006', 11),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2007', 29),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2008', 207),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2009', 316),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2010', 356),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2011', 257),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Aaron' AND player_last = 'Rodgers'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2012', 129),
		/*Finish Rodgers*/

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2011', 25),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2012', 45),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2011', 31),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2012', 59),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2011', 375),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2012', 500),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2011', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2012', 6),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Return Yards'),
		'2011', 1236),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Return Yards'),
		'2012', 767),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Return Touchdowns'),
		'2011', 2),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Return Touchdowns'),
		'2012', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2011', 2),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2012', 6),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2011', 5),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Randall' AND player_last = 'Cobb'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2012', 96),
/*Rushing touchdowns and fumbles both = 0*/
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2010', 82),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2011', 271),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Attempts'),
		'2012', 3),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2010', 41),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2011', 126),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Completions'),
		'2012', 2),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2010', 654),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2011', 1729),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Yards'),
		'2012', 32),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Touchdowns'),
		'2010', 5),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Passing Touchdowns'),
		'2011', 12),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interceptions'),
		'2010', 3),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interceptions'),
		'2011', 6),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2010', 43),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2011', 122),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2012', 23),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2010', 227),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2011', 660),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2012', 78),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rush Touchdowns'),
		'2010', 6),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rush Touchdowns'),
		'2011', 6),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2010', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Tim' AND player_last = 'Tebow'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2010', 6),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2007', 238),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2008', 363),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2009', 314),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2010', 283),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2011', 208),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Attempts'),
		'2012', 168),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2007', 1341),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2008', 1760),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2009', 1383),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2010', 1298),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2011', 970),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rushing Yards'),
		'2012', 957),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rush Touchdowns'),
		'2007', 12),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rush Touchdowns'),
		'2008', 10),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rush Touchdowns'),
		'2009', 18),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rush Touchdowns'),
		'2010', 12),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rush Touchdowns'),
		'2011', 12),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Rush Touchdowns'),
		'2012', 6),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2007', 4),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2008', 9),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2009', 6),	   
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2010', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2011', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2012', 2),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2007', 19),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2008', 21),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2009', 43),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2010', 36),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2011', 18),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2012', 26),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2007', 29),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2008', 39),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2009', 57),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2010', 50),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2011', 23),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2012', 32),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2007', 268),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2008', 125),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2009', 436),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2010', 341),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2011', 139),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2012', 150),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2007', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2010', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2011', 1),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Return Yards'),
		'2007', 412),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Adrian' AND player_last = 'Peterson'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Return Yards'),
		'2008', 16),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2007', 39),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2008', 54),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2009', 60),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2010', 41),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2011', 45),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receptions'),
		'2012', 34),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2007', 66),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2008', 82),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2009', 108),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2010', 70),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2011', 90),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Targets'),
		'2012', 53),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2007', 391),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2008', 574),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2009', 612),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2010', 404),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2011', 540),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Yards'),
		'2012', 395),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2007', 2),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2008', 5),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2009', 8),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2010', 5),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2011', 5),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Receiving Touchdowns'),
		'2012', 1),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2008', 2),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2010', 2),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Greg' AND player_last = 'Olsen'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles'),
		'2011', 1),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Field Goals Attempted'),
		'2008', 12),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Field Goals Attempted'),
		'2009', 19),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Field Goals Attempted'),
		'2010', 28),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Field Goals Attempted'),
		'2011', 28),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Field Goals Attempted'),
		'2012', 17),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Field Goals Made'),
		'2008', 10),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Field Goals Made'),
		'2009', 14),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Field Goals Made'),
		'2010', 23),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Field Goals Made'),
		'2011', 26),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Field Goals Made'),
		'2012', 13),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Extra Points Attempted'),
		'2008', 24),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Extra Points Attempted'),
		'2009', 12),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Extra Points Attempted'),
		'2010', 36),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Extra Points Attempted'),
		'2011', 23),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Extra Points Attempted'),
		'2012', 25),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Extra Points Made'),
		'2008', 24),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Extra Points Made'),
		'2009', 12),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Extra Points Made'),
		'2010', 36),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Extra Points Made'),
		'2011', 23),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Connor' AND player_last = 'Barth'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Extra Points Made'),
		'2012', 25),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2000', 65),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2001', 73),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2002', 53),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2003', 96),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2004', 73),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2005', 82),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2006', 77),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2007', 73),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2008', 90),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2009', 96),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2010', 77),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2011', 78),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts'),
		'2012', 42),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2000', 2984),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2001', 3375),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2002', 2251),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2003', 4503),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2004', 3409),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2005', 3744),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2006', 3660),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2007', 3585),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2008', 4391),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2009', 4909),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2010', 3618),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2011', 3960),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punt Yards'),
		'2012', 2016),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Blocked Punts'),
		'2000', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Blocked Punts'),
		'2001', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Blocked Punts'),
		'2006', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Blocked Punts'),
		'2012', 1),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2000', 24),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2001', 23),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2002', 18),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2003', 27),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2004', 22),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2005', 26),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2006', 19),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2007', 25),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2008', 33),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2009', 30),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2010', 27),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2011', 27),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Punts Inside 20'),
		'2012', 7),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2000', 10),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2001', 12),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2002', 12),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2003', 13),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2004', 14),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2005', 9),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2006', 19),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2007', 7),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2008', 13),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2009', 12),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2010', 4),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2011', 9),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Shane' AND player_last = 'Lechler'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Touchbacks'),
		'2012', 6),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2003', 38),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2004', 96),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2005', 91),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2006', 77),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2007', 58),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2008', 73),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2009', 20),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2010', 63),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2011', 91),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2012', 7),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Sacks'),
		'2003', 2),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Sacks'),
		'2004', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Sacks'),
		'2005', 3),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Sacks'),
		'2006', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Sacks'),
		'2010', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Sacks'),
		'2011', 1),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2004', 5),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2005', 2),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2006', 3),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2008', 7),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2009', 3),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2010', 7),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2011', 2),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interception Return Touchdowns'),
		'2004', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interception Return Touchdowns'),
		'2010', 1),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles Forced'),
		'2003', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles Forced'),
		'2004', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles Forced'),
		'2005', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles Forced'),
		'2006', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles Forced'),
		'2007', 3),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles Forced'),
		'2010', 1),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles Recovered'),
		'2005', 2),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles Recovered'),
		'2007', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles Recovered'),
		'2010', 1),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Troy' AND player_last = 'Polamalu'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumbles Recovered'),
		'2011', 1),

	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2007', 87),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2008', 58),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2009', 54),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2010', 32),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2011', 52),
	   ((SELECT player_id
		FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Tackles'),
		'2012', 11),
        
    ((SELECT player_id    
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Sacks'),
		'2008', 1),
    
    ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2007', 3),
    ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2008', 5),
   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2009', 6),
   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
		'2011', 4),
   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Defensive Interceptions'),
    '2012', 1),
    
   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interception Return Touchdowns'),
    '2008', 1),
    ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interception Return Touchdowns'),
    '2009', 1),
   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Interception Return Touchdowns'),
    '2011', 1),
    
   ((SELECT player_id        
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Forced Fumbles'),
		'2007', 1),
   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Forced Fumbles'),
		'2008', 1),
   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Forced Fumbles'),
		'2012', 1),
        
   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumble Recoveries'),
		'2008', 2),
   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumble Recoveries'),
		'2010', 2),
   ((SELECT player_id
    FROM nfl_player
		WHERE player_first = 'Darrelle' AND player_last = 'Revis'),
		(SELECT stat_id
		 FROM nfl_stat
		 WHERE stat_name = 'Fumble Recoveries'),
		'2012', 1);