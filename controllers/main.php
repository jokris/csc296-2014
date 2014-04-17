<?php

require_once('../models/room.php');
require_once('../models/equipment.php');

function run()
{
	$db = new PDO('mysql:host=localhost;dbname=csc296_prj','nwagar','IttRLT520');

	Model::set_connection($db);

	$equipment = Equipment::get_all();
	$rooms = Room::get_all();

	require('../views/main.php');
}

run();


