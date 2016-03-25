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

			case 'browseParts':
			$this->browseParts("cpu");
			break;
                
            case 'changepart':
            $this->changepart();
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

	public function user() {

		if(isset($_SESSION['username']) && $_SESSION['username'] != ''){
			$user = AppUser::loadByUsername($_SESSION['username']);
		}
		include_once SYSTEM_PATH.'/view/User.tpl';
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
			$builds = AppBuilds::loadByUserKey($currKey);
			$_SESSION['buildID'] = $builds[0]->get('unique_id');
			$this->home();
					//$_SESSION['error'] = "You are logged in as ".$username.".";
		}

				// redirect to home page
//		$this->home();
	}

	public function logout() {
				// erase the session
		unset($_SESSION['username']);
				session_destroy(); // for good measure

				// redirect to home page
				header('Location: '.BASE_URL);
			}

			//creates a new user, and then stores it
			public function create(){
				if($_POST['password'] == $_POST['confirmPW']){
					$currValues = array('username' => $_POST['username'], 
						'password'=> $_POST['password']
						);
					$curr = new AppUser($currValues);
					$curr->save();
					$_SESSION['username'] = $_POST['username'];
					$this->createBuild();
					$this->browseParts();
				}
				else{
					include_once SYSTEM_PATH.'/view/Home.tpl';
					echo "Your passwords don't match";
				}
			}

			public function changeBuild(){
				$_SESSION['buildID'] = $_GET['buildID'];
				if($_GET['site'] == build){
					$this->browseBuild();
				}
				else{
					$this->browseParts();
				}

			}


			public function browseBuild(){
				/*$currKey = AppUser::loadByUsername($_SESSION['username'])->get('unique_id');
				$builds = AppBuilds::loadByUserKey($currKey);
				$currBuild = $_SESSION['buildID']; */
				include_once SYSTEM_PATH.'/view/browseBuilds.tpl';

			}
    
            public function createBuild(){
                $currentUser = AppUser::loadByUsername($_SESSION['username']);
                $param = array('userkey' => $currentUser->get('unique_id'));
                $build = new AppBuilds($param);
                $build->save();
                $_SESSION['buildID'] = $build->get('unique_id');
                $this->browseParts("cpu");
            }
    
            public function browseParts($part){
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
		}
