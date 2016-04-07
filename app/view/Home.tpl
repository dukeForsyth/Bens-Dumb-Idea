<html>


<head>

    <title>   PC Helper  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>


<body>
    <?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
    <p id="welcome">  Welcome Back!  </p>
    <form action = "<?= BASE_URL ?>/BrowseParts">
        <button id="buildPC" type="submit"> Build  A PC </button>
    </form>
    
    <form action = "<?= BASE_URL ?>/BrowseBuilds">
        <button id="resumeBuild" type="submit"> Resume A Build </button>
    </form>
    <div id="userList">
        <?php
        foreach($users as $user) {
        echo '<a href="' . BASE_URL .  '/GoToUser/' . $user->get('username') . '">' . $user->get('username') .'</a> <br>';
    }
    ?>
</div>
    <div id="activityFeed">
        <?php
            foreach($activities as $activity) {
            echo $activity;
        }
        ?>
    </div>
    <?php include_once SYSTEM_PATH.'/view/Header2.tpl'; ?>
</body>    
</html>
