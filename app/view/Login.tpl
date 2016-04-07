<html>
    <head>
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
        
    <title>  Welcome! </title>
    
    </head>

    <body>
        
        <h1 id="header">  PC Helper </h1>
        
        <p id="welcome">  Who We Are?  </p>
    
        <p id="whoWeAre">
    
       Our goal is to make building custom personal computers more accessible to the average person by providing recommendations based on your budget and personal computing needs.
        </p>
    
    <! TODO determine action when it's a new user>
<form id="newUser" method="POST" action="<?= BASE_URL ?>/create">
    New User? Create an account! <br> <br>
    
    First Name <br>
    <input type="text" name="fName" placeholder="First Name" >
    
    <br> <br>
    
    First Name <br>
    <input type="text" name="lName" placeholder="Last Name" >
    
    <br> <br>
    
    Email Address <br>
    <input type="text" name="username" placeholder="Email Address" >
    
    <br> <br>
    
    Password <br>
    <input type="password" name="password" placeholder="Password">
    
    <br> <br>
    
    Confirm Password <br>
    <input type="password" name="confirmPW" placeholder="Confirm Password">  
    
    <br> <br>
    
    <input type="submit" value="Create Account">
    
</form>
        
    <! TODO determine action when it's a previous user>
<form id="retUser" method="POST" action="<?= BASE_URL ?>/login">
     Already A User? Sign In! <br> <br> <br>
    
    Email Address <br>
    <input type="text" name="username" placeholder="Email Address" >
    
    <br> <br> <br>
    
    Password <br>
    <input type="password" name="password" placeholder="Password">
    
     <br> <br>
    <br> 
    
    <input type="submit" value="Sign In">
</form>    
        
        
    </body>
</html>