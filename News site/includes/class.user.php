<?php 
class USER {

private $db;

function __construct($DB_conn){
$this -> db= $DB_conn;
}

public function register($uname,$uemail,$upass){

    if(!empty($uname)&& !empty($uemail)&& !empty($upass)){
$stmt = $this -> db ->prepare("INSERT INTO mydb.User (email,Username,Pass) VALUES(?,?,?)");
$stmt->bindvalue(1, $uemail);
$stmt->bindvalue(2, $uname);
$stmt->bindvalue(3, $upass);

$stmt -> execute();

return $stmt;
   
}
}



public function login($uname,$upass){


    try {
if(!empty($uname)&& !empty($upass)){
$stmt = $this-> db -> prepare (" SELECT * FROM mydb.User WHERE Username= ? AND Pass=?  Limit 1");
$stmt ->bindparam(1,$uname);
$stmt ->bindparam(2,$upass);
$stmt -> execute();
$userRow=$stmt -> fetch(PDO::FETCH_ASSOC);
$isadmin = $userRow['admin'];
}
if($stmt ->rowCount()==1)
{
if($isadmin==1){
   $_SESSION['admin'] = $isadmin;
    $_SESSION['usees'] = $uname;
    header("Location: ../Dashboard.php");

}

   else {
    $_SESSION['usees'] = $uname;
    header("Refresh:0");
   }
}
   else{
echo "wrong!";

   }
}

catch(PDOException $e){
    echo $e->getMessage();
}
}

public function is_loggedin()
   {
      if(isset($_SESSION['usees']))
      {
         return true;
      }
   }

   public function redirect($url)
   {
       header("Location: $url");
   }





}
?>