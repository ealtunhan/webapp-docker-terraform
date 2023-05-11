<?php
$server_name= "database";
$user_name= "db_user";
$password= ".mypwd.";
$database_name= "proje1";
$table_name='employees';
$conn= mysqli_connect($server_name , $user_name , $password , $database_name); 

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
else{ 
    $sql = "SHOW TABLES FROM $table_nam ";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        // output data of each row
         //while ($row = $result->fetch_assoc()) {
           //  echo $row['name']."<br>";
        // }
    } else {
        $sql="CREATE TABLE `$table_name` ( 
            `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
            `name` varchar(20)  NOT NULL, 
            `email` varchar(50)  NOT NULL, 
            `address` varchar(200)  NOT NULL, 
            `phone` varchar(15) NOT NULL, 
            `created_at` timestamp NULL DEFAULT NULL, 
            `updated_at` timestamp NULL DEFAULT NULL );";
        $result = $conn->query($sql);
       
    }

}







?> 