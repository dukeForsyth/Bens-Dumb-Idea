 <html>

<head>
    
<title>   Browse Parts  </title>    

<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>
    
<body>
    <div>
<?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
<?php include_once SYSTEM_PATH.'/view/Header2.tpl'; ?>
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
    
    

    </div>
</body>      
</html>



