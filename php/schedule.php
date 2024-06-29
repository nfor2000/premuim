
<?php
     require_once('./db_connect.php');
     require_once('../components/errorlog.php');

try{
     $fetch_course_stmt = $pdo->query("SELECT * FROM course_table");
     $courses = $fetch_course_stmt->fetchAll(PDO::FETCH_OBJ);

     $fetch_class_stmt = $pdo->query("SELECT * FROM classes");
     $classes = $fetch_class_stmt->fetchAll(PDO::FETCH_OBJ);

} catch (PDOException $e){
          errorLog($e);
     }

     if($_SERVER["REQUEST_METHOD"] == 'POST'){
          $course = intval($_POST["course"]);
          $class = intval($_POST["class"]);
          $day = $_POST["day"];
          $start_time = $_POST["start_time"];
          $stop_time = $_POST["stop_time"];

          if(empty($course) && empty($class) && empty($day) && empty($start_time) && empty($stop_time)){
               echo "All fields are required";
          }else{
              try{ $shedule_exist_stmt = $pdo->prepare("SELECT * FROM final_table WHERE `Day` = ? AND START_TIME = ? AND CLASS_ID = ? AND STOP_TIME = ? ");
               $shedule_exist_stmt->execute([$day, $start_time, $class, $stop_time]);

               if($shedule_exist_stmt->rowCount() > 0){
                    echo "Another class already schedule at the specified time and venue";
               }else{
                    $add_shedule_stmt = $pdo->prepare("INSERT INTO final_table (COURSE_ID, CLASS_ID, START_TIME,  STOP_TIME, `Day`) VALUES(?,?,?,?,?) ");
                    $add_shedule_stmt->execute([$course, $class, $start_time, $stop_time, $day]);

                    echo "Schedule  created successfully";
               }}catch(PDOException $e){
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
     <title>Schedule</title>
     <link rel="stylesheet" href="../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>
<body>
     <main class="p-4">
          <div class="container-sm">
               <form action="" method="post" class="mx-auto" style="width: 540px;">
                    <h1 class="text-info text-center">Schedule Class</h1>
                    <div class="form-group">
                         <label for="course"></label>
                         <select class="form-control pointer" name="course" id="course">
                              <option value="">Select course</option>
                              <?php
                              foreach($courses as $course){
                                   ?>
                                   <option value="<?=$course->Id?>"><?=$course->course_title?></option>
                              <?php
                              }
                              ?>
                         </select>
                    </div>
                    <div class="form-group">
                         <label for="class"></label>
                         <select class="form-control pointer" name="class" id="class">
                              <option value="">Select class</option>
                              <?php
                              foreach($classes as $class){
                                   ?>
                                   <option value="<?=$class->Id?>"><?=$class->class_name?></option>
                              <?php
                              }
                              ?>
                         </select>
                    </div>
                    <div class="form-group">
                         <label for="day"></label>
                         <select class="form-control pointer" name="day" id="day">
                              <option value="">Select day</option>
                              <option value="MONDAY">MONDAY</option>
                              <option value="TUESDAY">TUESDAY</option>
                              <option value="WEDNESDAY">WEDNESDAY</option>
                              <option value="THURSDAY">THURSDAY</option>
                              <option value="FRIDAY">FRIDAY</option>
                              <option value="SATURDAY">SATURDAY</option>
                         </select>
                    </div>
                    <div class="form-group mt-3">
                         <label for="start_time">Set stop time</label>
                         <input type="time" min="07:00" max="17:00" class="form-control pointer" name="start_time" id="start_time" step="1">
                    </div>
                    <div class="form-group mt-3">
                         <label for="stop_time">Set stop time</label>
                         <input type="time" min="07:00" max="19:00" class="form-control pointer" name="stop_time" id="stop_time" step="1">
                    </div>

                    <div class="form-group mt-4">
                         <button type="submit" class="btn btn-outline-primary">Schedule class</button>
                    </div>
               </form>
          </div>
     </main>
</body>
</html>