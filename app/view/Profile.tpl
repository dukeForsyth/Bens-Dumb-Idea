<html>


<head>
    
<title>   PC Helper  </title>    

<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>


<body>
    
<h1 id="header">   <br> PC Helper  </h1>    
    

<ul id="sideMenu">
    <li> <a href="<?= BASE_URL ?>/">Home</a></li>
    <li> <a href="<?= BASE_URL ?>/BrowseBuilds"> My Builds  </a> </li>
    <li> <a href="<?= BASE_URL ?>/BrowseParts"> Browse Parts </a> </li>
    <li> Submit Benchmarks</li>
</ul>
     
<?php    
if($edit == true){
?> 

<div id="profile"> 
            <h4>Your User Name</h4>
            <?= $user->get('username') ?>
            <h4>Password</h4>
            <form method="POST" action="<?= BASE_URL ?>/edit/pass">
                <input type="text" value="<?= $user->get('password') ?>" name="pw"> <br>
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
?>

    
<! TODO add varialbe for user in the controller>
<p id="userInfo"> 
    
Welcome <? echo $_SESSION['username'] ?>,  <a href="<?= BASE_URL ?>/logout"> Log Out</a>    
</p>

    
    
</body>    
</html>
