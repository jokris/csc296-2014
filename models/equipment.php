<?php
require_once('model.php');

class Equipment extends Model {
	private $id, $name, $condition, $acquiredDT, $areaID;

	public static function get_all() {
		return Array();
	}

	public function __get($key) {
		switch($key) {
			case 'ID':
				return $this->id;
			case 'Name':
				return $this->name;
			case 'Condition':
				return $this->condition;
			case 'AcquiredDT':
				return $this->acquiredDT;
			case 'AreaID':
				return $this->AreaID;
		}

		throw new Exception('Property does not exist on type Equipment');
	}

	public function __set($key, $value) {
		switch($key) {
			case 'ID':
				throw new Exception('Property ID is read-only on type Equipment');
			case 'Name':
				$this->name = $value;
				break;
			case 'Condition':
				$this->condition = $value;
				break;
			case 'AcquiredDT':
				$this->acquiredDT = $value;
				break;
			case 'AreaID':
				$this->AreaID = $value;
				break;
		}
		throw new Exception('Property does not exist on type Equipment');
	}
}
