<html>


<head>

    <title>   PC Helper  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>


<body>
    <?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
    <div id="div_middle">
    <?php include_once SYSTEM_PATH.'/view/Header2.tpl'; ?>  
    <div style="width:35%;float:left;">
    <?php    
    if($edit == true){
    ?> 
    <div id="profile"> 
        Your User Name<br>
        <?= $user->get('username') ?><br><br>
        Email Address<br>
        <form method="POST" action="<?= BASE_URL ?>/edit/email">
            <input type="text" value="<?= $user->get('emailAddress') ?>" name="email"> <br>
            <input type="submit" value="Save">
        </form>
        Password<br>
        <form method="POST" action="<?= BASE_URL ?>/edit/pass">
            <input type="password" value="<?= $user->get('password') ?>" name="pw"> <br>
            <input type="submit" value="Save">
        </form>
        Your Gender: <?= $user->get('gender') ?><br>
        <form method="POST" action="<?= BASE_URL ?>/edit/gender">
            <select  name="gender">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Not Specified">Not Specified</option>
            </select>
            <input type="submit" value="Save">
        </form>
        Your First Name<br>
        <form method="POST" action="<?= BASE_URL ?>/edit/first">
            <input type="text" value="<?= $user->get('firstName') ?>" name="first"> <br>
            <input type="submit" value="Save">
        </form>
        Your Last Name<br>
        <form method="POST" action="<?= BASE_URL ?>/edit/last">
            <input type="text" value="<?= $user->get('lastName') ?>" name="last"> <br>
            <input type="submit" value="Save">
        </form>
           <!-- <form method="POST" action="<?= BASE_URL ?>/delete">
                <input type="submit" value="Delete Account">
            </form> --> 
        </div>
        <?php 
    }
    if($adm){
    ?>
    <div id="removeUser">
        <form method="POST" action="<?= BASE_URL ?>/delete/<?= $user->get('username') ?>">
            <input type="submit" value="Delete Account">
        </form>
    </div>
    
    <?php
    }
    ?>
        <?php    
    if($edit != true){
        if($isFollowing){
    ?>
    <div id="unfollowUser">
        <form method="POST" action="<?= BASE_URL ?>/unfollow/<?= $user->get('username') ?>">
            <input type="submit" value="Unfollow User">
        </form>
    </div>
    <?php
    }
    else {
    ?>
    <div id="followUser">
        <form method="POST" action="<?= BASE_URL ?>/follow/<?= $user->get('username') ?>">
            <input type="submit" value="Follow User">
        </form>
    </div>
    <?php }} ?>
    </div>
    <div id="userActivities">
        Activity Feed:<br>
        <?php
            if ($activities == null) {
                echo 'No activities';
            }
            else {
                foreach($activities as $activity) {
                    switch($activity->get('type')) {
                        case 'published':
                        $publisher = AppUser::loadByID($activity->get('userID'))->get('username');
                        echo $publisher. ' published their build, check it out <a href="' . BASE_URL .  '/ViewBuild/' . $activity->get('buildID') . '">' . 'here!' .'</a> <br>';
                        break;

                        case 'edited':
                        echo $activity->get('content') .'<br>';
                        break;

                        case 'followed':
                        echo $activity->get('content') .'<br>';
                        break;

                        case 'liked':
                        echo $activity->get('content') .'<br>';
                        break;

                        case 'commented':
                        $publisher = AppUser::loadByID($activity->get('userID'))->get('username');
                        $reciever = AppUser::loadByID($activity->get('recieverID'))->get('username');
                        echo $publisher. ' commented on '. $reciever. 's build, check out the comment <a href="' . BASE_URL .  '/ViewComment/' . $activity->get('buildID') . '">' . 'here!' .'</a> <br>';
                        break;
                    }
                }
            }
        ?>
    </div>
    
    </div>  
</body>
</html>
