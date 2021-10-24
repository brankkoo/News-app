<?php
require_once './includes/DBconfig.php';



if(isset($_POST ['loginbtn'])){
  $uname = $_POST['username_input'];
  $upass = $_POST ['password_input']; 
$user -> login($uname,$upass); 
}



if(isset($_POST['btnsignup'])){
$uname = trim($_POST['username']);
$upass = trim($_POST['password']);
$uemail = trim($_POST['email']);

if($uname=="") {
  $error = "provide username !"; 
}
else if($uemail=="") {
  $error = "provide email id !"; 
}
else if(!filter_var($uemail, FILTER_VALIDATE_EMAIL)) {
  $error = 'Please enter a valid email address !';
}
else if($upass=="") {
  $error = "provide password !";
}
else if(strlen($upass) < 6){
  $error = "Password must be atleast 6 characters"; 
}
else
{
  try
  {
     $stmt = $DB_conn->prepare("SELECT Username,email FROM  mydb.User WHERE Username= ? OR email= ?");
     $stmt -> bindparam(1,$uname);
     $stmt -> bindparam(2,$uemail);
     $stmt -> execute();
     $row=$stmt->fetch(PDO::FETCH_ASSOC);

     if($row['Username']==$uname) {
        $error = "sorry username already taken !";
     }
     else if($row['email']==$uemail) {
        $error = "sorry email id already taken !";
     }
     else
     {
        $user->register($uname,$uemail,$upass);
        
     }
 }
 catch(PDOException $e)
 {
    echo $e->getMessage();
 }
} 
}




?>







<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="./style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IT ACADEMY NEWS</title>




</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style>

#userbtn {
float: right;

}


</style>




<nav class="nav justify-content-center w-100">
  <a class="nav-link active" href="#">News</a>
  <a class="nav-link" href="#">Recepies</a>
  <a class="nav-link" href="#">Tech</a>



<nav>
  <?php
  if(isset($_SESSION['usees'])){
    echo "<a class = 'nav-link' id='userbtn' href='./includes/logout.php'>Logout</a>";
    echo "<a class='nav-link' id='userbtn' href='#'>$uname</a>";
  }
  
else {
echo '<a class= "nav-link" id="userbtn" data-toggle="modal" data-target="#exampleModalCenter" href="#">Login</a>';
echo '<a class= "nav-link" id = "userbtn" href="#" data-toggle="modal" data-target="#ModalRegister" >Register</a>';
}
?>
</nav>


  
</nav>

<hr>
<div class="container-md" id="newsli">
<?php 


$news -> Getnews();


?>

</div>
























<?php if(isset($error)){
  echo $error;
}



?>



























<!-- Modal Login-->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form method="POST">
  <div class="form-group">
    <label for="exampleInputEmail1">Username</label>
    <input type="text" class="form-control" name= "username_input" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Username">
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password_input" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  
  <button type="submit" name= "loginbtn" class="btn btn-primary">Login</button>
</form>
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <small id="emailHelp" class="form-text text-muted">Not Registered?</small>
        <button type="button" id ="Registerbtn" class="btn btn-primary" data-toggle="modal" data-target="#ModalRegister" data-dismiss="modal">Register</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Register-->
<div class="modal fade" id="ModalRegister" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Register</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- FORM -->
      <form class="form-horizontal"  method="POST">
  
    <div class="control-group">
      <!-- Username -->
      <label class="control-label"  for="username">Username</label>
      <div class="controls">
        <input type="text" id="username" name="username" placeholder="" class="input-xlarge">
        <p class="help-block">Username can contain any letters or numbers, without spaces</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- E-mail -->
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
        <input type="text" id="email" name="email" placeholder="" class="input-xlarge">
        <p class="help-block">Please provide your E-mail</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password-->
      <label class="control-label" for="password">Password</label>
      <div class="controls">
        <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
        <p class="help-block">Password should be at least 4 characters</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button name="btnsignup" class="btn btn-success">Register</button>
      </div>
    </div>
  </fieldset>
</form>
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      
      </div>
    </div>
  </div>
</div>




</body>
</html>