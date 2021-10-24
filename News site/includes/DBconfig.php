<?php 
session_start();

$DB_host = "localhost";
$DB_user = "root";
$DB_pass = "";
$DB_name = "mydb";


try {
    $DB_conn = new pdo("mysql:host{$DB_host};dbname= {$DB_name};",$DB_user,$DB_pass);
    $DB_conn -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e) {
echo $e -> getMessage();

}

include_once 'class.user.php';
$user = new User ($DB_conn);
include_once 'class.News.php';
$news = new News($DB_conn);
include_once 'class.Comments.php';
$comment = new Commment($DB_conn);

?>