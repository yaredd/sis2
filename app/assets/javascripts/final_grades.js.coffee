# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  
  $('#final_grade_sem2').click ->
      calculated = (parseInt($('#final_grade_sem2').val()) * .85) + (parseFloat($('#final_grade_exam').val()) * .15)
      $('.calculated').html("Calculated Grade is "+calculated.toFixed(2))
      $('.suggested').html("Suggested Sem. 2 Final Grade is " + suggestion(calculated))
      	

  $('#final_grade_exam').click ->
      calculated = (parseInt($('#final_grade_sem2').val()) * .85) + (parseFloat($('#final_grade_exam').val()) * .15)
      $('.calculated').html("Calculated Grade is "+calculated.toFixed(2))
      $('.suggested').html("Suggested Sem. 2 Final Grade is " + suggestion(calculated))
      
  calculated = (parseInt($('#final_grade_sem2').val()) * .85) + (parseFloat($('#final_grade_exam').val()) * .15)
  $('.calculated').css("color", "red")
  $('.suggested').css("color", "red")
  $('.calculated').html("Calculated Grade is "+calculated.toFixed(2))
  $('.suggested').html("Suggested Sem. 2 Final Grade is " + suggestion(calculated))

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
  else
    suggested = 1
  suggested

