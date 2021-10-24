<?php 
require_once './includes/DBconfig.php';

$filetitle = $_SERVER['PHP_SELF'];
  $filetitle = preg_replace("/-/", ' ', $filetitle);
  $filetitle = preg_replace("/.php/", '', $filetitle);
  $filetitle = ltrim($filetitle, $filetitle[0]);
  
$stmt = $DB_conn -> prepare("SELECT * FROM mydb.News WHERE Title = ?");
$stmt ->bindValue(1,$filetitle);
$stmt -> execute();
$result=$stmt->fetch(PDO::FETCH_ASSOC);
?>
