window.onload = function() {

  window.addEventListener('shake', shakeEventDidOccur, false);
  
  //define a custom method to fire when shake occurs.
  function shakeEventDidOccur () {
  
    //put your own code here etc.
     $('#shakeForm').trigger("submit")
  }
};




$(document).ready(function() {
  $('form').on('ajax:success', function(e, data) {
    e.preventDefault;
    console.log('hi');
    console.log(data)
    $('.experience').html(data);
  });

  $(".locationForm").click(function(e){
  	e.preventDefault();
  	$(".location").toggleClass("hide")
  	$(".filter").toggleClass("hide")
  	$(".icon-compass").toggleClass("hide")
  	$("#shakeFormBtn").attr("value", "Shake!")
  	$(this).unbind('click');
  });

  $('.locationMenuButton').click(function(e){
    e.preventDefault();
    $('.location').toggleClass('hide')
    $('.experience').toggleClass('hide')
    $('.icon-compass').toggleClass('hide')
    $('.gn-menu-wrapper').toggleClass('gn-open-all')
  });

  $("#price").change(function () {                    
   var newValue = $('#price').val();
   $("#valuePrice").html(newValue);
  });

  $("#shakeForm").submit(function(e){
  	e.preventDefault();
  	console.log("In SUBMIT");
    $('.filter').addClass("hide")
    $('.location').addClass('hide')
  });

  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 0, 500 ],
      slide: function( event, ui ) {
        $( "#duration" ).val( ui.values[ 0 ] + " minutes - " + ui.values[ 1 ] + " minutes");
      }
    });
    $( "#duration" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      " minutes - " + $( "#slider-range" ).slider( "values", 1 ) + " minutes");
  });
});