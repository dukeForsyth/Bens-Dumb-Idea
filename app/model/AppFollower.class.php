<?php

class AppFollower extends DbObject {
    // name of database table
    const DB_TABLE = 'follower';

    // database fields
    protected $followingID;
    protected $userID;
    protected $unique_id;
    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'followingID' => null,
            'userID' => null,
            'unique_id' => null
            );

        $args += $defaultArgs;

        $this->followingID = $args['followingID'];
        $this->userID = $args['userID'];
        $this->unique_id = $args['unique_id'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'followingID' => $this->followingID,
			'userID' => $this->userID,
            'unique_id' => $this->unique_id
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
    
    public static function loadOneFollower($userID1, $followingID1) {
        $query = sprintf(" SELECT unique_id FROM %s WHERE userID = '%s' AND followingID = '%s'",
            self::DB_TABLE,
            $userID1,
            $followingID1
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysqli_num_rows($result)) {
            return null;
        }
        else {
            $row = mysqli_fetch_assoc($result);
            $obj = self::loadById($row['unique_id']);
            return ($obj);
        }
    }

    public static function deleteUser($id=null) {
        if($id === null)
            return null;


        $query = "DELETE FROM follower WHERE userID ='$id' OR followingID = '$id'";
        $db = Db::instance();

        
        $db->execute($query);

    }
    
    public static function deleteFollowPair($id=null,$fid=null) {
        if($id === null || $fid === null)
            return null;

        $query = "DELETE FROM follower WHERE userID ='$id' AND followingID = '$fid'";
        $db = Db::instance();        
        $db->execute($query);
    }
}