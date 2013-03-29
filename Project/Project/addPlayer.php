<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Head Content -->
<head>
	<!-- Meta Content -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
    <!-- Title -->
	<title>Fantasy Madness - Player Added</title>
	
    <!-- Linked Content -->	
	<link rel="stylesheet" type="text/css" href="CSS/admin.css" />
	
</head>

<?php

mysql_connect("dario.cs.uwec.edu","WISBYMN","W668568$")
    or die("Could not connect to MySQL. The reported SQL error is:<br />" . mysql_error());
mysql_select_db("WISBYMN")
	or die("Could not connect to the database. The reported SQL error is:<br />" . mysql_error());

$first = $_REQUEST["player_first"];
$last = $_REQUEST["player_last"];
$position = $_REQUEST["positionSelect"];

$add_query = "INSERT INTO NFL_PLAYER (player_first, player_last, position_id) " .
"VALUES ('$first', '$last', '$position') ";

$add_result = mysql_query($add_query);

$player_query = "SELECT CONCAT(player_first,' ', player_last) AS name, position_name " .
"FROM nfl_player JOIN nfl_position " .
"ON nfl_player.position_id = nfl_position.position_id ";
$player_result = mysql_query($player_query);

?>

<!-- Body Content -->
<body>

	<!-- Banner Div -->
	<div id="banner">
	
		<p> Fantasy Madness -- Player Added</p>
		
	</div>
	
	<!-- MainContent Div -->
	<div id="MainContent" class="roundedEdges">
	
		<h2>Players</h2> 
		
		<table rules=cols>
			<tr>
				<th>Name</th>
				<th>Position</th>
			</tr>
			<?php while ($row = mysql_fetch_array($player_result)) { ?>
			<tr>
				<td><?php echo $row["name"] ?></td> 
				<td><?php echo $row["position_name"] ?></td>
			</tr>
			<?php } ?>
		</table>
		<input type="button" value="Back to Admin Page" onclick="location.href='admin.php'" />
	</div>
<?php mysql_close(); ?>

</body>
</html>