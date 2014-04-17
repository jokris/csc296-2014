<!DOCTYPE html>
<html>
<head>
<title>Team 9 Event and Resource Management System</title>
</head>
<body>

<h2>Rooms</h2>
<table>
<thead>
<tr>
<th>Name</th>
<th>Capacity</th>
<th>Accessible</th>
<th>Building</th>
<th>Audio</th>
<th>Video</th>
<th>AreaID</th>
</tr>
</thead>
<tbody>
<?php
foreach ($rooms as $rm) {
	?>
	<tr>
		<td><?= $rm->Name ?></td>
		<td><?= $rm->Capacity ?></td>
		<td><?= $rm->Accessible ?></td>
		<td><?= $rm->Building ?></td>
		<td><?= $rm->Audio ?></td>
		<td><?= $rm->Video ?></td>
		<td><?= $rm->AreaID ?></td>
	</tr>
	<?php
}
?>
</tbody>
</table>

<h2>Equipment</h2>
<table>
<thead>
<tr>
<th>Name</th>
<th>Condition</th>
<th>AcquiredDT</th>
<th>AreaID</th>
</tr>
</thead>
<tbody>
<?php
foreach ($equipment as $eq) {
        ?>
        <tr>
                <td><?= $eq->Name ?></td>
                <td><?= $eq->Condition ?></td>
                <td><?= $eq->AcquiredDT ?></td>
                <td><?= $eq->AreaID ?></td>
        </tr>
        <?php
}
?>
</tbody>
</table>

</body>
</html>
