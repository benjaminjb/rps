$('.clickable')on('click', function() {
  $choice = $(this).text();
  $('.choice').html('<img class="choice '+ $choice +' " src="/images/"'+$choice+'".jpg" />');
  $('button').attr('value',$choice);
});