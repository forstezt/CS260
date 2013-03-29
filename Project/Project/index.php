<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Head Content -->
<head>

	<!-- Meta Content -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
    <!-- Title -->
	<title>Fantasy Madness - Home</title>
	
    <!-- Linked Content -->	
	<link rel="stylesheet" type="text/css" href="CSS/index.css" />
	<script type="text/javascript" src="javascript/table.js"></script>
	
</head>


<?php

	mysql_connect("dario.cs.uwec.edu","SCHEMMIM","S625023$") 
	//mysql_connect("dario.cs.uwec.edu", "WISBYMN", "W668568$")
		or die("Could not connect to MySQL. The reported SQL error is:<br />" . mysql_error());
	mysql_select_db("SCHEMMIM")
	//mysql_select_db("WISBYMN")
		or die("Could not connect to the database. The reported SQL error is:<br />" . mysql_error());

	$offenseQuery = "SELECT stat_category_desc FROM nfl_stat_category WHERE stat_category_type = '".$type."'";
	$defenseQuery = "SELECT stat_category_desc FROM nfl_stat_category WHERE stat_category_type = '".$type."'";
	$specialQuery = "SELECT stat_category_desc FROM nfl_stat_category WHERE stat_category_type = '".$type."'";
	
	$offenseResult = mysql_query($offenseQuery)
		or die("SQL Error: <b>" . mysql_error() . "</b><br />");
	$defenseResult = mysql_query($defenseQuery)
		or die("SQL Error: <b>" . mysql_error() . "</b><br />");
	$specialResult = mysql_query($specialQuery)
		or die("SQL Error: <b>" . mysql_error() . "</b><br />");

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
	
	
	<!-- MainContentLeft Div -->
	<div id="MainContentLeft" class="roundedEdges">
		
		<h2>Specific Search</h2>
		
		<form>
		
			<table>
				<tr>
					<td class="rightAlign">Season:</td>
					<td>
						<select id="seasonSelect">
							<option value="All">All</option>						
							<option value="2012">2012</option>
							<option value="2011">2011</option>
							<option value="2010">2010</option>
							<option value="2009">2009</option>
							<option value="2008">2008</option>
							<option value="2007">2007</option>
						</select>
					</td>					
				</tr>
				<tr>
					<td class="rightAlign">Player Name:</td>
					<td><input type="text" name="playerName" id="playerName" value="Last, First"/></td>					
				</tr>
				<tr>
					<td class="rightAlign">Team Name:</td>
					<td>					
						<select id="teamSelect">
							<option value="All">All</option>						
							<option value="Packers">Packers</option>
							<option value="Lions">Lions</option>
							<option value="Bears">Bears</option>
							<option value="Vikings">Vikings</option>
							<option value="Cowboys">Cowboys</option>
							<option value="Titans">Titans</option>
						</select>
					</td>					
				</tr>
				<tr>
					<td class="rightAlign">Stat Category:</td>
					<td>
						<select id="statSelect">
							<option value="All">All</option>						
							<option value="Passing">Passing</option>
							<option value="Rushing">Rushing</option>
							<option value="Tackles">Tackles</option>
							<option value="Sacks">Sacks</option>
							<option value="Field Goals">Field Goals</option>
							<option value="Extra Points">Extra Points</option>
						</select>
					</td>					
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Search" id="searchButton" method="post" action="XXXXX"/></td>
				</tr>
			</table>
		
		</form>
		
	</div>
	
	
	<!-- MainContentRight Div -->
	<div id="MainContentRight" class="roundedEdges">
	
		<h2>Player Statistics</h2>
		
		
		<!-- Player Statistics Table -->
		
		<table rules=cols>
			<tr> <th class="rightBorder">Offense </th> <th> Defense </th> <th> Special Teams </th> </tr>  	 
			<tr>
				<td>
					<table class="innerTable">
						<?php while ($column = mysql_fetch_array($offenseResult)) { ?>
						<tr>
							<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXX"></a></td>
						</tr>
						<?php } ?>
					</table>
				</td> 
				<td>
					<table class="innerTable">
						<?php while ($column = mysql_fetch_array($defenseResult)) { ?>
						<tr>
							<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXX"></a></td>
						</tr>
						<?php } ?>
					</table>
				</td> 				
				<td>
					<table class="innerTable">
						<?php while ($column = mysql_fetch_array($specialResult)) { ?>
						<tr>
							<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXX"></a></td>
						</tr>
						<?php } ?>
					</table>
				</td> 				
			</tr>
		</table>
		
		
		
	
		
		
		
		
		
		<!--
		<table rules=cols>
			<tr> <th class="rightBorder">Offense </th> <th> Defense </th> <th> Special Teams </th> </tr> 
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Thing</a></td> 
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Tackles</a></td>
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Field Goals</a></td> 
			</tr>
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Rushing</a></td> 
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Sacks</a></td>
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Extra Points</a></td>
			</tr>
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Recieving</a></td> 
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Interceptions</a></td>
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Punting</a></td>
			</tr>
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Touchdowns</a></td> 
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Fumbles Forced</a></td>
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Kickoff Returns</a></td>
			</tr>
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Scoring</a></td> 
				<td>  </td>
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Punt Returns</a></td>
			</tr>
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Total QBR</a></td> 
				<td>  </td>
				<td>  </td>
			</tr>
		</table>
			
		-->
		<h2>Team Statistics</h2>
		
		<!-- Team Statistics Table -->
		<table rules=cols>
			<tr> <th class="rightBorder">Offense </th> <th> Defense </th> <th> Special Teams </th> </tr> 
			  <tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Passing</a></td> 
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Tackles</a></td>
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Field Goals</a></td> 
			</tr>
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Rushing</td> 
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Sacks</a></td>
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Points</a></td>
			</tr>
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Recieving </td> 
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Interceptions</a></td>
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Punting</a></td>
			</tr>
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Touchdowns</a></td> 
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Fumbles Forced</a></td>
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Kickoff Returns</a></td>
			</tr>
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Scoring</a></td> 
				<td>  </td>
				<td onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Punt Returns</a></td>
			</tr>
			<tr>
				<td class="rightBorder" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"><a href="XXXXX">Total Offense</a></td> 
				<td>  </td>
				<td>  </td>
			</tr>
		</table>
		

		<?php mysql_close(); ?>
</body>
</html>