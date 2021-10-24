<?php



class News {
private $db;



function __construct($DB_conn)
{
    $this -> db = $DB_conn;
    
}

public function Getnews(){
     try {
        $stmt = $this -> db ->prepare("SELECT * FROM mydb.News");   
        $stmt -> execute();
        while($result=$stmt->fetch(PDO::FETCH_ASSOC)){
           $title = preg_replace('/\s+/', '-', $result['Title']);
            
            ?>
        <div class="card">
            <div class="card-body">
            <h1 class="card-title"><?php echo $result['Title'] ?> </h1>
            <p class="card-text"><small class="text-muted"><?php echo $result['Category']?></small></p>
            <img class="card-img"  id="thumbnail" src=<?php echo $result ['Picture']?>>
            <p class="card-text"><?php echo $result['shorttext']?></p>
            <?php echo '<a href= '.$title.'.php class="link-secondary">Read More</a>'?>
            <?php if($_SESSION['admin']==1&& $_SERVER['PHP_SELF']==="/Dashboard.php"){?> 
                <form method="POST"> 
                <button type="submit" class="btn btn-danger" name="deletepost" value=<?php echo $result['News_id']?>>DELETE</button>
                </form>
                <?php } ?>
            </div>
        </div>
           
            <?php }
}






    



     

     catch(PDOException $e){

        echo $e -> getMessage();

     }

}



public function Getnewsid($filetitle){
   
       $stmt = $this -> db ->prepare("SELECT * FROM mydb.News WHERE Category = ?");
$stmt -> bindparam(1,$filetitle);
       $stmt -> execute();
       while($result=$stmt->fetch(PDO::FETCH_ASSOC)){
          $title = preg_replace('/\s+/', '-', $result['Title']);
           
           ?>
       <div class="card">
           <div class="card-body">
           <h1 class="card-title"><?php echo $result['Title'] ?> </h1>
           <p class="card-text"><small class="text-muted"><?php echo $result['Category']?></small></p>
           <img class="card-img"  id="thumbnail" src=<?php echo $result ['Picture']?>>
           <p class="card-text"><?php echo $result['shorttext']?></p>
           <?php echo '<a href= '.$title.'.php class="link-secondary">Read More</a>' ?>
           </div>
       </div>
          
           <?php }

       }

       public function PostNews($newst,$pic,$textb,$texts,$categ){
        if(!empty($newst)&&!empty($pic)&&!empty($textb)&&!empty($texts)&&!empty($categ)){        
        $stmt= $this-> db ->prepare('INSERT INTO mydb.News (Title,Picture,TextBody,shorttext,Category) VALUES(?,?,?,?,?)');
        $stmt -> bindvalue(1,$newst);
        $stmt -> bindvalue(2,$pic);
        $stmt -> bindvalue(3,$textb);
        $stmt -> bindvalue(4,$texts);
        $stmt -> bindvalue(5,$categ);
        $stmt -> execute();
        return $stmt;
        }
        else {
            echo 'ERROR';
        }
    }
    public function DelPost ($postid){
        if(!empty($postid)){
        $stmt = $this -> db-> prepare("DELETE FROM mydb.News WHERE News_id = ?");
        $stmt -> bindparam(1,$postid);
        $stmt -> execute();
        header("Refresh:0");
        }
        }
        

    }?>

