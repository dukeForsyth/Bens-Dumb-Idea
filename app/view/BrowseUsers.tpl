<html>


<head>

    <title>   PC Helper  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>


<body>
    <?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
    <?php include_once SYSTEM_PATH.'/view/Header2.tpl'; ?>
    
    <div id="userList" style="padding-left:2%; padding-top: 2%;">
        All Users:<br>
        <?php
        foreach($users as $user) {
        echo '<a href="' . BASE_URL .  '/GoToUser/' . $user->get('username') . '">' . $user->get('username') .'</a> <br>';
    }
    ?>
    </div>
    
</body>    
</html>
