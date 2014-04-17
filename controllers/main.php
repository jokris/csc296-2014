<?php

require_once('../models/room.php');
require_once('../models/equipment.php');

function run()
{
	$equipment = Equipment::get_all();
	$rooms = Room::get_all();

	require('../views/main.php');
}

run();


