
<?php
class Admin {
    private $db;

    function __construct($DB_conn){
    $this -> db= $DB_conn;
    }




    public function adminlogin($uname,$upass){
        if(!empty($uname)&& !empty($upass)){
            $stmt = $this-> db -> prepare (" SELECT * FROM mydb.Admin WHERE Username= ? AND Pass=?  Limit 1");
            $stmt ->bindparam(1,$uname);
            $stmt ->bindparam(2,$upass);
            $stmt -> execute();
            $userRow=$stmt -> fetch(PDO::FETCH_ASSOC);
            }
    
            if($stmt ->rowCount()==1)
            {
            return true;
            $_SESSION['usees'] = $uname;
            header("Location: ../Dashboard.php");
            
            }
            else {
                echo "wrong";
            }
    
    
    
    }
    

}
?>