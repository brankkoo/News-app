<?php
require_once './includes/DBconfig.php';
include './template.php';


if(isset($_POST['comment'])){
  $uname = $_SESSION['usees'];
  $newst = $filetitle;
  $body = trim($_POST['body']);
  $comment -> PostComment($uname,$newst,$body);
  
}
if(isset($_POST['delete'])){
$commid = $_POST['delete'];
$comment -> DelComment($commid);

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
    <title><?php echo $filetitle ?></title>
</head>
<body>
 <?php 
 include './navbar.inc.php';
 ?>   
  <hr>


  <?php
  
  ?>


<h1><?php echo $filetitle ?></h1>
<img src=<?php echo $result ['Picture']?>>
<p><?php echo $result['TextBody']?></p>
<hr>






  <?php 
  if(isset($_SESSION['usees'])){
?>
<form method="POST">
<div class="form-group">
    <label for="body">Comment</label>
    <textarea class="form-control" id="body" name="body" rows="3"></textarea>
    
  </div>
  <button type="submit" class="btn btn-primary" name="comment">Post</button>


</form>



  <?php }

  else{
    echo "<h5>You must be logged in to comment!</h5>";
  }
  ?>
  <br>
<?php 

$comment -> GetComments($filetitle);



?>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
