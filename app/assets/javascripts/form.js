$(document).ready(function() {
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

  $("#shakeForm").submit(function(e){
  	e.preventDefault();
  	console.log("In SUBMIT")
  });

});