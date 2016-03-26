<html>
<head>
    
<title>   Browse Parts  </title>    

<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>

<body>
    
<h1 id="header">   <br> PC Helper  </h1>  

<ul id="sideMenu">
    <li> <a href="<?= BASE_URL ?>/Home">Home</a></li>
    <li> <a href="<?= BASE_URL ?>/BrowseBuilds"> My Builds  </a> </li>
    <li> <a href="<?= BASE_URL ?>/BrowseParts"> Browse Parts </a> </li>
    <li> Submit Benchmarks</li>
</ul>
    
<! Change Build ID in session>
<form id="buildDropDown" method="POST" action="<?= BASE_URL ?>/changebuild/$buildID/build">
<select>
    
    <?php

    foreach($builds as $build){
        $buildID = $build->get('build_id');

        echo '<option value="$buildID"> $buildID  </option>';
    }
    ?>
</select>
    <input type="submit" value="Select Build">
</form>
    

<p id="headingBuilds">
    Part   &emsp; &emsp; &emsp;  &emsp; Name  &emsp;  &emsp;  &emsp;  &emsp; Price
</p>
        
    <ul id="browseBuilds">         
        
        <?php

        foreach($builds as $build)
        {
            $partType = $build->get('part');
            $partName = $build->get('name');
            $partPrice = $build->get('price');

            echo '<li> $partType  &emsp; &emsp; &emsp; &emsp; $partName  &emsp; &emsp; &emsp; &emsp; $partPrice  &emsp; &emsp; &emsp; &emsp; </li>';
        }

        ?>
</ul>  
  

<p id="userInfo">      
    
Welcome <? echo $_SESSION['username'] ?>,  <a href="<?= BASE_URL ?>/logout"> Log Out</a>
</p>

    </body>
</html>