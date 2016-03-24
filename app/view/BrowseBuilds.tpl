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
    <li> <a href="<? = BASE_URL ?>/BrowseParts"> Browse Parts </a> </li>
    <li> Submit Benchmarks</li>
</ul>
    
<! TODO Add PHP Variables to the builds>
<! TODO Add Action that queries the right build
<form id="buildDropDown" action="TODO">
<select>
    
    <?php

    foreach($builds as $build){
        $buildID = $build->get('build_id');

        echo '<option value="$buildID">$buildID  </option>';
    }
    ?>
        
    <! Example of Syntax of Option>
 <option value="build1"> Build 1</option>   
</select>
    </form>
    
<! TODO Add echo calls to display information> 
<p id="headingBuilds">
    Part   &emsp; &emsp; &emsp;  &emsp; Name  &emsp;  &emsp;  &emsp;  &emsp; Price
</p>
        
    <ul id="browseBuilds">         
        
        <?php

        foreach($builds as $build)
        {
            $partType = $build->get('part');
            $partName = $build ->get('name');
            $partPrice = $build ->get('price');

            echo '<li> $partType  &emsp; &emsp; &emsp; &emsp; $partName  &emsp; &emsp; &emsp; &emsp; $partPrice  &emsp; &emsp; &emsp; &emsp; </li>';
        }

        ?>
        
        <! Example of Syntax for the List>
        <li> GPU  &emsp; &emsp; &emsp; &emsp;  Name   &emsp; &emsp;&emsp;&emsp; Price &emsp; &emsp; &emsp; &emsp;  </li>
</ul>  
  

<p id="userInfo">      
    
Welcome <?= $user ?> , <a href="<? = BASE_URL ?>/Logout"> Log Out</a>    
</p>

    </body>
</html>