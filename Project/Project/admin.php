<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Head Content -->
<head>

	<!-- Meta Content -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
    <!-- Title -->
	<title>Fantasy Madness - Admin</title>
	
    <!-- Linked Content -->	
	<link rel="stylesheet" type="text/css" href="CSS/admin.css" />
	<script type="text/javascript" src="javascript/table.js"></script>
	
</head>

<?php
mysql_connect("dario.cs.uwec.edu", "WISBYMN", "W668568$");
mysql_select_db("WISBYMN");
	
$player_query = "SELECT player_id, CONCAT(player_first,' ',player_last) AS player_name " .
"FROM nfl_player ";
$player_result = mysql_query($player_query);

$player_query1 = "SELECT player_id, CONCAT(player_first,' ',player_last) AS player_name " .
"FROM nfl_player ";
$player_result1 = mysql_query($player_query1);

$player_query2 = "SELECT player_id, CONCAT(player_first,' ',player_last) AS player_name " .
"FROM nfl_player ";
$player_result2 = mysql_query($player_query2);

$position_query = "SELECT position_id, position_name FROM nfl_position ";
$position_result = mysql_query($position_query);

$position_query1 = "SELECT position_id, position_name FROM nfl_position ";
$position_result1 = mysql_query($position_query1);

$team_query = "SELECT team_id, team_nickname FROM nfl_team ";
$team_result = mysql_query($team_query);

$team_query1 = "SELECT team_id, team_nickname FROM nfl_team ";
$team_result1 = mysql_query($team_query1);

$stat_query = "SELECT stat_id, stat_name FROM nfl_stat ";
$stat_result = mysql_query($stat_query);

$stat_query1 = "SELECT stat_id, stat_name FROM nfl_stat ";
$stat_result1 = mysql_query($stat_query1);

$category_query = "SELECT stat_category_id, stat_category_desc FROM nfl_stat_category ";
$category_result = mysql_query($category_query);

?>

