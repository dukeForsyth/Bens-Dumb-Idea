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

        $this->id = $args['id'];
        $this->username = $args['username'];
        $this->pw = $args['pw'];
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
    public static function loadByUniqueId($unique_id=null) {
        if($unique_id === null)
            return null;

        $query = sprintf(" SELECT id FROM %s WHERE username = '%s' ",
            self::DB_TABLE,
            $unique_id
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysqli_num_rows($result))
            return null;
        else {
            $row = mysqli_fetch_assoc($result);
            $obj = self::loadById($row['id']);
            return ($obj);
        }
    }
 

}