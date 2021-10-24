<?php 
require_once './includes/DBconfig.php';
include './navbar.inc.php';

?>

<?php


if(isset($_POST['newsbtn'])){
  $newst = trim($_POST ['title']);
  $pic = trim($_POST['img']);
  $textb = trim($_POST['txtarea']);
  $texts = substr($textb,0,50);
  $categ = trim($_POST['inputed']);
  $news->PostNews($newst,$pic,$textb,$texts,$categ);
  
  $title = preg_replace('/\s+/', '-', $newst);
  $title = "$title.php";
  $template = include './Lorem-Ipsum-1.php';
  
  if(!file_put_contents($title, $template)){
    echo"error :/";
   }
}



if(isset($_POST['deletepost'])){
  $postid = $_POST['deletepost'];
  $news -> DelPost($postid);
  }
?>

<?php 
if($_SESSION['admin']==1){
echo "Welcome Admin";
}
else {
  header("Location: ../index.php");
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
    <title>Dashboard</title>
</head>
<body>
<h1>Make a Post</h1>
<form method="POST">
<div class="form-group">

<input class="form-control" type="text" name="title" placeholder="Title">
<br>
<input class="form-control" type="text" name="img" placeholder="imgurl">
<br>
    <label for="txtarea">Text content</label>
    <textarea class="form-control" id="txtarea" name="txtarea" rows="30"></textarea>
    <label for="inputState">Category</label>
      <select id="inputState" name ="inputed"class="form-control">
        <option selected>Tech</option>
        <option>Recepies</option>
      </select>
  </div>
  <button type="submit" class="btn btn-primary" name="newsbtn">Post</button>


</form>
<hr>
<?php 

$news -> Getnews();
?>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
