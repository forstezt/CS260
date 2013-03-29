<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Head Content -->
<head>
	<!-- Meta Content -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
    <!-- Title -->
	<title>Fantasy Madness - Team Added</title>
	
    <!-- Linked Content -->	
	<link rel="stylesheet" type="text/css" href="CSS/admin.css" />
	
</head>

<?php

mysql_connect("dario.cs.uwec.edu","WISBYMN","W668568$")
    or die("Could not connect to MySQL. The reported SQL error is:<br />" . mysql_error());
mysql_select_db("WISBYMN")
	or die("Could not connect to the database. The reported SQL error is:<br />" . mysql_error());

$nickname = $_REQUEST["team_nickname"];
$location = $_REQUEST["team_location"];
$conference = $_REQUEST["team_conference"];
$division = $_REQUEST["team_division"];

$add_query = "INSERT INTO NFL_TEAM (team_nickname, team_location, team_conference, team_division) " .
"VALUES ('$nickname', '$location', '$conference', '$division') ";

$add_result = mysql_query($add_query);

$team_query = "SELECT team_nickname, team_location, team_conference, team_division " .
"FROM nfl_team ";
$team_result = mysql_query($team_query);

?>

<!-- Body Content -->
<body>

	<!-- Banner Div -->
	<div id="banner">
				
		<p> Fantasy Madness -- Team Added</p>
		
	</div>
	
	<!-- MainContent Div -->
	<div id="MainContent" class="roundedEdges">
	
		<h2>Teams</h2> 
		
		<h1><?php echo $location . " " . $nickname ?> added</h1>
		
		<table rules=cols>
			<tr>
				<th>Nickname</th>
				<th>Location</th>
				<th>Conference</th>
				<th>Division</th>
			</tr>
			<?php while ($row = mysql_fetch_array($team_result)) { ?>
			<tr>
				<td><?php echo $row["team_nickname"] ?></td> 
				<td><?php echo $row["team_location"] ?></td>
				<td><?php echo $row["team_conference"] ?></td>
				<td><?php echo $row["team_division"] ?></td>
			</tr>
			<?php } ?>
		</table>
		<input type="button" value="Back to Admin Page" onclick="location.href='admin.php'" />
	</div>
<?php mysql_close(); ?>

</body>
</html>