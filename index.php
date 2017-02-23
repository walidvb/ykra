<?php
$imgs = array_filter(scandir('images'), function($item) {
    return !is_dir('../pages/' . $item);
});
unset($imgs[0]);
unset($imgs[1]);
shuffle($imgs);
$fb = false;
if(preg_match('/^FacebookExternalHit\/.*?/i', $_SERVER['HTTP_USER_AGENT'])){
		$fb = true;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">

	<meta property="og:site_name", content="YKRA.CH">

	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<link rel="icon" href="favicon.ico" type="image/x-icon">
	<title>Searching for flamingos</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<meta content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minimal-ui" name="viewport">
	<link rel="stylesheet" href="styles.css">
	<script src="scripts.js"></script>

</head>
<body>
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" height="0" width="0">
  <defs>
     <filter id="blur" x="0" y="0">
       <feGaussianBlur stdDeviation="3" />
     </filter>
  </defs>
</svg>
	<div class="images">
		<div class="loader"></div>
		<?php foreach($imgs as $img): ?>
			<div class="img-container" data-big="images/desktop/<?php print $img; ?>" data-small="images/mobile/<?php print $img; ?>">
				<?php if($fb): ?>
					<img src="images/<?php print $img; ?>" alt="">
				<?php endif; ?>
			</div>
		<?php endforeach; ?>
	</div>

	<div class="ui">
		<div class="info">
			<div class="info-details">
				<div class="ykra">
					<div class="left">
							<p>Scénographie du Lieu central du festival de la Bâtie 2014</p>
							<p class="hidden-xs">
								réalisée par
							</p>
					</div>
					<div class="right">

						<p>
							<span>YKRA </span><br>
							<span>Youri Kravtchenko </span><br>
							<span class="hidden-xs">
							<br>
							<span>Architecte EPFL-SIA </span><br>
							<span>9, place des Augustins </span><br>
							<span>1205 Genève </span><br>
							<span><a href="tel:+41787170899">078 717 08 99</a></span><br></span>
							<span><a href="mailto:y@ykra.ch", target="_blank">y@ykra.ch</a></span>
						</p>
					</div>
				</div>
				<div class="credits">
					<p>
						<span class="type left">Photos:</span> <span class="name right">Maria Trofimova</span>
						<br>
						<span class="type left">Site:</span> <span class="name right">Walid van Boetzelaer</span>
					</p>
				</div>
			</div>
			<div class="info-trigger trigger"></div>
		</div>
		<a href="./portfolio.pdf" target="_blank" class="pdf-trigger trigger"></a>
	</div>
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  //ga('create', 'UA-27024782-18', 'auto');
	  //ga('send', 'pageview');

	</script>
</body>
</html>
