<html>
<head>

    <title>   Browse Builds  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    <script src="<?= BASE_URL ?>/public/js/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/scripts.js"></script>
</head>

<body>
    <?php include_once SYSTEM_PATH.'/view/Header.tpl'; ?>
    <div id="div_middle">
        <div style="width:calc(60% - 25px); float:right; height:100%;">
            <div id="userInfo" style="width:97%">
                Welcome <a href="<?= BASE_URL ?>/GoToUser/<?= $_SESSION['username'] ?>"><?= $_SESSION['username'] ?></a>,  <a href="<?= BASE_URL ?>/logout"> Log Out</a><br>
                <form id="searchUser" method="POST" action="">
                    <input type="text" name="userNameSearch" placeholder="Search Username">
                    <input type="submit" value="Search">
                </form>
            </div>
            <div id="visual">
        
    
    <div id="case_div"> 
    
        <svg id="case_image">
    
            <rect width="500px" height="300px" />    
    
        </svg>    
    
    </div>
    
    <div id="mb_div">
    
        <svg id="motherboard_image">
    
            <rect width="300px" height="200px" />
    
        </svg>
    
    </div>
    
    <div id="cpu_div">
    
         <svg id="cpu_image">
    
                <rect width="130px" height="80px" />    
    
        </svg>
    
    </div>
    
    
    <div id="mem_div">
        <svg id="memory_image">
    
            <rect width="100px" height="30px" />    
    
        </svg>
    
    </div>
    
    <div id="ram_div">   

        <svg id="ram_image">
    
            <rect width="15px" height="100px" />    
    
        </svg>
    
    </div> 
    
    <div id="gpu_div">    
    
        <svg id="gpu_image">
    
            <rect width="200px" height="30px" />    
    
        </svg>
    
    </div>
        
</div>
        </div>
    <div id="buildInfo">
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
    echo 'Price: $'.$names->price.' <br>';
    echo 'Build Id: '.$names->unique_id.' <br>'; 
    ?>
</p>
        <?php
        if(!$published){
        ?>
        <form id="publishBuild" action="<?= BASE_URL ?>/publishBuild">
            <input type="submit" value="Publish Build" id="publishButton">
        </form>
        <?php 
        }
        ?>
        </div>     
</div>
</body>
</html>