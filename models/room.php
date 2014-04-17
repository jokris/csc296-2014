<?php
require_once('model.php');

class Room extends Model {
        private $id, $name,$capacity,$accessible,$building,$audio,$video,$areaID;

        public static function get_all() {
		return Array();
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
				$this->accessible = $value;
				break;
			case 'Building':
				$this->building = $value;
				break;
			case 'Audio':
				$this->audio = $value;
				break;
			case 'Video':
				$this->video = $value;
				break;
                }
                throw new Exception('Property does not exist on type Equipment')
;
        }

}
