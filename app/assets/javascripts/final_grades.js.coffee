# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    $('#final_grade_sem2').click ->
        calculated = (parseInt($('#final_grade_sem2').val()) * .85) + (parseInt($('#final_grade_exam').val()) * .15)
        $('.calculated').html("Calculated Grade is "+calculated.toFixed(3))

    $('#final_grade_exam').click ->
        calculated = (parseInt($('#final_grade_sem2').val()) * .85) + (parseInt($('#final_grade_exam').val()) * .15)
        $('.calculated').html("Calculated Grade is "+calculated.toFixed(3))

    calculated = (parseInt($('#final_grade_sem2').val()) * .85) + (parseInt($('#final_grade_exam').val()) * .15)
    $('.calculated').css("color", "red")
    $('.calculated').html("Calculated Grade is "+calculated.toFixed(3))
