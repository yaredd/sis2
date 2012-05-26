# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#final_grade_sem2').click ->
    calculated = get_calculated(parseInt($('#final_grade_sem2').val()) , parseFloat($('#final_grade_exam').val()))
    $('.calculated').html(calculated)
    $('.suggested').html(suggestion(calculated))
      	
  $('#final_grade_exam').click ->
      calculated = get_calculated(parseInt($('#final_grade_sem2').val()) , parseFloat($('#final_grade_exam').val()))
      $('.calculated').html(calculated)
      $('.suggested').html(suggestion(calculated))

  calculated = get_calculated(parseInt($('#final_grade_sem2').val()) , parseFloat($('#final_grade_exam').val()))
  $('.calculated').css("color", "red")
  $('.suggested').css("color", "red")
  $('.calculated').html(calculated)
  $('.suggested').html(suggestion(calculated))

suggestion = (calculated) ->
  suggested = 0
  if calculated >= 6.7
    suggested = 7
  else if calculated >= 5.7
    suggested = 6
  else if calculated >= 4.7
    suggested = 5
  else if calculated >= 3.7
    suggested = 4
  else if calculated >= 2.7
    suggested = 3
  else if calculated >= 1.7
    suggested = 2
  else if calculated == "-"
    suggested = "-"
  else
    suggested = 1
  suggested

get_calculated = (sem2, exam) ->
  calc = 0
  calc = sem2 * .85 + exam * .15
  if isNaN(calc)
    calc = "-"
  else
    calc = calc.toFixed(2)
  calc
