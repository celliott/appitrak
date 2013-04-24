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
//= require raphael
//= require morris
//= require jstz.min
//= require_tree .

jQuery(document).ready(function() {
  timer = setTimeout(fadeOut, 1500);
  jQuery("#flashMessage").hide();
  jQuery("#flashMessage").fadeIn(500);
  
});

function fadeOut() {
  jQuery("#flashMessage").fadeOut(500);
}

$(window).bind('resize',function() {
  $('#chart_refresh').click();
});

$(document).ready(function() {
  // set's timezone in a cookie 
  var timezone = jstz.determine();
  document.cookie = 'time_zone='+timezone.name()+';';
});

function setTrendCookie() {
  var trend = $("#trends_dropdown").val();
  document.cookie = 'trend='+trend;
}