<?php echo $header; ?>
<?php echo $homebanner; ?>
<?php echo $about; ?>
<?php echo $section2; ?>
<?php echo $blog; ?>
<?php echo $campaign; ?>
<?php echo $popup; ?>

<?php echo $gallery; ?>





<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
    <div class="modal video1" id="vimeovideo" tabindex="-1" role="dialog">
<div class="modal-dialog" role="document">
    <div class="modal-content">
 
            <iframe name="ifr" src='https://player.vimeo.com/video/169996358?api=1&player_id=vimeoplayer&title=0&amp;byline=0&amp;portrait=0' width="640px" height="360px" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen id="nofocusvideo"></iframe>
    </div>
</div><script src="http://a.vimeocdn.com/js/froogaloop2.min.js"></script>
<script>
var iframe = document.getElementById('nofocusvideo');
// $f == Froogaloop
var player = $f(iframe);

$('.modal').on('hidden.bs.modal', function () {
player.api('pause');
})

$('.modal').on('shown.bs.modal', function () {
player.api('play');
})
</script>