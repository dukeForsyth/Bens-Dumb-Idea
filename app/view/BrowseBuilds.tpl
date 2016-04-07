<html>
<head>
    
<title>   Browse Parts  </title>    

<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    
</head>

<body>
<h1 id="header">PC Helper</h1>  
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
    <form id="like" method="POST" action="">
        <input type="submit" value="Like Build " style="background-color:orange; border-radius: 12px; height: 40px; ">
    </form>
    
    <form id="comment" method="POST" action="">
        <input type="text" name="comment" style="width: 300px; height: 150px;"> <br> <br>
        <input type="submit" value="Comment Build">
    </form>

    <div id="userInfo">
        Welcome <a href="<?= BASE_URL ?>/GoToUser/<?= $_SESSION['username'] ?>"><?= $_SESSION['username'] ?></a>,  <a href="<?= BASE_URL ?>/logout"> Log Out</a><br>
        <form id="searchUser" method="POST" action="">
            <input type="text" name="userNameSearch" placeholder="Search Username">
            <input type="submit" value="Search">
        </form>
    </div>
    
    </body>
</html>