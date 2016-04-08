<html>


<head>

    <title>   PC Helper  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>


<body>
    <?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
    <div id="userList">
        <?php
        foreach($users as $user) {
        echo '<a href="' . BASE_URL .  '/GoToUser/' . $user->get('username') . '">' . $user->get('username') .'</a> <br>';
    }
    ?>
    </div>
    <?php include_once SYSTEM_PATH.'/view/Header2.tpl'; ?>
</body>    
</html>
