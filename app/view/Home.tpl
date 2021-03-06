<html>


<head>

    <title>   PC Helper  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>


<body>
    <?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
    <div id="div_middle">
        <div id="welcomeAndButtons">
            <p id="welcome">  Welcome Back!  </p>
            
            <br> <br>
            <form action = "<?= BASE_URL ?>/BrowseParts">
                <button id="buildPC" type="submit"> Build  A PC </button>
                
            
            </form>
            
            <br>
            <form action = "<?= BASE_URL ?>/BrowseBuilds">
                <button id="resumeBuild" type="submit"> Resume A Build </button>
            </form>
        </div>
    <div id="userList">
        <p style="padding-left:20px; padding-top:105px; margin:0;">
        People you are following: <br>
        <?php
        if (empty($followings)) {
            echo 'You are not following anybody';
        }
        else {
            foreach($followings as $user) {
                echo '<a href="' . BASE_URL .  '/GoToUser/' . $user->get('username') . '">' . $user->get('username') .'</a> <br>';
            }
        }
        ?>
        </p>
    </div>
    <div style="width:35%; float:right;">
    <div id="userInfo" style="width:97%">
        Welcome <a href="<?= BASE_URL ?>/GoToUser/<?= $_SESSION['username'] ?>"><?= $_SESSION['username'] ?></a>,  <a href="<?= BASE_URL ?>/logout"> Log Out</a><br>
        <form id="searchUser" method="POST" action="">
            <input type="text" name="userNameSearch" placeholder="Search Username">
            <input type="submit" value="Search">
        </form>
    </div>
    <div id="activityFeed">
        <p style="padding-left:35px; padding-top:21px; margin:0;">
        Activity Feed:<br>
        <ul>
        <?php
            if ($activities == null) {
                echo 'Nobody that you are following has done anything';
            }
            else {
                foreach($activities as $activity) {
                    switch($activity->get('type')) {
                        case 'published':
                        $publisher = AppUser::loadByID($activity->get('userID'))->get('username');
                        echo '<li>' .$publisher. ' published their build, check it out <a href="' . BASE_URL .  '/ViewBuild/' . $activity->get('buildID') . '">' . 'here!' .'</a> </li>';
                        break;

                        case 'edited':
                        echo '<li>' .$activity->get('content') .'</li>';
                        break;

                        case 'followed':
                        echo '<li>' .$activity->get('content') .'</li>';
                        break;

                        case 'liked':
                        echo '<li>' .$activity->get('content') .'</li>';
                        break;

                        case 'commented':
                        $publisher = AppUser::loadByID($activity->get('userID'))->get('username');
                        $reciever = AppUser::loadByID($activity->get('recieverID'))->get('username');
                        ?>
                        <li><?= $publisher ?> commented on <?= $reciever ?> build, check out the comment <a href="<?= BASE_URL ?>/ViewComment/<?=  $activity->getID() ?>">here!</a></li>
                        <?php
                        break;
                    }
                }
            }
        ?>
        </ul>
        </div>
        </div>
    </div>
    </body>
</html>
