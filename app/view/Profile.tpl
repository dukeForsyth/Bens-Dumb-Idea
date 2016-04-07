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
    

    
<! TODO add varialbe for user in the controller>
<p id="userInfo"> 
    
Welcome <? echo $_SESSION['username'] ?>,  <a href="<?= BASE_URL ?>/logout"> Log Out</a>    
</p>

    
    
</body>    
</html>
