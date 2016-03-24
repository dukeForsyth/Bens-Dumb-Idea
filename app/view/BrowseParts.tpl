<html>

<head>
    
<title>   Browse Parts  </title>    

<link rel="stylesheet" type="text/css" href="style.css">
    
</head>
    
<body>
    
<h1 id="header">   <br> PC Helper  </h1>  

<ul id="sideMenu">
    <li> <a href="<?= BASE_URL ?>/Home">Home</a></li>
    <li> <a href="<?= BASE_URL ?>/BrowseBuilds"> My Builds  </a> </li>
    <li> <a href="<?= BASE_URL ?>/BrowseParts"> Browse Parts </a> </li>
    <li> Submit Benchmarks</li>
</ul>
    
<! TODO Action?>
<form id="partDropDown" method="POST" action="<?= BASE_URL ?>/changepart">
   <select>
        <option value="cpu"> CPU </option>
        <option value="videocard">  Video Card </option>
        <option value="motherboard">  Motherboard</option>
        <option value="memory"> Memory </option>
        <option value="storage"> Storage </option>        
    </select>
    <input type="submit" value="Select Part Type">
</form>
    


<form id="buildDropDown" method="POST" action="<?= BASE_URL ?>/changebuild/$buildID">
    <select>
    
        <?php

        foreach($builds as $build){
            $buildID = $build->get('build_id');

            echo '<option value="$buildID" > $buildID </option>';
        }
        ?>

    </select>
    <input type="submit" value="Select Build">
    </form>
    
<p id="heading">
    Add To Current Build &emsp;  &emsp; Part Name  &emsp; &emsp; Price  &emsp;  &emsp;
</p>
    
    
<!TODO change to php that queries the database>
<form id="browseParts" method="POST" action="baseurl/addpart/$partID"> 
    
    <?php
    
    foreach($parts as $part)
    {
        $partName = $part->get('part_Name');
        $partPrice =$part->get('part_Price');

echo '<br> <input type="checkbox" value="$partName"> $partName &emsp; &emsp; &emsp; $partPrice &emsp; &emsp;>
    }

    ?>
    
<br>
<input type="submit" value="Add Part">   

</form>  
    
    
    <p id="userInfo">      
    
Welcome <? $_Session['username'] ?>, <a href="<? = BASE_URL ?>/Logout"> Log Out</a>    
</p>
</body>      
</html>



