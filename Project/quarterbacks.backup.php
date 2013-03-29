<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Head Content -->
<head>

	<!-- Meta Content -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
    <!-- Title -->
	<title>Fantasy Madness - Stats</title>
	
    <!-- Linked Content -->	
	<link rel="stylesheet" type="text/css" href="CSS/display.css" />
	<script type="text/javascript" src="javascript/table.js"></script>
	
	<style>
		a {
			color: white;
		}
	</style>
	
</head>

<?php
$category = "Passing";

$sort = "pass";
if ($_REQUEST["sort"]) {
	$sort = $_REQUEST["sort"];
}
$order = " DESC";
if ($_REQUEST["order"] == "asc") {
	$order = "";
}

mysql_connect("dario.cs.uwec.edu","SCHEMMIM","S625023$") 
//mysql_connect("dario.cs.uwec.edu", "WISBYMN", "W668568$")
    or die("Could not connect to MySQL. The reported SQL error is:<br />" . mysql_error());
mysql_select_db("SCHEMMIM")
//mysql_select_db("WISBYMN")
	or die("Could not connect to the database. The reported SQL error is:<br />" . mysql_error());

$get_stat_ids_query="SELECT stat_id, stat_name " .
"FROM nfl_stat " .
"JOIN nfl_stat_category ON nfl_stat.stat_category_id = nfl_stat_category.stat_category_id " .
"WHERE stat_category_desc LIKE '".$category."'";

$get_stat_ids_result = mysql_query($get_stat_ids_query)
	or die("get_stat_ids_query SQL error:<br />" . mysql_error());

$query = "SELECT CONCAT(player_first,' ',player_last) AS name, " .
"pass.stat_value AS pass, rush.stat_value AS rush, att.stat_value AS att, comp.stat_value AS comp, passtd.stat_value AS passtd, " .
"(comp.stat_value / att.stat_value) AS percentage " .
"FROM nfl_player " .
"JOIN nfl_player_stat att ON nfl_player.player_id = att.player_id AND att.player_stat_year = 2012 AND att.stat_id = " .
"( SELECT stat_id FROM nfl_stat WHERE stat_name LIKE 'Passing Attempts' )" .
"LEFT JOIN nfl_player_stat rush ON nfl_player.player_id = rush.player_id AND rush.player_stat_year = 2012 AND rush.stat_id = " .
"( SELECT stat_id FROM nfl_stat WHERE stat_name LIKE 'Rushing Yards' )" .
"LEFT JOIN nfl_player_stat pass ON nfl_player.player_id = pass.player_id AND pass.player_stat_year = 2012 AND pass.stat_id = " .
"( SELECT stat_id FROM nfl_stat WHERE stat_name LIKE 'Passing Yards' )" .
"LEFT JOIN nfl_player_stat passtd ON nfl_player.player_id = passtd.player_id AND passtd.player_stat_year = 2012 AND passtd.stat_id = " .
"( SELECT stat_id FROM nfl_stat WHERE stat_name LIKE 'Pass Touchdowns' )" .
"LEFT JOIN nfl_player_stat comp ON nfl_player.player_id = comp.player_id AND comp.player_stat_year = 2012 AND comp.stat_id = " .
"( SELECT stat_id FROM nfl_stat WHERE stat_name LIKE 'Completions' )" .
"ORDER BY " . $sort . $order;

$result = mysql_query($query)
	or die("SQL error:<br />" . mysql_error());
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
		<p> Fantasy Madness</p>
		
	</div>
	
	<!-- MainContent Div -->
	<div id="MainContent" class="roundedEdges">
	
		<h2>Passing Leaders</h2> <i>last updated: Nov 6 at 5:41 PM</i>
		
		<!-- Player Statistics Table -->
		<table rules=cols>
			<tr>
				<th class="rightBorder"><a href="?sort=player_last&order=asc">Name</a></th>
				<th><a href="?sort=pass">Yards</a></th>
				<th><a href="?sort=att">Attempts</a></th>
				<th><a href="?sort=comp">Completions</a></th>
				<th><a href="?sort=percentage">%</a></th>
				<th><a href="?sort=passtd">TD</a></th>
				<th><a href="?sort=rush">Rush Yards</a></th>
			</tr>
			<?php while ($row = mysql_fetch_array($result)) { ?>
			<tr>
				<td class="rightBorder"><?php echo $row["name"] ?></td> 
				<td><?php echo $row["pass"] ?></td>
				<td><?php echo $row["att"] ?></td>
				<td><?php echo $row["comp"] ?></td>
				<td><?php echo $row["percentage"] ?></td>
				<td><?php echo $row["passtd"] ?></td>
				<td><?php echo $row["rush"] ?></td>
			</tr>
			<?php } ?>
		</table>
		
		<ul>
			<?php while ($row = mysql_fetch_array($get_stat_ids_result)) {
				echo "<li>".$row["stat_id"]." ".$row["stat_name"]."</li>";
			} ?>
		</ul>
		
<?php mysql_close(); ?>

</body>
</html>