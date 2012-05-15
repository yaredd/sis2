var rows = $("table tr:gt(0)");
rows.each(function() {
    var sem2 = parseInt($(this).find(".sem2").html());
    var exam = parseInt($(this).find(".exam").html());
    var suggestion = sem2 * .85 + exam * .15 ;
    $(this).find(".suggestion").html(suggestion.toFixed(3));
 });

