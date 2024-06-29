<?php
     require_once("./db_connect.php");
     require_once('../components/errorlog.php');


     try {
          //code...
          $sql = "SELECT * FROM final_table ";
          $stmt = $pdo->query($sql);
          $data = $stmt->fetchAll(PDO::FETCH_OBJ); 

     } catch (PDOException $e) {
          errorLog($e);
     }
?>

<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Venues</title>
     <link rel="stylesheet" href="../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>
<body>
     <main class="p-5">
          <table class="table table-bordered table-condense table-striped table-hover">
               <thead>
                    <th>Course</th>
                    <th>Class</th>
                    <th>Day</th>
                    <th>Start Time</th>
                    <th>End Time</th>
               </thead>
               <tbody>
                    <?php
                    foreach ($data as $dt) {
                         $class_id = $dt->CLASS_ID;
                         $course_id = $dt->COURSE_ID;

                         try {
                              //code...
                              $stmt = $pdo->prepare("SELECT class_name FROM classes WHERE Id = ?");
                              $stmt->execute([$class_id]);
                              $class = $stmt->fetch(PDO::FETCH_OBJ);

                              $stmt = $pdo->prepare("SELECT * FROM course_table WHERE Id = ?");
                              $stmt->execute([$course_id]);

                              $course = $stmt->fetch(PDO::FETCH_OBJ);

                              $start_time = $dt->START_TIME;
                              $end_time = $dt->STOP_TIME;
                         }catch (PDOException $e) {
                              echo "An error occured: ".$e->getMessage();
                         }
                        

                    ?>
                         <tr>
                              <td><?=$course->course_title?></td>
                              <td><?=$class->class_name?></td>
                              <td><?=$dt->Day?></td>
                              <td><?=$start_time?></td>
                              <td><?=$end_time?></td>
                         </tr>
                   <?php 
                    }
                    ?>
               </tbody>
          </table>
     </main>
</body>
</html>