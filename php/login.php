<?php
session_start();

require_once('../components/errorlog.php');
require_once('./db_connect.php');

if ($_SERVER["REQUEST_METHOD"] == 'POST') {
     $matricule = $_POST['matricule'];
     $password = $_POST['password'];

     if (empty($matricule) && empty($password)) {
          echo "All fields are required";
     } else {
          try {
               //code...
               $sql = "SELECT * FROM users WHERE matricule = ?";
               $stmt = $pdo->prepare($sql);
               $stmt->execute([$matricule]);

               if ($stmt->rowCount() == 1) {
                    $user = $stmt->fetch(PDO::FETCH_OBJ);
                    $stored_password = $user->password;
                    $is_correct_password = password_verify($password, $stored_password);

                    if ($is_correct_password) {
                         $_SESSION["matricule"] = $matricule;
                         header("location: ./classes.php");
                    } else {
                         echo "Wrong password";
                    }
               } else {
                    echo "User doesn't exist";
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
                         <label for="matricule">Matricule:</label>
                         <input type="text" name="matricule" placeholder="Enter Matricule" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                         <label for="password">Password:</label>
                         <input type="text" name="password" placeholder="Enter Password" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-outline-primary mb-3">Login</button>
                    <p>Don't have an account<a href="./register.php"> Register</a></p>
               </form>

          </div>
     </main>

</body>

</html>