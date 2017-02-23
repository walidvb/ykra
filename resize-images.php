<?php
  $result = shell_exec('./resize.sh > /dev/null & echo $!');
  header("Location: /instructions.html");
?>
