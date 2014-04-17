<?php

abstract class Model {
	protected static $_db;
	public static function set_connection($conn) {
		self::$_db = $conn;
	}

	public abstract static function get_all(); 
}

