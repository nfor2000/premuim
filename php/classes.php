<?php

session_start();
require_once('../components/errorlog.php');
require_once('./db_connect.php');

if(empty($_SESSION['matricule'])){
     header("location: ./login.php");
}

$user_matricule = $_SESSION['matricule'];


try {
     //code...
     $stmt = $pdo->query("SELECT * FROM classes");
     $classes = $stmt->fetchAll(PDO::FETCH_OBJ);

     $stmt_verify_delegate = $pdo->prepare("SELECT * FROM delegates WHERE matricule = ?");
     $stmt_verify_delegate->execute([$user_matricule]);

     $is_delegate = $stmt_verify_delegate->rowCount() > 0 ?true: false;


} catch (PDOException $e) {
     errorLog($e);
}

?>

<!DOCTYPE html>
<html lang="en">
     
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css">
     <link rel="stylesheet" href="../assets/css/class.css">
     <title>Classes</title>
</head>

<body>
     <main class="p-5">
          <a href="./update_profile.php" class="btn btn-info">Update profile</a>
          <section class="mb-4">
               <div class="d-flex align-items-center py-2">
                    <div class="circle mx-4 bg-success"></div>
                    <span>Free</span>
               </div>
               <div class="d-flex align-items-center py-2">
                    <div class="circle mx-4 bg-warning"></div>
                    <span>Expected class but not occupied</span>
               </div>
               <div class="d-flex align-items-center py-2">
                    <div class="circle mx-4 bg-purple"></div>
                    <span>Expected class but occupied</span>
               </div>
               <div class="d-flex align-items-center py-2">
                    <div class="circle mx-4 bg-danger"></div>
                    <span>Ocuppied</span>
                    </div>
          </section>
          <section>
               <table class="table table-bordered table-condense table-striped table-hover">
                    <thead>
                         <th>Venues</th>
                         <th>State</th>
                         <th>Action</th>
                    </thead>
                    <tbody>
                         <?php
                         foreach ($classes as $class) {
                              $id = $class->Id;
                              $current_time = date("H:i:s");                              
                              $day = strtolower(date('l'));
                              $cond_a = ($class->state);
                              
                              try {
                                   $stmt_class_occupant = $pdo->prepare("SELECT * FROM occupy WHERE matricule = ? AND class_id = ?");
                                   $stmt_class_occupant->execute([$user_matricule, $id]);
                                   $is_class_occupant = $stmt_class_occupant->rowCount() == 1?true:false;
                                   //code...
                                   $stmt = $pdo->prepare("SELECT * FROM final_table WHERE CLASS_ID = ? AND `Day` = ?");
                                   $stmt->execute([$id, $day]);
                                   if ($stmt->rowCount() == 1) {
                                        $final_class = $stmt->fetch(PDO::FETCH_OBJ);
                                       
                                        $currentTime = strtotime($current_time) - 60*60;
                                        $startTime = strtotime($final_class->START_TIME);
                                        $stopTime = strtotime($final_class->STOP_TIME);
                                        
                                        $cond_b = ($currentTime >= $startTime);
                                        $cond_c = ($currentTime <= $stopTime);

                                        $stmt_is_course_delegate = $pdo->prepare("SELECT * FROM delegates WHERE matricule = ? AND course_id = ?");
                                        $stmt_is_course_delegate->execute([$user_matricule, $final_class->COURSE_ID]);
                                       
                                        $is_course_delegate = $stmt_is_course_delegate->rowCount() == 1?true:false;
                                   
                                        if($cond_b && $cond_c  && $cond_a && !$is_course_delegate){
                                             $state = "expected occupied";
                                        }
                                        else if (($cond_b && $cond_c && $cond_a) ||  $cond_a ) {
                                             $state = "class occupied";
                                        } else if ($cond_b && $cond_c  && !$cond_a) {
                                             $state = "expected";
                                        }else {
                                             $state = "free";
                                        }
                                   } else {
                                        if($cond_a){
                                             $state = "class occupied";
                                        }else{
                                             $state = "free";
                                        }
                                   }

                                   $bg_color = (strcasecmp($state, 'free') == 0) ? "bg-success" : (strcasecmp($state, "class occupied") == 0 ? "bg-danger" : (strcasecmp($state, "expected occupied") == 0 ? "bg-purple" : "bg-warning"));
                              } catch (PDOException $e) {
                                   echo "An error occured: " . $e->getMessage();
                              }
                         ?>
                              <tr>
                                   <td><?= $class->class_name ?></td>
                                   <td>
                                        <div class="<?= "circle $bg_color" ?>"></div>
                                   </td>
                                   <td>
                                        <?php
                                             if (strcasecmp($state, "class occupied") == 0 || strcasecmp($state, "expected occupied") == 0) {
                                                  if($is_delegate){
                                                       if($is_class_occupant){
                                                  ?>
                                                       <a href="./toggle.php?id=<?=$class->Id?>" class="btn btn-primary">Release</a>
                                                  <?php
                                                       } else{
                                                  ?>
                                                         <a href="./toggle.php?id=<?=$class->Id?>" class="btn btn-primary disabled">occupied</a>   
                                                  <?php
                                                       }
                                                       }else{
                                                  ?>
                                                       <a href="./toggle.php?id=<?=$class->Id?>" class="btn btn-primary disabled">occupied</a>
                                                  <?php
                                                       }
                                                  }else{
                                                       if($is_delegate){
                                                  ?>
                                                       <a href="./toggle.php?id=<?=$class->Id?>" class="btn btn-danger ">Occupy</a>
                                                  <?php
                                                       }else{
                                                  ?>
                                                       <a href="./toggle.php?id=<?=$class->id?>" class="btn btn-danger disabled">Occupy</a>
                                                    <?php 
                                                  }
                                             }
                                             ?>
                                   </td>
                              </tr>
                         <?php
                         }
                         ?>
                    </tbody>
               </table>
          </section>

     </main>
</body>

</html>