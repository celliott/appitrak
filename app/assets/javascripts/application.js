// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.colorbox-min
//= require raphael
//= require morris
//= require jstz.min
//= require bookmark_bubble
//= require bubble
//= require_tree .

//<![CDATA[
$(document).ready(function() {
  
  // fades flash message
  timer = setTimeout(fadeOut, 1500);
  $("#flashMessage").hide();
  $("#flashMessage").fadeIn(500);

  // set's timezone in a cookie 
  var timezone = jstz.determine();
  document.cookie = 'time_zone='+timezone.name()+';';
  // $('.colorbox').colorbox({photo:true, opacity:0.77, maxHeight:"100%"});
  
  // keeps web app links in the same window
  $("a").click(function (event) {
    event.preventDefault();
    if($(this).attr("href") == '/habit_types/habit_types'){
      window.location.top= $(this).attr("href");
    } else {  
      window.location = $(this).attr("href");
    }
  });
  
  // dismisses ios keyboard after adding new habit_type 
	  function isTextInput(node) {
	    return ['INPUT', 'TEXTAREA'].indexOf(node.nodeName) !== -1;
	  }
	
		document.addEventListener('touchstart', function(e) {
		    if (!isTextInput(e.target) && isTextInput(document.activeElement)) {
		        document.activeElement.blur();
		    }
		}, false);
  
});

// funcion to fadout flash message
function fadeOut() {
  jQuery("#flashMessage").fadeOut(500);
}

// resizes trend_graph on window resize
$(window).bind('resize',function() {
  $('#chart_refresh').click();
});

// sets trend cookie after trend dropdown selection
function setTrendCookie() {
  var trend = $("#trends_dropdown").val();
  document.cookie = 'trend='+trend;
}	

//]]>