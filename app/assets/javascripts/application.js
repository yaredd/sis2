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
    var exam = parseFloat($(this).find(".exam").html());
    if (isNaN(sem2) || isNaN(exam))
    {
      var calculated = "-"
    }
    else
    {
      var calculated = sem2 * .85 + exam * .15 ;
      $(this).find(".calculated").html(calculated.toFixed(2));
    }

    var suggested = 0;
    if ( calculated >= 6.7)
    {
    	suggested = 7;
    }
    else if ( calculated >= 5.7)
    {
    	suggested = 6;
    }
    else if ( calculated >= 4.7)
    {
    	suggested = 5;
    }
    else if ( calculated >= 3.7)
    {
    	suggested = 4;
    }
    else if ( calculated >= 2.7)
    {
    	suggested = 3;
    }
    else if ( calculated >= 1.7)
    {
    	suggested = 2;
    }
    else if ( calculated == "-")
    {
      suggested = "-";
    }
    else
    {
    	suggested = 1;
    }

		$(this).find(".suggested").html(suggested);
 });
});
