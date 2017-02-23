<?php
  $result = shell_exec('./resize.sh');
  header("Location: /instructions.html");
  print_r($result);
?>
