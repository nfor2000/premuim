<?php
     require_once('./db_connect.php');

     if($_SERVER["REQUEST_METHOD"] == 'POST'){
          $name = $_POST['name'];
          $email = $_POST['email'];
          $matricule = $_POST['matricule'];
          $password = $_POST['password'];

          if(empty($name) && empty($email) && empty($matricule) && empty($password)){
               echo "All fields are required";
          }else {
               $hash_password = password_hash($password, PASSWORD_BCRYPT);

               try {
                    //code...
                    $sql = "SELECT * FROM users WHERE matricule = ?";
                    $stmt = $pdo->prepare($sql);
                    $stmt->execute([$matricule]);
                    
                    if($stmt->rowCount() > 0){
                         echo "User already exist";
                    }else{

                         $sql = "INSERT INTO users (`name`,email,matricule,`password`) VALUES (?,?,?,?)";
                         $stmt = $pdo->prepare($sql);
                         $stmt->execute([$name, $email, $matricule, $hash_password]);
                         echo "User registered";
                    }

               } catch (PDOException $e) {
                    errorLog($e);
               }
          }

          
     }
?>


<!DOCTYPE html>
<html lang="en">

<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Register</title>
     <link rel="stylesheet" href="../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>

<body>
     <main class="w-100 h-100 p-5">
          <div class="mx-auto" style="max-width: 480px;">
               <form method="post" class="mw-100 mx-auto">
                    <div class="form-group mb-3">
                         <label for="name">Name:</label>
                         <input type="text" name="name" placeholder="Enter Name" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                         <label for="email">Email:</label>
                         <input type="text" name="email" placeholder="Enter Email" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                         <label for="matricule">Matricule:</label>
                         <input type="text" name="matricule" placeholder="Enter Matricule" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                         <label for="password">Password:</label>
                         <input type="text" name="password" placeholder="Enter Password" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-outline-primary mb-3">Submit</button>
                    <p>Already have an account<a href="./login.php"> Login</a></p>
               </form>

          </div>
     </main>

</body>

</html>