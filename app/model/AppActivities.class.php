<?php

class AppActivities extends DbObject {
    // name of database table
    const DB_TABLE = 'activities';

    // database fields
    protected $unique_id;
    protected $userID;
    protected $dateMade;
    protected $content;
    protected $type;
    protected $recieverID;
    protected $buildID;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'unique_id' => null,
            'userID' => null,
            'dateMade' => date("h:i:a Y-m-d "),
            'content' => '',
            'recieverID' => null,
            'type' => '',
            'buildID' => null
            );

        $args += $defaultArgs;

        $this->postID = $args['unique_id'];
        $this->userID = $args['userID'];
        $this->dateMade = $args['dateMade'];
        $this->content = $args['content'];
        $this->buildID = $args['buildID'];
        $this->recieverID = $args['recieverID'];
        $this->type = $args['type'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'unique_id' => $this->unique_id,
			'userID' => $this->userID,
            'dateMade' => $this->dateMade,
            'content' => $this->content,
            'recieverID' => $this->recieverID,
            'type' => $this->type,
            'buildID' => $this->buildID
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

    public static function checkLiked($userID, $buildID) {
        if($userID === null)
            return null;

        $query = sprintf(" SELECT unique_id FROM %s WHERE userID = '%s' AND buildID = '%s' AND type ='liked'",
            self::DB_TABLE,
            $userID,
            $buildID
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        return mysqli_num_rows($result);
        
    }

     public static function deleteUser($userID=null) {
        if($userID === null)
            return null;


        $query = "DELETE FROM activities WHERE userID ='$userID' ";
        $db = Db::instance();

        
        $db->execute($query);

    }

    public static function deleteBuild($userID,$buildID=null) {
        if($userID === null)
            return null;


        $query = "DELETE FROM activities WHERE buildID ='$buildID' AND userID ='$userID' AND type = 'liked'";
        $db = Db::instance();

        
        $db->execute($query);

    }
}