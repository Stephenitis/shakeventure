$(document).ready(function() {
  $('form').on('ajax:success', function(e, data) {
    e.preventDefault;
    console.log('hi');
    console.log(data)
    $('.experience').html(data);
  });

  $(".locationForm").click(function(e){
  	e.preventDefault();
  	$("div.location").toggleClass("hide")
  	$("div.filter").toggleClass("hide")
  	$(".icon-compass").toggleClass("hide")
  	$("#shakeFormBtn").removeClass("locationForm")
  	$("#shakeFormBtn").addClass("filterForm")
  	$("#shakeFormBtn").attr("value", "Shake!")
  	$(this).unbind('click');
  });

  $("#price").change(function () {                    
   var newValue = $('#price').val();
   $("#valuePrice").html(newValue);
  });

  $("#shakeForm").submit(function(e){
  	e.preventDefault();
  	console.log("In SUBMIT");
    $('div.filter').addClass("hide")
  });
});