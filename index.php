<?php 
$imgs = scandir("hiRes");
unset($imgs[0]);
unset($imgs[1]);

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">

	<meta name="text:Google Analytics ID" content="" />
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<link rel="icon" href="favicon.ico" type="image/x-icon">
	<title>Searching for flamingos</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<meta content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minimal-ui" name="viewport">
  <link rel="stylesheet" href="styles.css">
	<script src="scripts.js"></script>
</head>
<body>

		<div class="images">
      <div class="loader"></div>
      <?php foreach($imgs as $img): ?>
					<div class="img-container" data-big="hiRes/<?php print $img; ?>"></div>
      <?php endforeach; ?>
		</div>

	<div class="info">
		<div class="info-details">
				<div class="left">
				Scénographie du Lieu central du festival de la Bâtie 2014
				</div>
				<div class="hidden-xs">
				réalisée par
				</div>
				<div class="right">
					<span>YKRA </span>
					<span>Youri Kravtchenko </span>
					<span class="hidden-xs">Architecte EPFL-SIA </span>
					<span class="hidden-xs">9, place des Augustins </span>
					<span class="hidden-xs">1205 Genève </span>
					<span class="hidden-xs"><a href="tel:+41787170899">078 717 08 99</a></span>
					<span><a href="mailto:y@ykra.ch", target="_blank">y@ykra.ch</a></span>
				</div>
				<div class="credits">
					<span class="type left">Photos:</span> <span class="name right">Maria Trofimova</span>
					<br>
					<span class="type left">Site:</span> <span class="name right">Walid van Boetzelaer</span>	
				</div>
		</div>
		<div class="info-trigger"></div>
	</div>
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-51011384-2', 'bamfestival.be');
      ga('send', 'pageview');

    </script>
</body>
</html>