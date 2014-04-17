<?php
require_once('../models/room.php');

class RoomTest extends PHP_Unit_Framework_TestCase
{
	public function testGetAll()
	{
		$rslt = Room::get_all();
		$this->assertTrue(is_array($rslt));
	}
}
