<?php

class AppActivities extends DbObject {
    // name of database table
    const DB_TABLE = 'activities';

    // database fields
    protected $postID;
    protected $userID;
    protected $dateMade;
    protected $content;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'postID' => null,
            'userID' => null,
            'dateMade' => '',
            'content' => ''
            );

        $args += $defaultArgs;

        $this->postID = $args['postID'];
        $this->userID = $args['userID'];
        $this->dateMade = $args['dateMade'];
        $this->content = $args['content'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'postID' => $this->postID,
			'userID' => $this->userID,
            'dateMade' => $this->dateMade,
            'content' => $this->content
			);
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID, use unique_id
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id,"postID", __CLASS__, self::DB_TABLE);
        return $obj;
    }
    
    public static function loadByUserkey($userID) {
        $query = sprintf(" SELECT postID FROM %s WHERE userID = '%s'",
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
                $objects[] = self::loadById($row['postID']);
            }
            return ($objects);
        }
    }
}