<?php

class AppFollower extends DbObject {
    // name of database table
    const DB_TABLE = 'follower';

    // database fields
    protected $followingID;
    protected $userID;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'followingID' => null,
            'userID' => null
            );

        $args += $defaultArgs;

        $this->followingID = $args['followingID'];
        $this->userID = $args['userID'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'followingID' => $this->unique_id,
			'userID' => $this->userID
			);
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID, use unique_id
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id,"unique_id", __CLASS__, self::DB_TABLE);
        return $obj;
    }
    
    public static function loadByUserkey($userID) {
        $query = sprintf(" SELECT unique_id FROM %s WHERE userID = '%s'",
            self::DB_TABLE,
            $userID             
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
}