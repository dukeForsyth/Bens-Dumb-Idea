<?php

include_once '../global.php';
#include_once '../../api/amazon_class.php';
// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new visualize();
$sc->route($action);

class visualize {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {

			case 'random':
			$this->rand();
			break;

			case 'remove':
			$this->remove();
			break;
			
        }
    }


    private function update() {
        $names = AppBuilds::loadNameByID($_SESSION['buildID']);

        echo json_encode($names);

    }

    public function rand(){
    	$type = $_GET['type'];
        $currBuild = AppBuilds::loadById($_SESSION['buildID']);
        
        $currBuild->set($type . "_id", AppParts::random($type));
        $currBuild->save();

        $this->update();


    }


    public function remove(){
    	$type = $_GET['type'];
    	$currBuild = AppBuilds::loadById($_SESSION['buildID']);
    	
    	$currBuild->set($type . "_id", '');
    	$currBuild->save();

    	$this->update();
    }


    
}
