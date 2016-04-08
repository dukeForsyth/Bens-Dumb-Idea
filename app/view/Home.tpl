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
            
            <form id="buildform" action = "<?= BASE_URL ?>/BrowseParts">
                <button id="buildPC" type="submit"> Build  A PC </button>
                
            <br>
            </form>    
            <form id="resumeForm" action = "<?= BASE_URL ?>/BrowseBuilds">
                <button id="resumeBuild" type="submit"> Resume A Build </button>
            </form>
        </div>
    <div id="userList">
        
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
    </div>
        
    <div style="height: 100%; width: 30%; float:right;">
    <?php include_once SYSTEM_PATH.'/view/Header2.tpl'; ?>
    <div id="activityFeed">
        Activity Feed:<br>
        <?php
            if ($activities == null) {
                echo 'No activities';
            }
            else {
                foreach($activities as $activity) {
                    switch($activity->get('type')) {
                        case 'publish':
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
                        echo $activity->get('content') .'<br>';
                        break;
                    }
                }
            }
        ?>
    </div>
    </div>  
    
    </div>
</body>    
</html>
