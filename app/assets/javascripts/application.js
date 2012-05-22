// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function remove_fields(link) {
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).ready(function(){
var rows = $("table tr:gt(0)");
rows.each(function() {
    var sem2 = parseInt($(this).find(".sem2").html());
    var exam = parseInt($(this).find(".exam").html());
    var calculated = sem2 * .85 + exam * .15 ;
    $(this).find(".calculated").html(calculated.toFixed(3));
 });
});
