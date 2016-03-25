<?php

class AppParts extends DbObject {
    // name of database table
    const DB_TABLE = 'parts';

    // database fields
    protected $unique_id;
    protected $part_type;
    protected $name;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'unique_id' => null,
            'part_type' => '',
            'name' => ''
            );

        $args += $defaultArgs;

        $this->unique_id = $args['unique_id'];
        $this->part_type = $args['name'];
        $this->name = $args['part_type'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'unique_id' => $this->unique_id,
			'part_type' => $this->username,
            'name' => $this->pw
			);
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID, use unique_id
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load part by unique_id
    public static function loadByPartType($type) {
        if($type === null)
            return null;

        $query = sprintf(" SELECT unique_id FROM %s WHERE part_type = '%s' ",
            self::DB_TABLE,
            $type
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysqli_num_rows($result))
            return null;
        else {
            $row = mysqli_fetch_assoc($result);
            $obj = self::loadById($row['unique_id']);
            return ($obj);
        }
    }
 

}