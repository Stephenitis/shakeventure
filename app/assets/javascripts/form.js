
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
    $('.buy').addClass('hide')
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
    $('.buy').removeClass('hide')
  });

  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 10080,
      values: [ 0, 10080 ],
      slide: function( event, ui ) {
        var firstDays = Math.floor( ui.values[0] / 1440 );
        var firstHours = Math.floor( ( ui.values[0] % 1440 ) / 60);          
        var firstMinutes = ( ui.values[0] % 1440 ) % 60;
        var secondDays = Math.floor( ui.values[1] / 1440 );
        var secondHours = Math.floor( (ui.values[1] % 1440 ) / 60);          
        var secondMinutes = ( ui.values[1] % 1440 ) % 60;

        $( "#duration" ).val( firstDays + ' days ' + firstHours + ":" + firstMinutes + " hours - " + secondDays + ' days ' + secondHours + ":" + secondMinutes + " hours");
      }
    });
    $( "#duration" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      " days 0:0 hours - " + Math.floor($( "#slider-range" ).slider( "values", 1 ) / 1440 ) + " days 0:00 hours");
  });

  $(function() {
    $( "#slider" ).slider({
      min: 0,
      max: 1000,
      value: 1000,
      slide: function( event, ui) {
        $( "#price_range").val('max price: $' + $('#slider').slider( "value"));

      }
    });
    $('#price_range').val( 'max price: $' + $('#slider').slider( "value"));
  });
});