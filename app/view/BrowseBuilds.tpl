<html>


<head>
    
<title>   Browse Parts  </title>    

<link rel="stylesheet" type="text/css" href="style.css">
    
</head>


<body>
    
<h1 id="header">   <br> PC Helper  </h1>    
    

<ul id="sideMenu">
    <li> <a href="<? = BASE_URL ?>/Home">Home</a></li>
    <li> <a href="<? = BASE_URL ?>/"> My Builds  </a> </li>
    <li> <a href="<? = BASE_URL ?>/BrowseParts"> Browse Parts </a> </li>
    <li> Submit Benchmarks</li>
</ul>
    
<! TODO Query the builds available.  Drop Down Menu. >
<! Result will change what entry gets updated
<form id="build">
      Current Build Working On <br> 
    <input type="text">
    </form>
    
    
<! TODO Add echo calls to display information> 
<p id="headingBuilds">
    Part   &emsp; &emsp; &emsp;  &emsp; Name  &emsp;  &emsp;  &emsp;  &emsp; Price
</p>
    
    <ul id="browseBuilds"> 
        <li> GPU  &emsp; &emsp; &emsp; &emsp;  Name   &emsp; &emsp;&emsp;&emsp; Price &emsp; &emsp; &emsp; &emsp;  </li>
        <li> Monitor  &emsp; &emsp; &emsp; &emsp;  Name   &emsp; &emsp;&emsp;&emsp; Price &emsp; &emsp; &emsp; &emsp;  </li>
     
</ul>  
  
<! TODO add variable for user in the controller>
 <p id="userInfo">      
    
Welcome <?= $user ?>, <a href="logon.html"> Log Out</a>    
</p>
    
</body>  
</html>
