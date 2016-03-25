<?php

class AppUser extends DbObject {
    // name of database table
    const DB_TABLE = 'users';

    // database fields
    protected $unique_id;
    protected $username;
    protected $password;
	
    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'unique_id' => null,
            'username' => '',
            'password' => ''
            );

        $args += $defaultArgs;

        $this->unique_id = $args['unique_id'];
        $this->username = $args['username'];
        $this->password = $args['password'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'unique_id' => $this->unique_id,
			'username' => $this->username,
            'password' => $this->password
			);
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, "id",__CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load user by unique_id
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
    //Retrive all users
    public static function getAllUsers() {
         $query = sprintf(" SELECT id FROM %s ",
            self::DB_TABLE
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysqli_num_rows($result))
            return null;
        else {
            $objects = array();
            while($row = mysqli_fetch_assoc($result)) {
                $objects[] = self::loadById($row['id']);
            }
            return ($objects);
        }
    }
    //Delete the user with a query by unique_id
    public static function deleteUser($unique_id=null) {
        if($unique_id === null)
            return null;


        $query = "DELETE FROM users WHERE unique_id='$unique_id' ";
        $db = Db::instance();

        
        $db->execute($query);

    }

}