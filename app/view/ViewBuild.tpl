<html>
<head>

    <title>   Browse Parts  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>

<body>
    <?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
    <p id="headingBuilds">
        Created By: <?php echo $creatorName ?><br>
        <?php
        echo "CPU: "  . $names->cpu_id. " <br>";
        echo 'Video Card: '.$names->videocard_id.' <br>';
        echo 'Mother Board: '.$names->motherboard_id.' <br>';
        echo 'Memory: '.$names->memory_id.' <br>';
        echo 'Storage: '.$names->storage_id.' <br>'; 
        echo 'Price: $'.$price.' <br>';
        ?>
    </p>
    <?php 

        if($liked){
    ?>
        <form id="like" method="POST" action="<?= BASE_URL ?>/dislikeBuild/<?= $buildID ?>">
            <input type="submit" value="Unlike Build " style="background-color:orange; border-radius: 12px; height: 40px; ">
        </form>
    <?php
        }else{
    ?>
        <form id="like" method="POST" action="<?= BASE_URL ?>/likeBuild/<?= $buildID ?>">
            <input type="submit" value="Like Build " style="background-color:orange; border-radius: 12px; height: 40px; ">
        </form>

    <?php
        }
    ?>

<form id="comment" method="POST" action="<?= BASE_URL ?>/commentBuild/<?= $_GET['viewedBuildID'] ?>">
    <input type="text" name="comment" value ="" style="width: 300px; height: 150px;"> <br> <br>
    <input type="submit" value="Comment Build">
</form>

<?php include_once SYSTEM_PATH.'/view/Header2.tpl'; ?>

</body>
</html>