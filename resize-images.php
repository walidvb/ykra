<?php
  $result = shell_exec('./resize.sh > log.txt & echo $!');
  header("Location: ./instructions.html");
?>
