<?php
require_once('model.php');

class Room extends Model {
        private $id, $name,$capacity,$accessible,$building,$audio,$video,$areaID;
	protected function Model($id) {
                $this->id = $id;
        }

        protected static function Create() {
                return new Room(null);
        }

        public static function get_all() {
                $rs = Array();
                $sth = self::$_db->prepare('SELECT * FROM Room');
                $sth->execute();
                while ($row = $sth->fetch(PDO::FETCH_OBJ)) {
                        $obj = new Room($row->RoomID);

                        $obj->Name = $row->Name;
                        $obj->AreaID = $row->AreaID;
			$obj->Capacity = $row->Capacity;
			$obj->Accessible = $row->Accessible;
			$obj->Building = $row->Building;
			$obj->Audio = $row->Audio;
			$obj->Video = $row->Video;

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
                        case 'AreaID':
                                return $this->AreaID;
			case 'Capacity':
				return $this->capacity;
			case 'Accessible':
				return $this->accessible;
			case 'Building':
				return $this->building;
			case 'Audio':
				return $this->audio;
			case 'Video':
				return $this->video;
                }

                throw new Exception('Property does not exist on type Equipment')
;
        }

        public function __set($key, $value) {
                switch($key) {
                        case 'ID':
                                throw new Exception('Property ID is read-only on
 type Equipment');
                        case 'Name':
                                $this->name = $value;
                                break;
                        case 'AreaID':
                                $this->AreaID = $value;
                                break;
			case 'Capacity':
				$this->capacity = $value;
				break;
			case 'Accessible':
                                if ($value)
					$this->accessible = true;
				else
					$this->accessible = false;
				break;
			case 'Building':
				$this->building = $value;
				break;
			case 'Audio':
				if ($value != 'Provided' && $value != 'Ready' && $value != 'Unsupported')
					throw new Exception('Invalid value.');
				$this->audio = $value;
				break;
			case 'Video':
                                if ($value != 'Provided' && $value != 'Ready' && $value != 'Unsupported')
                                        throw new Exception('Invalid value.');

				$this->video = $value;
				break;
			default:
				throw new Exception('Property "' . $key . '" does not exist on type Equipment');
                }
        }

}
