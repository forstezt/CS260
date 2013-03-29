<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Head Content -->
<head>

	<!-- Meta Content -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
    <!-- Title -->
	<title>Fantasy Madness - Search</title>
	
    <!-- Linked Content -->	
	<link rel="stylesheet" type="text/css" href="CSS/display.css" />
	<script type="text/javascript" src="javascript/table.js"></script>
	
</head>

<?php
$team=$_REQUEST["team"];
if (!ctype_alpha($team)) {
	$team="";
}
$year=$_REQUEST["year"];
if (!ctype_digit($year)) {
	$year="";
}
$query = "SELECT nfl_player.player_id id, player_last, position_abbr, played_year " .
"FROM nfl_played " .
"JOIN nfl_player ON nfl_played.player_id = nfl_player.player_id " .
"JOIN nfl_position ON nfl_position.position_id = nfl_player.position_id " .
"WHERE ";
if ($team) {
	$query = $query . "team_id = (SELECT team_id FROM nfl_team WHERE team_abbr = '".$team."') AND ";
}
if ($year) {
	$query = $query . "played_year = ".$year." AND ";
}
if ((substr($query, -6)) == "WHERE ") {
	die("no search condition specified. must specify \"year\" (i.e. 2012) and/or \"team\" (i.e. GB)");
} else {
	$query = substr($query, 0, -5);
}
mysql_connect("dario.cs.uwec.edu","SCHEMMIM","S625023$") 
    or die("Could not connect to MySQL. The reported SQL error is:<br />" . mysql_error());
mysql_select_db("SCHEMMIM")
	or die("Could not connect to the database. The reported SQL error is:<br />" . mysql_error());
$result = mysql_query($query)
	or die("SQL error:<br />" . mysql_error());
mysql_close();
?>

<!-- Body Content -->
<body>

	<!-- Banner Div -->
	<div id="banner">
				
		<form id="login">	
			<input type="text" name="userName" id="userName" value="Username"/>
			<input type="password" name="password" id="password" value="Password"/>
			<input type="button" value="Log In" id="loginButton" onclick="location.href='admin.html'"/>
		</form>		
		<p>Fantasy Madness</p>
		
	</div>
	
	<!-- MainContent Div -->
	<div id="MainContent" class="roundedEdges">
	
		<h2>test</h2> <i>last updated: Nov 4 at 4:37 PM</i>
		
		<!-- Player Statistics Table -->
		<?php if ($row = mysql_fetch_array($result)) { ?>
		<table rules=cols>
			<tr>
				<th class="rightBorder">Name</th>
				<th>Position</th>
				<th>Year</th>
			</tr>
			<?php while ($row) { ?>
				<tr>
					<td class="rightBorder">
						<a href="player.php?id=<?php echo $row["id"] ?>&year=<?php echo $row["played_year"] ?>">
							<?php echo $row["player_last"] ?>
						</a>
					</td>
					<td><?php echo $row["position_abbr"] ?></td>
					<td><?php echo $row["played_year"] ?></td>
				</tr>
			<?php
			$row = mysql_fetch_array($result);
			} ?>
		</table>
		<?php } else {
			echo "<table><tr><td>No results found for team ".$team."</td></tr></table>";
		} ?>

</body>
</html>