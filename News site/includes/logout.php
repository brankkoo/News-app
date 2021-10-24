<?php

session_start();


    session_destroy();
    unset($_SESSION['usees']);
    header('Location: ../index.php')




?>