<?php

session_start();
require_once('./db_connect.php');

if(empty($_SESSION['matricule'])){
     header("location: ./login.php");
}

$user_matricule = $_SESSION['matricule'];


try {
     //code...
     $stmt = $pdo->query("SELECT * FROM classes");
     $classes = $stmt->fetchAll(PDO::FETCH_OBJ);

     $stmt1 = $pdo->query("SELECT * FROM occupy");
     $occupants = $stmt1->fetchAll(PDO::FETCH_OBJ);

} catch (PDOException $e) {
     echo "An error occured: " . $e->getMessage();
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
                              $day = date('l');
                              $cond_d = ($class->state);
                              
                              try {
                                   //code...
                                   foreach($occupants as $occupant){
                                        $matricule = $occupant->matricule;
                                        $stmt2 = $pdo->prepare("SELECT * FROM delegates WHERE matricule = ?");
                                        $stmt2->execute([$matricule]);
                                   
                                        $is_delegate = $stmt2->rowCount() > 0?1:0;
                                   }

                                   $stmt = $pdo->prepare("SELECT * FROM final_table WHERE CLASS_ID = ?");
                                   $stmt->execute([$id]);
                                   if ($stmt->rowCount() == 1) {
                                        $final_class = $stmt->fetch(PDO::FETCH_OBJ);

                                        $currentTime = strtotime($current_time);
                                        $startTime = strtotime($final_class->START_TIME);
                                        $stopTime = strtotime($final_class->STOP_TIME);

                                        $cond_a  = strcasecmp($day, $final_class->Day) == 0 ;
                                        $cond_b = ($currentTime >= $startTime);
                                        $cond_c = ($currentTime <= $stopTime);
                                   
                                        if (($cond_a && $cond_b && $cond_c && $cond_d) ||  $cond_d) {
                                             $state = "class occupied";
                                        } else if ($cond_a  && !$cond_d) {
                                             $state = "expected";
                                        } else if ($cond_a && $cond_d && !$is_delegate) {
                                             $state = "expected occupied";
                                        } else {
                                             $state = "free";
                                        }
                                   } else {
                                        if($cond_d){
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
                                        if (strcasecmp($state, "class occupied") == 0) {
                                        ?>
                                             <a href="toggle.php?id=<?= $class->Id ?>" class="btn btn-primary">Release</a>
                                        <?php
                                        } else {
                                        ?>
                                             <a href="toggle.php?id=<?= $class->Id ?>" class="btn btn-danger">Occupy</a>
                                        <?php
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