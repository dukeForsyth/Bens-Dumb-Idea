<?php

class AppBuilds extends DbObject {
    // name of database table
    const DB_TABLE = 'builds';

    // database fields
    protected $unique_id;
    protected $userkey;
    protected $cpu_id;
	protected $videocard_id;
	protected $motherboard_id;
	protected $memory_id;
	protected $storage_id;
	protected $price;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'unique_id' => null,
            'userkey' => '',
            'cpu_id' => '',
			'videocard_id' => '',
			'motherboard_id' => '',
			'memory_id' => '',
			'storage_id' => '',
			'price' => ''
            );

        $args += $defaultArgs;

        $this->unique_id = $args['unique_id'];
        $this->userkey = $args['userkey'];
		$this->cpu_id = $args['cpu_id'];
		$this->videocard_id = $args['videocard_id'];
		$this->motherboard_id = $args['motherboard_id'];
		$this->memory_id = $args['memory_id'];
		$this->storage_id = $args['storage_id'];
		$this->price = $args['price'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'unique_id' => $this->unique_id,
			'userkey' => $this->userkey,
            'cpu_id' => $this->cpu_id,
			'videocard_id' => $this->videocard_id,
			'motherboard_id' => $this->motherboard_id,
			'memory_id' => $this->memory_id,
			'storage_id' => $this->storage_id,
			'price' => $this->price
			);
			
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID, use the unique_id for the specifc build wanted
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, "unique_id", __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load all builds by a users unique_id(userkey)
    public static function loadByUserkey($userkey) {
        $query = sprintf(" SELECT unique_id FROM %s WHERE userkey = '%s'",
            self::DB_TABLE,
            $userkey                     
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysqli_num_rows($result))
            return null;
        else {
            $objects = array();
            while($row = mysqli_fetch_assoc($result)) {
                $objects[] = self::loadById($row['unique_id']);
            }
            return ($objects);
        }
    }
   
    //Delete a build, use the builds unique_id
    public static function deleteBuild($unique_id=null) {
        if($unique_id === null)
            return null;


        $query = "DELETE FROM builds WHERE unique_id='$unique_id'";
        $db = Db::instance();

        
        $db->execute($query);

    }

    public static function loadNameByID($id){
        $curr = AppBuilds::loadById($id);
        $names = (object)array();
        foreach($curr as $key=>$value){
            if(is_null($value) || $key == "userkey"){
                $names->$key = "Nothing chosen";
            }
            else if($key == "unique_id"){
                 $names->$key = $value;
            }
            else if($key == "price" || $key == "modified"){
                //do nothing
            }
            else{
                $names->$key = AppParts::loadByID($value)->get('name');
            }
        }
        return $names;
    }

}