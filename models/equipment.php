<?php
require_once('model.php');

class Equipment extends Model {
	private $id, $name, $condition, $acquiredDT, $areaID;

	protected function Equipment($id) {
		$this->id = $id;
	}

	protected static function Create() {
		return new Equipment(null);
	}

	public static function get_all() {
		$rs = Array();
		$sth = self::$_db->prepare('SELECT * FROM Equipment');
		$sth->execute();
		while ($row = $sth->fetch(PDO::FETCH_OBJ)) {
			$obj = new Equipment($row->EquipmentID);

			$obj->Name = $row->Name;
			$obj->Condition = $row->Condition;
			$obj->AcquiredDT = $row->AcquiredDT;
			$obj->AreaID = $row->AreaID;

			array_push($rs,$obj);
		}
		return $rs;
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
                                if ($value != null && $value != 'NEW' && $value != 'GOOD' && $value != 'NEEDS REPAIR')
                                        throw new Exception('Invalid value.');

				$this->condition = $value;
				break;
			case 'AcquiredDT':
				$this->acquiredDT = $value;
				break;
			case 'AreaID':
				$this->AreaID = $value;
				break;
			default:
				 throw new Exception('Property "' . $key . '" does not exist on type Equipment');
		}
	}
}
