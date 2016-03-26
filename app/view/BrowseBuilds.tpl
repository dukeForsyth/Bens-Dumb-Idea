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

<p id="headingBuilds">
    <?php
        echo "CPU: "  . $names->cpu_id. " <br>";  
      echo 'Video Card: '.$names->videocard_id.' <br>';  
      echo 'Mother Board: '.$names->motherboard_id.' <br>';
       echo 'Memory: '.$names->memory_id.' <br>';
       echo 'Storage: '.$names->storage_id.' <br>'; 
       echo 'Price: '.$names->price.' <br>';
       echo 'Build Id: '.$names->unique_id.' <br>'; 
      ?>


  </p>

<p id="userInfo">      
    
Welcome <? echo $_SESSION['username'] ?>,  <a href="<?= BASE_URL ?>/logout"> Log Out</a>
</p>

    </body>
</html>