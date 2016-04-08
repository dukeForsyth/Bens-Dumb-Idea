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

			case 'delete':
			$this->delete();
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
			$this->viewUser($_GET['viewedUser']);
			break;

			case 'viewBuild':
			$this->viewBuild($_GET['viewedBuildID']);
			break;

			case 'browseUsers':
			$this->browseUsers();
			break;

			case 'publishBuild':
			$this->publishBuild();
			break;

			case 'like':
			$this->like();
			break;

			case 'dislike':
			$this->dislike();
			break;

			case 'comment':
			$this->comment();
			break;

			case 'follow':
			$this->follow();
			break;

			case 'unfollow':
			$this->unfollow();
			break;

            case 'searchUser':
            $this->search();
            break;
		}
	}

	public function home() {
		if(isset($_SESSION['username']) && $_SESSION['username'] != ''){
			$followingIDs = AppFollower::loadByUserkey(AppUser::loadByUsername($_SESSION['username'])->get('unique_id'));
			$activities = null;
			if ($followingIDs != null) {
				foreach ($followingIDs as $followingID) {
					$activities1 = AppActivities::loadByUserkey($followingID->get('followingID'));
					$followings[] = AppUser::loadByID($followingID->get('followingID'));
					if ($activities1 != null) {
						foreach ($activities1 as $activity) {
							$activities[] = $activity;
						}
					}
				}
			}
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
			case 'email':
			if ($_POST['email'] != null) {
				$curr->set('username', $_POST['email']);
				$curr->save();
				echo '<script type="text/javascript">alert("Email change succesful");</script>';
			}
			else {
				echo '<script type="text/javascript">alert("Invalid Entry");</script>';
			}
			break;
			case 'pass':
			if ($_POST['pw'] != null) {
				$curr->set('password', $_POST['pw']);
				$curr->save();
				echo '<script type="text/javascript">alert("Password change succesful");</script>';
			}
			else {
				echo '<script type="text/javascript">alert("Invalid Entry");</script>';
			}
			break;
			case 'gender':
			$curr->set('gender', $_POST['gender']);
			$curr->save();
			echo '<script type="text/javascript">alert("Gender change succesful");</script>';
			break;
			case 'first':
			if ($_POST['first'] != null) {
				$curr->set('firstname', $_POST['first']);
				$curr->save();
				echo '<script type="text/javascript">alert("First Name change succesful");</script>';
			}
			else {
				echo '<script type="text/javascript">alert("Invalid Entry");</script>';
			}
			break;
			case 'last':
			if ($_POST['last'] != null) {
				$curr->set('lastname', $_POST['last']);
				$curr->save();
				echo '<script type="text/javascript">alert("Last Name change succesful");</script>';
			}
			else {
				echo '<script type="text/javascript">alert("Invalid Entry");</script>';
			}
			break;

			default:
                        # code...
			break;
		}
		$this->viewUser($_SESSION['username']);
	}

	public function delete(){
                //Go through with the deletion
		$currID = AppUser::loadByUsername($_GET['account'])->get('id');
                //Delete from account, follower, activities
		AppUser::deleteUser($_GET['account']);
		AppFollower::deleteUser($curr);
		AppActivities::deleteUser($curr);               
		echo '<script type="text/javascript">alert("'. $_GET['account'] .' has been executed");</script>';
	}

	public function logout() {
				// erase the session
		unset($_SESSION['username']);
        session_destroy(); // for good measure

        // redirect to home page
        header('Location: '.BASE_URL);
    }

    public function browseBuild(){
    	$builds = AppBuilds::loadByUserkey(AppUser::loadByUsername($_SESSION['username'])->get('unique_id'));
    	$names = AppBuilds::loadNameByID($_SESSION['buildID']); 
        //Load the names into the newly created object, by using the id
    	$price = AppBuilds::loadTotalPrice($_SESSION['buildID']);

    	$currID = AppUser::loadByUsername($_SESSION['username'])->get('unique_id');

    	$published = AppActivities::checkPublished($currID,$_SESSION['buildID']);
    	include_once SYSTEM_PATH.'/view/BrowseBuilds.tpl';

    }

    public function create(){
    	$user = AppUser::loadByUsername($_POST['username']);
    	if ($_POST['username'] == '' || $_POST['password'] == '' || $_POST['fName'] == '' || $_POST['lName'] == '' || $_POST['emailAddress'] == '') {
    		echo '<script type="text/javascript">alert("Invalid Information");</script>';
    		$this->home();
    	}
    	else {
    		if($user == null){
    			if($_POST['password'] == $_POST['confirmPW']){
    				$currValues = array(
    					'username' => $_POST['username'], 
    					'password'=> $_POST['password'],
    					'firstName' => $_POST['fName'],
    					'lastName' => $_POST['lName'],
    					'emailAddress'=> $_POST['emailAddress']
    					);
    				$curr = new AppUser($currValues); 
    				$curr->save();
    				$_SESSION['username'] = $_POST['username'];
    				$this->createBuild();
    				$this->browseParts();
    			}
    			else{
    				echo '<script type="text/javascript">alert("The passwords don\'t match");</script>';
    				$this->home();
    			}
    		}
    		else{
    			echo '<script type="text/javascript">alert("Account already Exists");</script>';
    			$this->home();
    		}
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

    	$activityLog = array(
    		'userID' =>  AppUser::loadByUsername($_SESSION['username'])->getId(),
    		'content' => $_SESSION['username'] . ' has added part ' . $part->get('name') . ' to build ' . $_SESSION['buildID'],
    		'type' => "edited",
    		'buildID' => $_SESSION['buildID']
    		);

    	$curr = new AppActivities($activityLog);
        //Save the log
    	$curr->save();


    	$build->save();
    	header('Location: BrowseParts');
    }
    
    public function viewUser($userd){
    	$user = AppUser::loadByUsername($userd);
        //Check if the user looking at the profile are themselves
    	if($_SESSION['username'] == $userd){
    		$edit = TRUE;
    	}
    	else{
    		$edit = FALSE;
    	}
		//Checks for admin status
    	$adm = !(AppUser::loadByUsername($_SESSION['username'])->get('rank'));

    	$currentUser = AppUser::loadByUsername($_SESSION['username']);
    	$following = AppFollower::loadOneFollower($currentUser->get('unique_id'),$user->get('unique_id'));
    	$isFollowing = $following != null;
    	$activities = AppActivities::loadByUserkey($user->get('unique_id'));
    	include_once SYSTEM_PATH.'/view/Profile.tpl';
    }
    
    public function viewBuild($buildID ){

    	$creatorKey = AppBuilds::loadByID($buildID)->get('userkey');
    	$creatorName = AppUser::loadByID($creatorKey)->get('username');
    	$names = AppBuilds::loadNameByID($buildID); 
        //Load the names into the newly created object, by using the id
    	$price = AppBuilds::loadTotalPrice($buildID);

        //Checked if this build has been liked by this user
    	$currUserId = AppUser::loadByUsername($_SESSION['username'])->getId();
    	$liked = AppActivities::checkLiked($currUserId,$buildID);


    	include_once SYSTEM_PATH.'/view/ViewBuild.tpl';
    }
    
    public function browseUsers(){
    	$users = AppUser::getAllUsers();
    	include_once SYSTEM_PATH.'/view/BrowseUsers.tpl';
    }

    public function like(){
    	//Get creator name and key
    	$creatorKey = AppBuilds::loadByID($_GET['buildID'])->get('userkey');
    	$creatorName = AppUser::loadByID($creatorKey)->get('username');

    	$activityLog = array(
    		'userID' =>  AppUser::loadByUsername($_SESSION['username'])->getId(),
    		'content' => $_SESSION['username'] . ' has liked ' . $creatorName . '\'s build ' . $_GET['buildID'],
    		'type' => "liked",
    		'buildID' => $_GET['buildID'],
    		'recieverID' => $creatorKey
    		);
    	//Get the new activities
    	$curr = new AppActivities($activityLog);
    	$curr->save();
        header('Location:' .BASE_URL . '/'. 'ViewBuild/' . $_GET['buildID']);

    }

    public function dislike(){
    	$currID = AppUser::loadByUsername($_SESSION['username'])->getId();
    	AppActivities::deleteBuild($currID,$_GET['buildID']);
        header('Location:' .BASE_URL . '/'. 'ViewBuild/' . $_GET['buildID']);

    }

    public function comment(){
    	$creatorKey = AppBuilds::loadByID($_GET['buildID'])->get('userkey');
    	$creatorName = AppUser::loadByID($creatorKey)->get('username');

    	$activityLog = array(
    		'userID' =>  AppUser::loadByUsername($_SESSION['username'])->getId(),
    		'content' => $_SESSION['username'] . ' said "' . $_POST['comment'] . '" on build ' . $_GET['buildID'],
    		'type' => "commented",
    		'buildID' => $_GET['buildID'],
    		'recieverID' => $creatorKey
    		);

    	$curr = new AppActivities($activityLog);
    	$curr->save();
    	echo '<script type="text/javascript">alert("Comment saved");</script>';
        header('Location:' .BASE_URL . '/'. 'ViewBuild/' . $_GET['buildID']);


    }
    
    public function publishBuild(){
    	$currentUser = AppUser::loadByUsername($_SESSION['username']);
        
        $content = $_SESSION['username'] .' published their build, check it out <a href="' . BASE_URL .  '/ViewBuild/' . $_SESSION['buildID'] . '"> here! </a>';

    	$currValues = array(
    		'userID' => $currentUser->get('unique_id'), 
    		'type'=> 'published',
    		'buildID' => $_SESSION['buildID'],
            'content' => $content
    		);
    	$curr = new AppActivities($currValues); 
    	$curr->save();
    	header('Location: BrowseBuilds');
        #$this->browseBuild();
    }
    
    public function follow(){
    	$currentUser = AppUser::loadByUsername($_SESSION['username']);
    	$followedUserID = AppUser::loadByUsername($_GET['followedUser'])->get('unique_id');
    	$params = array(
    		'followingID'=>$followedUserID,
    		'userID'=>$currentUser->get('unique_id'),
    		);
    	$newFollowPair = new AppFollower($params);
    	$newFollowPair->save();
    	$content = sprintf('%s followed %s!',$_SESSION['username'],$_GET['followedUser']);
    	$currValues = array(
    		'userID' => $currentUser->get('unique_id'), 
    		'type'=> 'followed',
    		'recieverID' => $followedUserID,
    		'content' => $content
    		);
    	$curr = new AppActivities($currValues); 
    	$curr->save();
        header('Location:' .BASE_URL . '/'. 'GoToUser/' . $_GET['followedUser']);

    }
    
    public function unfollow(){
    	$currentUserID = AppUser::loadByUsername($_SESSION['username'])->get('unique_id');
    	$followedUserID = AppUser::loadByUsername($_GET['followedUser'])->get('unique_id');
    	AppFollower::deleteFollowPair($currentUserID,$followedUserID);
        AppActivities::deleteFollow($currentUserID, $followedUserID);
    	header('Location:' .BASE_URL . '/'. 'GoToUser/' . $_GET['followedUser']);
    }

    public function search(){
        $userFound = AppUser::loadByUsername($_POST['userNameSearch']);
        if($userFound == null){
            echo '<script type="text/javascript">alert("'.$_POST['userNameSearch'].' does not exist");</script>';
            $this->browseUsers();

        }else{
            header('Location:' .BASE_URL . '/'. 'GoToUser/' . $_POST['userNameSearch']);
        }



    }
}
