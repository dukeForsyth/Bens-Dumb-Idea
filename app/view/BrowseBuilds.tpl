<html>
<head>

    <title>   Browse Builds  </title>    

    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/js/.css">
    <script src="<?= BASE_URL ?>/public/js/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery.contextMenu.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery.ui.position.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/scripts.js"></script>
    
    <script type="text/javascript"></script>
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
    
            <rect width="500px" height="300px" onclick="myTest()"/>    
    
        </svg>    
    
    </div>
    
   <div id="mb_div"> 
    
        <svg id="motherboard_image" >
    
            <rect id="motherb_image" width="300px" height="200px" onclick="myTest()"/>
    
        </svg>
    
    </div>
    
    <div id="cpu_div">
    
         <svg id="cpu_image">
    
                <rect id="cpu_image2" width="130px" height="80px" onclick="myTest()"/>    
    
        </svg>
    
    </div>
    
    
    <div id="mem_div">
        <svg id="memory_image">
    
            <rect id="memory_image2" width="100px" height="30px" onclick="myTest()"/>    
    
        </svg>
    
    </div>
    
    <div id="ram_div">   

        <svg id="ram_image" >
    
            <rect id="ram_image2" width="15px" height="100px" onclick="myTest()"/>    
    
        </svg>
    
    </div> 
    
    <div id="gpu_div">    
    
        <svg id="gpu_image">
    
            <rect id="gpu_image2" width="200px" height="30px" onclick="myTest()"/>    
    
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
<ul id="myMenu" class="contextMenu">
            <li class="edit"><a href="#edit">Edit</a></li>
            <li class="cut separator"><a href="#cut">Cut</a></li>
            <li class="copy"><a href="#copy">Copy</a></li>
            <li class="paste"><a href="#paste">Paste</a></li>
            <li class="delete"><a href="#delete">Delete</a></li>
            <li class="quit separator"><a href="#quit">Quit</a></li>
        </ul>


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