<?php 
class Commment {
private $db;





function __construct($DB_conn){
$this -> db = $DB_conn;



}

public function PostComment($uname, $newst,$body){
if (!empty($uname)&&!empty($newst)&&!empty($body)){
$stmt = $this -> db-> prepare("INSERT INTO mydb.Comments (Username,News_title,Body) VALUES (?,?,?)");
$stmt -> bindparam(1,$uname);
$stmt -> bindparam(2,$newst);
$stmt -> bindparam(3,$body);
$stmt ->execute();
return $stmt;
}
}

public function GetComments($filetitle){
if(!empty($filetitle)){
$stmt = $this -> db -> prepare("SELECT * FROM mydb.Comments WHERE News_title = ? ");
$stmt -> bindparam(1,$filetitle);
$stmt -> execute();
while($result=$stmt->fetch(PDO::FETCH_ASSOC)){?>

<div class="card w-50">
  <div class="card-body">
    <h5 class="card-title"><?php echo $result ['Username']?></h5>
    <p class="card-text"><?php echo $result ['Body']?></p>
    <p class="card-text"><small class="text-muted">Posted on <?php echo $result['Created_at']?></small></p>
    <?php if ($result ['Username']=== $_SESSION['usees'] or $_SESSION['admin'] == 1 ){
?>
<form method="POST">
    <button type="submit" class="btn btn-danger" name="delete" value=<?php echo $result['Id']?>>DELETE</button>
</form>

  <?php  }
 
  ?>
  </div>
</div>
<br>
<?php
}
}
}

public function DelComment ($commid){
if(!empty($commid)){
$stmt = $this -> db-> prepare("DELETE FROM mydb.Comments WHERE Id = ?");
$stmt -> bindparam(1,$commid);
$stmt -> execute();
header("Refresh:0");
}
}





}















?>