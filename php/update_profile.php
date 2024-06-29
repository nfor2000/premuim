<?php

session_start();

require_once('./db_connect.php');
require_once('../components/errorlog.php');


$matricule = $_SESSION["matricule"];

$fetch_user_stmt = $pdo->prepare("SELECT * FROM users WHERE matricule = ?");
$fetch_user_stmt->execute([$matricule]);
$user = $fetch_user_stmt->fetch(PDO::FETCH_OBJ);

echo $user->name;
$fetch_course_stmt = $pdo->query("SELECT * FROM course_table");
$courses = $fetch_course_stmt->fetchAll(PDO::FETCH_OBJ);

if ($_SERVER["REQUEST_METHOD"] == 'POST') {
     $name = $_POST['name'];
     $email = $_POST['email'];
     $matricule = $_POST['matricule'];
     $password = $_POST['password'];
     $course_id = intval($_POST['course']);

     if (empty($name) && empty($email) && empty($matricule) && empty($password)) {
          echo "All fields are required";
     } else {
          $hash_password = password_hash($password, PASSWORD_BCRYPT);

          try {
               //code...
               $sql = "SELECT * FROM users WHERE matricule = ?";
               $stmt = $pdo->prepare($sql);
               $stmt->execute([$matricule]);

               if ($stmt->rowCount() > 0) {
                    echo "User already exist";
               } else {

                    $sql = "INSERT INTO users (`name`,email,matricule,`password`) VALUES (?,?,?,?)";
                    $stmt = $pdo->prepare($sql);
                    $stmt->execute([$name, $email, $matricule, $hash_password]);
                    echo "User registered";
               }

               if (!empty($course_id)) {
                    $stmt_delegates = $pdo->prepare("SELECT * FROM delegates WHERE course_id = ? AND matricule = ?");
                    $stmt_delegates->execute([$course_id, $matricule]);

                    if ($stmt_delegates->rowCount() === 0) {
                         $stmt_add_delegate = $pdo->prepare("INSERT INTO delegates (matricule, course_id) VALUES (?, ?)");
                         $stmt_add_delegate->execute([ $matricule, $course_id]);
                    } else {
                         echo "Delegate already exist for this course. Contact database admin";
                    }
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
          <a href="./classes.php" class="btn btn-info">Go Back</a>
          <div class="mx-auto" style="max-width: 480px;">
               <form method="post" class="mw-100 mx-auto">
                    <div class="form-group mb-3">
                         <label for="name">Name:</label>
                         <input type="text" name="name" value="<?=$user->name?>" placeholder="Enter Name" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                         <label for="email">Email:</label>
                         <input type="text" name="email" value="<?=$user->email?>" placeholder="Enter Email" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                         <label for="matricule">Matricule:</label>
                         <input type="text" name="matricule" value="<?=$user->matricule?>" placeholder="Enter Matricule" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                         <label for="password">Old Password:</label>
                         <input type="text" name="old_password" placeholder="Enter Password" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                         <label for="password">New Password:</label>
                         <input type="text" name="new_password" placeholder="Enter Password" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                         <label for="course">For delegates only</label>
                         <select name="course" id="course" class="form-control">
                              <option>Select course</option>
                              <?php
                              foreach ($courses as $course) {
                              ?>
                                   <option value="<?= $course->Id ?>"><?= $course->course_title ?></option>
                              <?php
                              }
                              ?>
                         </select>
                    </div>
                    <button type="submit" class="btn btn-outline-primary mb-3">Submit</button>
               </form>

          </div>
     </main>

</body>

</html>