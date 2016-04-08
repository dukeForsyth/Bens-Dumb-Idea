<html>
    <head>
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
        
    <title>  Welcome! </title>
    
    </head>

    <body>
        <div id="div_header">
        <h1 id="header">  <br> PC Helper </h1>
        </div>

    
<div id="div_newUser">    
<form id="newUser" method="POST" action="<?= BASE_URL ?>/create">
    New User? Create an account! <br> 
    
    First Name <br>
    <input type="text" name="fName" placeholder="First Name" >
    
    <br>     
    Last Name <br>
    <input type="text" name="lName" placeholder="Last Name" >
    
    <br>
    
    Username <br>
    <input type="text" name="username" placeholder="Username" >
    
    <br> 
    
    Email Address <br>
    <input type="text" name="emailAddress" placeholder="Email Address" >
    
    <br> 
    
    Password <br>
    <input type="password" name="password" placeholder="Password">
    
    <br> 
    
    Confirm Password <br>
    <input type="password" name="confirmPW" placeholder="Confirm Password">  
    
    <br><br>
    
    <input type="submit" value="Create Account">
    <br>
</form>
</div>        

        <div id="div_welcome">
        <p id="welcome">  Who We Are?  </p>        
        <p id="whoWeAre">
       Our goal is to make building custom personal computers more accessible to the average person by providing recommendations based on your budget and personal computing needs.
        </p>
        </div>
 
<div id="div_retUser">   
<form id="retUser" method="POST" action="<?= BASE_URL ?>/login">
     Already A User? Sign In! <br>
    
    Username <br>
    <input type="text" name="username" placeholder="Username" >
    
    <br> 
    
    Password <br>
    <input type="password" name="password" placeholder="Password">
    
    <br> 
    
    <input type="submit" value="Sign In">
</form>   
</div> 
        
        
    </body>
</html>