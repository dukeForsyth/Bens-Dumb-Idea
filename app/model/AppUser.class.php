<?php

class AppUser extends DbObject {
    // name of database table
    const DB_TABLE = 'users';

    // database fields
    protected $unique_id;
    protected $username;
    protected $password;
    protected $firstName;
    protected $lastName;
	protected $rank;
    protected $gender;
    protected $emailAddress;
    
    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'unique_id' => null,
            'username' => '',
            'password' => '',
            'firstName' => '',
            'lastName' => '',
            'gender' => '',
            'rank' => 1,
            'emailAddress' => ''
            );

        $args += $defaultArgs;

        $this->unique_id = $args['unique_id'];
        $this->username = $args['username'];
        $this->password = $args['password'];
        $this->firstName = $args['firstName'];
        $this->lastName = $args['lastName'];
        $this->rank = $args['rank'];
        $this->gender = $args['gender'];
        $this->emailAddress = $args['emailAddress'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'unique_id' => $this->unique_id,
			'username' => $this->username,
            'password' => $this->password,
            'firstName' => $this->firstName,
            'lastName' => $this->lastName,
            'rank' => $this->rank,
            'gender' => $this->gender
            'emailAddress' => $this->emailAddress
			);
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, "unique_id", __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load user by unique_id
    public static function loadByUsername($username) {
        if($username === null)
            return null;

        $query = sprintf(" SELECT unique_id FROM %s WHERE username = '%s' ",
            self::DB_TABLE,
            $username
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