<html>


<head>

    <title>   PC Helper  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>


<body>
    <?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
    <?php    
    if($edit == true){
    ?> 

    <div id="profile"> 
        <h4>Your User Name</h4>
        <?= $user->get('username') ?>
        <h4>Email Address</h4>
        <form method="POST" action="<?= BASE_URL ?>/edit/email">
            <input type="text" value="<?= $user->get('emailAddress') ?>" name="email"> <br>
            <input type="submit" value="Save">
        </form>
        <h4>Password</h4>
        <form method="POST" action="<?= BASE_URL ?>/edit/pass">
            <input type="password" value="<?= $user->get('password') ?>" name="pw"> <br>
            <input type="submit" value="Save">
        </form>
        <h4>Your Gender</h4>
        <form method="POST" action="<?= BASE_URL ?>/edit/gender">
            <input type="text" value="<?= $user->get('gender') ?>" name="gender"> <br>
            <input type="submit" value="Save">
        </form>
        <h4>Your First Name</h4>

        <form method="POST" action="<?= BASE_URL ?>/edit/first">
            <input type="text" value="<?= $user->get('firstName') ?>" name="first"> <br>
            <input type="submit" value="Save">
        </form>
        <h4>Your Last Name</h4>

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
    <?php include_once SYSTEM_PATH.'/view/Header2.tpl'; ?>    
</body>    
</html>
