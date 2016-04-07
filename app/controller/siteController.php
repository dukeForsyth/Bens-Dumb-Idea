<?php

include_once '../global.php';
include_once '../../api/amazon_class.php';
// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new SiteController();
$sc->route($action);

class SiteController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			case 'home':
			$this->home();
			break;

			case 'user':
			$this->user();
			break;

			case 'login':
			$this->login();
			break;

			case 'logout':
			$this->logout();
			break;

			case 'create':
			$this->create();
			break;

			case 'changeBuild':
			$this->changeBuild();
			break;

			case 'browseBuild':
			$this->browseBuild();
			break;

			case 'browseParts':
			$this->browseParts("cpu");
			break;

            case 'changepart':
            $this->changepart();
            break;

            case 'addpart':
            $this->addpart();
            break;

            case 'edit':
            $this->edit();
            break;
                
            case 'profile':
            $this->viewUser();
            break;
        }

    }


    public function home() {
        if(isset($_SESSION['username']) && $_SESSION['username'] != ''){
            include_once SYSTEM_PATH.'/view/Home.tpl';
        }
        else{
            include_once SYSTEM_PATH.'/view/Login.tpl';
        }
    }


public function login() {
   $username = $_POST['username'];
   $passwd = $_POST['password'];
   $us = AppUser::loadByUsername($username);
   if($us == null) {
                        // username not found
       $_SESSION['error'] = "Incorrect username.";
   } elseif ($us->get('password') != $passwd) {
                        // passwords don't match
       $_SESSION['error'] = "Incorrect password.";
   } else {
                        // password matches!
                        // log me in
       $_SESSION['username'] = $username;
                    //Get build and set it to latest
       $currentUser = AppUser::loadByUsername($_SESSION['username']);
       $builds = AppBuilds::loadByUserKey($currentUser->get('unique_id'));
       $_SESSION['buildID'] = $builds[0]->get('unique_id');
       $this->home();
                        //$_SESSION['error'] = "You are logged in as ".$username.".";
   }
				// redirect to home page
}

public function edit(){
            //Get the current user
    $curr = AppUser::loadByUsername($_SESSION['username']);
            //Get the respective value that wants to be edited, change it, then save it.
    switch ($_GET['editID']) {
        #case 'user':
        #$curr->set('username', $_POST['uname']);
        #$curr->save();
        #echo $curr->get('username') . " has been saved";
        #break;
        case 'pass':
        $curr->set('password', $_POST['pw']);
        $curr->save();
        echo $curr->get('pw') . " has been saved";
        break;
        case 'gender':
        $curr->set('gender', $_POST['gender']);
        $curr->save();
        echo $curr->get('gender') . " has been saved";
        break;
        case 'first':
        $curr->set('firstname', $_POST['first']);
        $curr->save();
        echo $curr->get('first_name') . " has been saved";
        break;
        case 'last':
        $curr->set('lastname', $_POST['last']);
        $curr->save();
        echo $curr->get('last_name') . " has been saved";
        break;

        default:
                    # code...
        break;
    }
}


public function logout() {
				// erase the session
    unset($_SESSION['username']);
        session_destroy(); // for good measure

        // redirect to home page
        header('Location: '.BASE_URL);
    }

			//creates a new user, and then stores it

    public function browseBuild(){
        $builds = AppBuilds::loadByUserkey(AppUser::loadByUsername($_SESSION['username'])->get('unique_id'));
        $names = AppBuilds::loadNameByID($_SESSION['buildID']); 
        //Load the names into the newly created object, by using the id
        $price = AppBuilds::loadTotalPrice($_SESSION['buildID']);
        include_once SYSTEM_PATH.'/view/BrowseBuilds.tpl';

    }

    public function create(){
        $user = AppUser::loadByUsername($_POST['username']);
        if($_POST['password'] == $_POST['confirmPW'] && $user == null){

            $currValues = array(
                'username' => $_POST['username'], 
                'password'=> $_POST['password'],
                'firstName' => $_POST['fName'],
                'lastName' => $_POST['lName'],
                );
            $curr = new AppUser($currValues);
            $curr->save();
            $_SESSION['username'] = $_POST['username'];
            $this->createBuild();
            $this->browseParts();
        }
        else{
            echo '<script type="text/javascript">alert("Account already Exists");</script>';

            $this->home();
        }
    }

    public function changeBuild(){
        if($_GET['site'] == "create"){
            $this->createBuild();
            header('Location: ../BrowseParts');
        }
        elseif($_GET['site'] == "build"){
            $_SESSION['buildID'] = $_POST['buildID'];
            $this->browseBuild();
        }
        else{
            $_SESSION['buildID'] = $_POST['buildID'];
            header('Location: ../BrowseParts');
        }
    }

    public function createBuild(){
        $currentUser = AppUser::loadByUsername($_SESSION['username']);
        $param = array('userkey' => $currentUser->get('unique_id'));
        $build = new AppBuilds($param);
        $build->save();
        $_SESSION['buildID'] = $build->get('unique_id');
    }

    public function browseParts($part = "cpu"){
        $builds = AppBuilds::loadByUserkey(AppUser::loadByUsername($_SESSION['username'])->get('unique_id'));
            //print_r($builds);
        $parts = AppParts::loadByPartType($part);
        $param = "";
        foreach ($parts as $part) {
            $param = $param . $part->get('unique_id') . ",";
        }
        $param = substr($param,0,-1);
        $prices = getAmazonPrice($param);
        include_once SYSTEM_PATH.'/view/BrowseParts.tpl';
    }

    public function changepart(){
            //print_r($_POST['part']);
        $this->browseParts($_POST['part']);
    }

    public function addpart(){
        $partID = $_POST['addpart'];
        $part = AppParts::loadByID($partID);
        $build = AppBuilds::loadByID($_SESSION['buildID']);
        switch ($part->get('part_type')) {
            case 'cpu':
            $build->set('cpu_id',$partID);
            break;
            case 'videocard':
            $build->set('videocard_id',$partID);
            break;
            case 'motherboard':
            $build->set('motherboard_id',$partID);
            break;
            case 'memory':
            $build->set('memory_id',$partID);
            break;
            case 'storage':
            $build->set('storage_id',$partID);
            break;
        }
        $build->save();
        header('Location: BrowseParts');
    }
    
    public function viewUser(){
		$user = AppUser::loadByUsername($_GET['viewedUser']);
		if($_SESSION['username'] == $_GET['viewedUser']){
			$edit = TRUE;
		}
		else{
			$edit = FALSE;
		}
		include_once SYSTEM_PATH.'/view/Profile.tpl';
    }
}
