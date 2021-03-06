<?php
$imgs = array_filter(scandir('./images'), function($item) {
  return @is_array(getimagesize('images/'.$item));
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
  <meta name="google-site-verification" content="DFl_XHMD1F3aRuSgAdSu2nYNfvSFFtHicn8Sa330q-M" />

  <meta property="og:site_name", content="Anecdot.ch">
  <meta property="og:image" content="./share.jpg"/>
  <meta property="og:title" content="Anecdot.ch"/>
  <meta property="og:url" content="http://anecdot.ch"/>
  <meta property="og:site_name" content="Anecdot.ch"/>
  <meta property="og:type" content="blog"/>
  <meta property="og:description" content="Anecdot est influencée par la narrativité et la théâtralité que les espaces peuvent communiquer. Nostalgique autant que pragmatique, Anecdot mélange les matières et les époques, combinant (voire contournant !) le minimalisme actuel avec des ambiances atmosphériques plus sophistiquées."/>


  <link rel="shortcut icon" href="favicon.png" type="image/x-icon">
  <link rel="icon" href="favicon.png" type="image/x-icon">
  <title>Anecdot.ch</title>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <meta content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minimal-ui" name="viewport">
  <link rel="stylesheet" href="styles.css">
  <script src="scripts.js"></script>
</head>
<body>
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
        <div class="section">
          <p>
            <h1>Anecdot</h1>
          </p>
          <p>Bureau d'architectes<br>Direction artistique </p>
          <p>
            <span>Youri Kravtchenko</span><br>
            <span>Joseph Deane</span><br>
            <br>
            <h2>Architectes EPFL-SIA / RCA RIBA II </h2><br>
            <table>
              <tr>
                <td>yk:</td>
                <td><a href="tel:+41787170899">+41 (0) 78 717 08 99</a></td>
              </tr>
              <tr>
                <td>jd:</td>
                <td><a href="tel:+41795980270">+41 (0) 79 598 02 70</a></td>
              </tr>
            </table>
            <span><a href="mailto:info@anecdot.ch", target="_blank">info@anecdot.ch</a></span>
          </p>
        </div>
      </div>
      <div class="info-trigger trigger">info</div>
    </div>
    <a href="./portfolio.pdf" target="_blank" class="pdf-trigger trigger">pdf</a>
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
