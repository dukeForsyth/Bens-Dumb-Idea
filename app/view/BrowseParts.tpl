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
    
<! TODO Action?>
<form id="partDropDown" action="TODO">
   <select>
        <option value="cpu"> CPU </option>
        <option value="videocard">  Video Card </option>
        <option value="motherboard">  Motherboard</option>
        <option value="memory"> Memory </option>
        <option value="storage"> Storage </option>        
    </select>
    <input type="submit" value="Select Part Type">
</form>
    
    
<! TODO Add PHP Variables to the builds>
<! TODO Add Action that queries the right build
<form id="buildDropDown" action="baseurl/changebuild/$buildID">
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
    <input type="submit" value="Select Build">
    </form>
    
<p id="heading">
    Part Name  &emsp; &emsp; Price  &emsp;  &emsp; Add To Current Build
</p>
    
    
<!TODO change to php that queries the database>
<ul id="browseParts"> 
    
    <?php
    
    foreach($parts as $part)
    {
        $partName = $part->get('part_Name');
        $partPrice =$part->get('part_Price');

        <! TODO STUFF FOR PRICE>

echo '<li $partName &emsp; &emsp; PRICE &emsp; &emsp;  <input type="checkbox"> </li>';
    }

    ?>
    
    
    <! Example of Syntax of Option>
    <li>  Part  &emsp; &emsp; &emsp;  Price   &emsp; &emsp; &emsp; <input type="checkbox">  </li>

</ul>  
    <! TODO just pass in the part name>
    <form id="addButton" action="baseurl/addpart/$partID">
    
    <! Get the checklist> 
    <input type="submit"  value="Add Part">
    
    </form>
    
    
    <! TODO add varialbe for user in the controller>
    <p id="userInfo">      
    
Welcome <?= $user ?>, <a href="<? = BASE_URL ?>/Logout"> Log Out</a>    
</p>
</body>      
</html>



