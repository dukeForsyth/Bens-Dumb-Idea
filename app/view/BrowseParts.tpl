 <html>

<head>
    
<title>   Browse Parts  </title>    

<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>
    
<body>
    <div>
<h1 id="header">PC Helper</h1>  
</div>
<div style="float:left">
<ul id="sideMenu">
    <li> <a href="<?= BASE_URL ?>/Home">Home</a></li>
    <li> <a href="<?= BASE_URL ?>/BrowseBuilds"> My Builds  </a> </li>
    <li> <a href="<?= BASE_URL ?>/BrowseParts"> Browse Parts </a> </li>
    <li> Submit Benchmarks</li>
</ul>
</div>
<! TODO Action?>
    <div>
<form id="partDropDown" method="POST" action="<?= BASE_URL ?>/changepart">
   <select name = "part">
        <option value="cpu"> CPU </option>
        <option value="videocard">  Video Card </option>
        <option value="motherboard">  Motherboard</option>
        <option value="memory"> Memory </option>
        <option value="storage"> Storage </option>        
    </select>
    <input type="submit" value="Select Part Type">
</form>



<form id="buildDropDown" method="POST" action="<?= BASE_URL ?>/changeBuild/part">
    Current Build: <?= $_SESSION['buildID'] ?><br>
    <select name = "buildID">
        
        <?php
        foreach($builds as $build){
            $buildID = $build->get('unique_id');
            echo '<option value="'.$buildID.'">'.$buildID.'</option>';
        }
        ?>

    </select>
    <input type="submit" value="Select Build">
</form>
<!TODO change to php that queries the database>
<form id="browseParts" method="POST" action="<?= BASE_URL ?>/addpart">
    
    <?php

    $i = 0;
    foreach($parts as $part)
    {
        $partName = $part->get('name');
        $partID = $part->get('unique_id');
        $partPrice = $prices[$i];
        $string = sprintf("Name: %s Price: $%01.2f",$partName,$partPrice);
    ?>
        <input type = "radio" name = "addpart" value = "<?= $partID ?>">
    <?php
        echo $string;
        echo '<br>';
        $i++;
    }

    ?>
    
<br>
<input type="submit" value="Add Part">   

</form>
    
    
    <div id="userInfo">
        Welcome <a href="<?= BASE_URL ?>/GoToUser/<?= $_SESSION['username'] ?>"><?= $_SESSION['username'] ?></a>,  <a href="<?= BASE_URL ?>/logout"> Log Out</a><br>
        <form id="searchUser" method="POST" action="">
            <input type="text" name="userNameSearch" placeholder="Search Username">
            <input type="submit" value="Search">
        </form>
    </div>
    </div>
</body>      
</html>



