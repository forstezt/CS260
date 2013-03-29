DROP TABLE IF EXISTS NFL_PLAYER_STAT;
DROP TABLE IF EXISTS NFL_PLAYED;
DROP TABLE IF EXISTS NFL_TEAM;
DROP TABLE IF EXISTS NFL_PLAYER;
DROP TABLE IF EXISTS NFL_POSITION;
DROP TABLE IF EXISTS NFL_STAT;
DROP TABLE IF EXISTS NFL_STAT_CATEGORY;
DROP TABLE IF EXISTS NFL_ADMIN;

CREATE TABLE NFL_STAT_CATEGORY (
	stat_category_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	stat_category_desc VARCHAR(30),
  stat_category_type VARCHAR(30)
);

CREATE TABLE NFL_POSITION (
	position_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	position_abbr VARCHAR(5),
	position_name VARCHAR(30)
);

CREATE TABLE NFL_TEAM (
	team_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	team_nickname VARCHAR(30),
	team_location VARCHAR(30),
	team_conference CHAR(3),
	team_division VARCHAR(10),
	team_abbr VARCHAR(5),
	team_owner VARCHAR(30)
);

CREATE TABLE NFL_STAT (
	stat_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	stat_name VARCHAR(45),
	stat_category_id BIGINT,
	CONSTRAINT nfl_stat_cat_id_fk FOREIGN KEY (stat_category_id) REFERENCES nfl_stat_category(stat_category_id)
);

CREATE TABLE NFL_PLAYER (
	player_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	player_first VARCHAR(30),
	player_last VARCHAR(30),
	player_dob DATE,
	position_id BIGINT,
	CONSTRAINT nfl_player_pos_id_fk FOREIGN KEY (position_id) REFERENCES nfl_position(position_id)
);

CREATE TABLE NFL_PLAYER_STAT (
	player_id BIGINT,
	stat_id BIGINT,
	player_stat_year YEAR,
	stat_value INT,
	CONSTRAINT nfl_player_stat_player_id_fk FOREIGN KEY (player_id) REFERENCES nfl_player(player_id),
	CONSTRAINT nfl_player_stat_stat_if_fk FOREIGN KEY (stat_id) REFERENCES nfl_stat(stat_id),
	CONSTRAINT PRIMARY KEY (player_id, stat_id, player_stat_year)
);

CREATE TABLE NFL_PLAYED (
	player_id BIGINT,
	team_id BIGINT,
	played_year YEAR,
	played_pay INT,
	CONSTRAINT nfl_played_player_id_fk FOREIGN KEY (player_id) REFERENCES nfl_player(player_id),
	CONSTRAINT nfl_played_team_id_fk FOREIGN KEY (team_id) REFERENCES nfl_team(team_id),
	CONSTRAINT PRIMARY KEY (player_id, team_id, played_year)
);

CREATE TABLE NFL_ADMIN (
	admin_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	admin_username VARCHAR(45),
	admin_password VARCHAR(45)
);