<html>


<head>
    
<title>   Browse Parts  </title>    

<link rel="stylesheet" type="text/css" href="style.css">
    
</head>


<body>
    
<h1 id="header">   <br> PC Helper  </h1>    
    

<ul id="sideMenu">
    <li> <a href="<? = BASE_URL ?>/Home">Home</a></li>
    <li> <a href="<? = BASE_URL ?>/BrowseBuilds"> My Builds  </a> </li>
    <li> <a href="<? = BASE_URL ?>/"> Browse Parts </a> </li>
    <li> Submit Benchmarks</li>
</ul>
    
<! TODO A Drop Down Menu, Can An Action Be a Variable Name?>
<form id="partType" action="<?= BASE_URL ?>/partType.value">
    Computer Part Type <br>
<input  type="text" name="partType">    
</form>
    

<p id="description">
    <?= $partDescription ?>
    
</p>
    
<! TODO Query the builds available.  Drop Down Menu. >
<! Result will change what entry gets updated
<form id="build">
      Current Build Working On <br> 
    <input type="text">
    </form>
    
    
<p id="heading">
    Part Name  &emsp; &emsp; Price  &emsp;  &emsp; Add To Current Build
</p>
    
    
<!TODO change to php that queries the database>
<ul id="browseParts"> 
    <li>  Part  &emsp; &emsp; &emsp;  Price   &emsp; &emsp; &emsp; <input type="checkbox">  </li>


</ul>  
    
    
    <! TODO add varialbe for user in the controller>
    <p id="userInfo">      
    
Welcome <?= $user ?>, <a href="logon.html"> Log Out</a>    
</p>
    
    

   
    

    
    
</body>    
    
    
    
    

</html>



