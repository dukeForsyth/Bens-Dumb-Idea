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
                
            case 'browseParts':
            $this->browseParts();
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

	public function about() {

		include_once SYSTEM_PATH.'/view/About.tpl';
	}

	public function contact() {

		include_once SYSTEM_PATH.'/view/Contact.tpl';
	}

	public function forum() {

		include_once SYSTEM_PATH.'/view/Forum.tpl';
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
            print("logged in");
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

			public function edit(){
			//Get the current user
				$curr = AppUser::loadByUsername($_SESSION['username']);
			//Get the respective value that wants to be edited, change it, then save it.
				switch ($_GET['editID']) {
					case 'user':
					$curr->set('username', $_POST['uname']);
					$curr->save();
					echo $curr->get('username') . " has been saved";
					break;
					case 'pass':
					$curr->set('pw', $_POST['pw']);
					$curr->save();
					echo $curr->get('pw') . " has been saved";
					break;
					case 'email':
					$curr->set('email', $_POST['email']);
					$curr->save();
					echo $curr->get('email') . " has been saved";
					break;
					case 'first':
					$curr->set('first_name', $_POST['first']);
					$curr->save();
					echo $curr->get('first_name') . " has been saved";
					break;
					case 'last':
					$curr->set('last_name', $_POST['last']);
					$curr->save();
					echo $curr->get('last_name') . " has been saved";
					break;

					default:
					# code...
					break;
				}
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

			public function delete(){
				//Ensure the user wants to delete the account
				echo "Are You Sure?<br>";
				echo '<a href="'.BASE_URL.'/deleteUser"> Yes </a><br>';
				echo '<a href="'.BASE_URL.'/user"> No </a>';

			}

			public function deleteUser(){
				//Go through with the deletion
				AppUser::deleteUser($_SESSION['username']);
				$this->logout();

			}

			public function listUsers(){
				//Iterate through all the list of users
				$users = AppUser::getAllUsers();
				foreach($users as $user) {
					echo $user->get('username') . "<br>";
				}

			}
    
            public function createBuild(){
                $currentUser = AppUser::loadByUsername($_SESSION['username']);
                $param = array('userkey' => $currentUser->get('unique_id'));
                $build = new AppBuilds($param);
                $build->save();
                $_SESSION['buildID'] = $build->get('unique_id');
                $this->browseParts();
            }
    
            public function browseParts(){
                $builds = AppBuilds::loadByUserkey(AppUser::loadByUsername($_SESSION['username'])->get('unique_id'));
                $parts = AppParts::loadByPartType("cpu");
                $param = "";
                foreach ($parts as $part) {
                    $param = $param . $part->get('unique_id') . ",";
                }
                $param = substr($param,0,-1);
                $prices = getAmazonPrice($param);
                include_once SYSTEM_PATH.'/view/BrowseParts.tpl';
            }
		}