<!-- Body Content -->
<body>

	<!-- Banner Div -->
	<div id="banner">
				
		<input type="button" value="Log Out" id="logoutButton" onclick="location.href='index.html'"/>
		<p> Fantasy Madness</p>
		
	</div>
	
	
	<!-- MainContentLeft Div -->
	<div id="MainContentLeft" class="roundedEdges">
		
		<h2>Delete:</h2>

		<form>
		
			<table>
				<tr>
					<td class="rightAlign">Team:</td>
					<td>
						<select id="teamSelect">
							<option value="none">None</option>
							<?php while ($row = mysql_fetch_array($team_result)) { ?>
								<option value="<?php echo $row["team_id"] ?>">
									<?php echo $row["team_nickname"] ?>
								</option>
							<?php } ?>
						</select>
					</td>					
				</tr>
				<tr>
					<td><input type="submit" value="Delete Team" id="deleteButton" method="post" action="XXXXX"/></td>
				</tr>
				<tr>
					<td class="rightAlign">Player:</td>
					<td>
						<select id="playerySelect">
							<option value="none">None</option>
							<?php while ($row = mysql_fetch_array($player_result)) { ?>
								<option value=" <?php echo $row["player_id"] ?> ">
									<?php echo $row["player_name"] ?>
								</option>
							<?php } ?>
						</select>
					</td>					
				</tr>
				<tr>
					<td><input type="submit" value="Delete Player" id="deleteButton" method="post" action="XXXXX"/></td>
				</tr>
				<tr>
					<td class="rightAlign">Position:</td>
					<td>
						<select id="positionSelect">
							<option value="none">None</option>
							<?php while ($row = mysql_fetch_array($position_result)) { ?>
								<option value=" <?php echo $row["position_id"] ?> ">
									<?php echo $row["position_name"] ?>
								</option>
							<?php } ?>
						</select>
					</td>					
				</tr>
				<tr>
					<td><input type="submit" value="Delete Position" id="deleteButton" method="post" action="XXXXX"/></td>
				</tr>
				<tr>
					<td class="rightAlign">Statistic:</td>
					<td>
						<select id="statSelect">
							<option value="none">None</option>
							<?php while ($row = mysql_fetch_array($stat_result)) { ?>
								<option value=" <?php echo $row["stat_id"] ?> ">
									<?php echo $row["stat_name"] ?>
								</option>
							<?php } ?>
						</select>				
					</td>					
				</tr>
				<tr>
					<td><input type="submit" value="Delete Statistic" id="deleteButton" method="post" action="XXXXX"/></td>
				</tr>
				<tr>
					<td class="rightAlign">Statistic Category:</td>
					<td>
						<select id="categorySelect">
							<option value="none">None</option>
							<?php while ($row = mysql_fetch_array($category_result)) { ?>
								<option value=" <?php echo $row["stat_category_id"] ?> ">
									<?php echo $row["stat_category_desc"] ?>
								</option>
							<?php } ?>
						</select>					
					</td>					
				</tr>
				<tr>
					<td><input type="submit" value="Delete Stat Category" id="deleteButton" method="post" action="XXXXX"/></td>
				</tr>			
			</table>
		
		</form>
		
	</div>	
	
	<div id="MainContentBottom" class="roundedEdges">
		<h2>Add:</h2>

		<form action="addTeam.php">
		
			<table>
				<tr>
					<td><h3>Team:</h3></td>
				</tr>			
				<tr>
					<td class="rightAlign">Nickname:</td>
					<td><input type="text" name="team_nickname" id="team_nickname"/></td>									
					<td class="rightAlign">Location:</td>
					<td><input type="text" name="team_location" id="team_location"/></td>					
				</tr>
				<tr>
					<td class="rightAlign">Conference:</td>
					<td><input type="text" name="team_conference" id="team_conference"/></td>	
					<td class="rightAlign">Division:</td>
					<td><input type="text" name="team_division" id="team_division"/></td>	
				</tr>
				<tr>
					<td></td><td></td><td></td><td></td><td></td>
					<td><input type="submit" value="Create Team" id="createButton" method="get" /></td>
				</tr>
		</form>
		<form action="addPlayer.php">
				<tr>
					<td><h3>Player:</h3></td>
				</tr>	
				<tr>
					<td class="rightAlign">First Name:</td>
					<td><input type="text" name="player_first" id="player_first"/></td>					
					<td class="rightAlign">Last Name:</td>
					<td><input type="text" name="player_last" id="player_last"/></td>
					<td class="rightAlign">Position:</td>
					<td>
						<select id="positionSelect">
							<option value="none">None</option>
							<?php while ($row = mysql_fetch_array($position_result1)) { ?>
								<option value=" <?php echo $row["position_id"] ?> ">
									<?php echo $row["position_name"] ?>
								</option>
							<?php } ?>
						</select>
					</td>					
				</tr>
				<tr>
					<td></td><td></td><td></td><td></td><td></td>
					<td><input type="submit" value="Create Player" id="createButton" method="post" /></td>
				</tr>
		</form>
		<form>
				<tr>
					<td><h3>Position:</h3></td>
				</tr>	
				<tr>
					<td class="rightAlign">Abbreviation:</td>
					<td><input type="text" name="position_abbr" id="position_abbr"/></td>
					<td class="rightAlign">Description:</td>
					<td><input type="text" name="position_desc" id="position_desc"/></td>										
				</tr>	
				<tr>
					<td></td><td></td><td></td><td></td><td></td>
					<td><input type="submit" value="Create Position" id="createButton" method="post" action="XXXXX"/></td>
				</tr>
				<tr>
					<td><h3>Statistic:</h3></td>
				</tr>	
				<tr>
					<td class="rightAlign">Description:</td>
					<td><input type="text" name="stat_desc" id="stat_desc"/></td>					
					<td class="rightAlign">Category:</td>
					<td><input type="text" name="stat_category" id="stat_category"/></td>										
				</tr>	
				<tr>
					<td></td><td></td><td></td><td></td><td></td>
					<td><input type="submit" value="Create Statistic" id="createButton" method="post" action="XXXXX"/></td>
				</tr>
				<tr>
					<td><h3>Statistic Category:</h3></td>
				</tr>	
				<tr>
					<td class="rightAlign">Description:</td>
					<td><input type="text" name="category_desc" id="category_desc"/></td>					
				</tr>
				<tr>
					<td></td><td></td><td></td><td></td><td></td>
					<td><input type="submit" value="Create Statistic Category" id="createButton" method="post" action="XXXXX"/></td>
				</tr>
				<tr>
					<td><h3>Team / Player:</h3></td>
				</tr>		
				<tr>
					<td class="rightAlign">Team:</td>
					<td>
						<select id="teamSelect">
							<option value="none">None</option>
							<?php while ($row = mysql_fetch_array($team_result1)) { ?>
								<option value="<?php echo $row["team_id"] ?>">
									<?php echo $row["team_nickname"] ?>
								</option>
							<?php } ?>
						</select>				
					</td>					
					<td class="rightAlign">Player:</td>
					<td>
						<select id="playerySelect">
							<option value="none">None</option>
							<?php while ($row = mysql_fetch_array($player_result1)) { ?>
								<option value=" <?php echo $row["player_id"] ?> ">
									<?php echo $row["player_name"] ?>
								</option>
							<?php } ?>
						</select>
					</td>		
				</tr>
				<tr>
					<td class="rightAlign">Year:</td>
					<td><input type="text" name="played_year" id="played_year"/></td>
					<td class="rightAlign">Salary:</td>
					<td><input type="text" name="played_salary" id="played_salary"/></td>
				</tr>
				<tr>
					<td></td><td></td><td></td><td></td><td></td>
					<td><input type="submit" value="Create Team/Player" id="createButton" method="post" action="XXXXX"/></td>
				</tr>				
				<tr>
					<td><h3>Player / Statistic:</h3></td>
				</tr>		
				<tr>
					<td class="rightAlign">Player:</td>
					<td>
						<select id="playerySelect">
							<option value="none">None</option>
							<?php while ($row = mysql_fetch_array($player_result2)) { ?>
								<option value=" <?php echo $row["player_id"] ?> ">
									<?php echo $row["player_name"] ?>
								</option>
							<?php } ?>
						</select>				
					</td>							
					<td class="rightAlign">Statistic:</td>
					<td>
						<select id="statSelect">
							<option value="none">None</option>
							<?php while ($row = mysql_fetch_array($stat_result1)) { ?>
								<option value=" <?php echo $row["stat_id"] ?> ">
									<?php echo $row["stat_name"] ?>
								</option>
							<?php } ?>
						</select>					
					</td>	
				</tr>
				<tr>
					<td class="rightAlign">Year:</td>
					<td><input type="text" name="played_year" id="played_year"/></td>	
					<td class="rightAlign">Value:</td>
					<td><input type="text" name="played_value" id="played_value"/></td>	
				</tr>		
				<tr>
					<td></td><td></td><td></td><td></td><td></td>
					<td><input type="submit" value="Create Player/Statistic" id="createButton" method="post" action="XXXXX"/></td>
				</tr>
				<tr>
					<td class="rightAlign"><input type="reset" value="Reset" id="resetButton"/></td>					
				</tr>
			</table>
		
		</form>		
	</div>
	
	
	
	
	
	
	
	<div id="MainContentRight" class="roundedEdges">
		
		<h2>Edit Existing Listing</h2>
		
			<form>
		
			<table>
				<tr>
					<td class="rightAlign">Field to be Edited:</td>
					<td>
						<select id="fieldSelect">
							<option value="player_stat_val">Statistic Value</option>
							<option value="category_desc">Statistic Category</option>
							<option value="player_first">Player Name</option>
							<option value="team_nickname">Team Nickname</option>
							<option value="team_location">Team Location</option>
						</select>					
					</td>					
				</tr>
				<tr>
					<td class="rightAlign">New Value:</td>
					<td><input type="text" name="newValue" id="newValue"/></td>					
				</tr>

				<tr>
					<td><h3>Conditions:</h3></td>
				</tr>
				<tr>
					<td class="rightAlign">Season:</td>
					<td>
						<select id="statSelect">
							<option value="none">None</option>
							<option value="2012">2012</option>
							<option value="2011">2011</option>
							<option value="2010">2010</option>
						</select>					
					</td>					
				</tr>				
				<tr>
					<td class="rightAlign">Team Name:</td>
					<td>
						<select id="statSelect">
							<option value="none">None</option>
							<option value="Lions">Detroit Lions</option>
							<option value="Packers">Green Bay Packers</option>
							<option value="Vikings">Minnesotta Vikings</option>
						</select>					
					</td>					
				</tr>	
				<tr>
					<td class="rightAlign">Conference:</td>
					<td>
						<select id="statSelect">
							<option value="none">None</option>
							<option value="NFL">NFL</option>
							<option value="AFL">AFL</option>
						</select>					
					</td>					
				</tr>				
				<tr>
					<td class="rightAlign">Player Name:</td>
					<td>
						<select id="statSelect">
							<option value="none">None</option>
							<option value="Aaron Rogers">Aaron Rogers</option>
							<option value="Randall Cobb">Randall Cobb</option>
							<option value="Tim Tebow">Tim Tebow</option>
						</select>					
					</td>					
				</tr>				
				<tr>
					<td class="rightAlign">Statistic:</td>
					<td>
						<select id="statSelect">
							<option value="none">None</option>
							<option value="Rushing Yards">Rushing Yards</option>
							<option value="Passing Yards">Passing Yards</option>
							<option value="Sacks">Sacks</option>
							<option value="Interceptions">Interceptions</option>
							<option value="Returning Yards">Returning Yards</option>
							<option value="Punts">Punts</option>
						</select>					
					</td>					
				</tr>
				<tr>
					<td class="rightAlign">Statistic Category:</td>
					<td>
						<select id="categorySelect">
							<option value="none">None</option>
							<option value="2012">Passing</option>
							<option value="2011">Rushing</option>
							<option value="2010">Recieving</option>
						</select>					
					</td>					
				</tr>
				<tr>
					<td class="rightAlign">Statistic Value:</td>
					<td><input type="text" name="newValue" id="newValue"/></td>					
				</tr>				
				<tr>
					<td class="rightAlign"><input type="reset" value="Reset" id="resetButton"/></td>
					<td><input type="submit" value="Edit" id="editButton" method="post" action="XXXXX"/></td>
				</tr>
			</table>
		
		</form>	
		
	</div>
<?php
mysql_close();
?>
</body>
</html>