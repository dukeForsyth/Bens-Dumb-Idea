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
            <form action = "<?= BASE_URL ?>/BrowseParts" style="display:inline-block">
                <button id="buildPC" type="submit"> Build  A PC </button>
                
            <br>
            </form>
            <form action = "<?= BASE_URL ?>/BrowseBuilds" style="display:inline-block">
                <button id="resumeBuild" type="submit"> Resume A Build </button>
            </form>
        </div>
    <div id="userList">
        <p style="padding-left:20px; padding-top:85px; margin:0;">
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
        
    <div style="height: 100%; width: 30%; float:right;">
    <?php include_once SYSTEM_PATH.'/view/Header2.tpl'; ?>
    <div id="activityFeed">
        <p style="padding-left:20px; padding-top:21px; margin:0;">
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
                        echo '<li>' . $activity->get('content') .'</li>';
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
                        echo '<li>' .$activity->get('content') .'</li>';
                        break;
                    }
                }
            }
        ?>
        </ul>
        </p>
    </div>
    </div>  
    
    </div>
</body>    
</html>
