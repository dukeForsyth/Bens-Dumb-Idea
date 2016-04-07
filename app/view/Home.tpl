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

<div id="userInfo">
    <br>
    Welcome <a href="<?= BASE_URL ?>/GoToUser/<?= $_SESSION['username'] ?>"><?= $_SESSION['username'] ?></a>,  <a href="<?= BASE_URL ?>/logout"> Log Out</a><br>
    <form id="searchUser" method="POST" action="">
        <input type="text" name="userNameSearch" placeholder="Search Username">
        <input type="submit" value="Search">
    </form>
</div>


</body>    
</html>
