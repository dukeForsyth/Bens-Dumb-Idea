<html>


<head>

    <title>   PC Helper  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>


<body>
    <?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
    <div id="div_middle">
    
    <div id="userList">
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
    <br>
</div>
    <div id="activityFeed">
        <?php
            foreach($activities as $activity) {
            echo $activity;
        }
        ?>
    </div>
<?php include_once SYSTEM_PATH.'/view/Header2.tpl'; ?>
    <p id="welcome">  Welcome Back!  </p>

    <form action = "<?= BASE_URL ?>/BrowseParts">
        <button id="buildPC" type="submit"> Build  A PC </button>
    </form>
    <br>
    
    <form action = "<?= BASE_URL ?>/BrowseBuilds">
        <button id="resumeBuild" type="submit"> Resume A Build </button>
    </form>
    
    
    
    </div>
</body>    
</html>
