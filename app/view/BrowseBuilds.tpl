<html>
<head>

    <title>   Browse Parts  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>

<body>
    <?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
    <form id="buildDropDown" method="POST" action="<?= BASE_URL ?>/changeBuild/build">
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
<form id="newBuild" action="<?= BASE_URL ?>/changeBuild/create">
    <input type="submit" value="Create New Build">
</form>

<p id="headingBuilds">
    <?php
    echo "CPU: "  . $names->cpu_id. " <br>";
    echo 'Video Card: '.$names->videocard_id.' <br>';
    echo 'Mother Board: '.$names->motherboard_id.' <br>';
    echo 'Memory: '.$names->memory_id.' <br>';
    echo 'Storage: '.$names->storage_id.' <br>'; 
    echo 'Price: $'.$price.' <br>';
    echo 'Build Id: '.$names->unique_id.' <br>'; 
    ?>
</p>

<?php include_once SYSTEM_PATH.'/view/Header2.tpl'; 
if(!$published){
?>
<form id="publishBuild" action="<?= BASE_URL ?>/publishBuild">
    <input type="submit" value="Publish Build">
</form>
<?php 
}
?>

</body>
</html>