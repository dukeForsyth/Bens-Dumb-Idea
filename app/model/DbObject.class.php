<?php

class DbObject {
	protected $modified = false;
	
	public function getModified() {
		return $this->modified;
	}
	
	public function setModified($modified=false) {
		$this->modified = $modified;
	}
    
    public function get($field=null) {
        if($field == null)
            return null;
        
        return ($this->$field);
    }
    
    public function getId($unique = "unique_id") {
        return ($this->$unique);   
    }
    
    public function set($field=null, $val=null) {
        if($field == null)
            return null;
        
        $this->$field = $val;
        $this->modified = true;
    }
    
    public function setId($val) {
        $this->unique_id = $val;
        $this->modified = true;
    }
}