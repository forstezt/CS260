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
		.sortheader {
			color: white;
		}
	</style>
	
</head>

<?php
$category = "Passing";
if ($_REQUEST["category"]) {
	$category = $_REQUEST["category"];
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

$numStats = 0;
$stat_ids = array();
$stat_names = array();
while ($row = mysql_fetch_array($get_stat_ids_result)) {
	$stat_ids[$numStats] = $row["stat_id"];
	$stat_names[$numStats] = str_replace(" ", "_", $row["stat_name"]);
	$numStats++;
}

$sort = $stat_names[0];
if ($_REQUEST["sort"]) {
	$sort = $_REQUEST["sort"];
}

$query = "SELECT CONCAT(player_first,' ',player_last) AS name";
for ($i=0; $i<$numStats; $i++) {
	$query .= ", " . $stat_names[$i] . ".stat_value AS " . $stat_names[$i];
}
$query .= " FROM nfl_player ";
for ($i=0; $i<$numStats; $i++) {
	$query .= ($i == 0 ? "" : "LEFT ") . // Anyone with the FIRST stat in the list will show up in the results, because all other joins are left joins.
	"JOIN nfl_player_stat " . $stat_names[$i] .
	" ON nfl_player.player_id = " . $stat_names[$i] . ".player_id AND " . $stat_names[$i] . ".player_stat_year = 2012 " .
	"AND " . $stat_names[$i] . ".stat_id = " . $stat_ids[$i] . " ";
}
$query .= "ORDER BY " . $sort . $order;

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
		<p>Search Results</p>
		
	</div>
	
	<!-- MainContent Div -->
	<div id="MainContent" class="roundedEdges">
	
		<h2>Search Results</h2> <i>last updated: <?php echo date ("F d Y H:i:s.", filemtime("quarterbacks.php")) ?></i>
		
		<!-- Player Statistics Table -->
		<table rules=cols style="width: 90%">
			<tr>
				<th class="rightBorder"><a class="sortheader" href="?sort=player_last&order=asc">Name</a></th>
				<?php for ($i=0; $i<$numStats; $i++) { ?>
					<th><a class="sortheader" href="?sort=<?php
						echo $stat_names[$i];
						if ($sort == $stat_names[$i] && $_REQUEST["order"] != "asc") {
							echo "&order=asc";
						}
					?>">
						<?php echo str_replace("_", " ", $stat_names[$i]); ?>
					</a></th>
				<?php } ?>
			</tr>
			<?php while ($row = mysql_fetch_array($result)) { ?>
				<tr>
					<td class="rightBorder"><?php echo $row["name"] ?></td> 
					<?php for ($i=0; $i<$numStats; $i++) { ?>
						<td><?php echo $row[$stat_names[$i]] ?></td>
					<?php } ?>
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