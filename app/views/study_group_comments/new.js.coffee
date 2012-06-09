new_comment = $('<%= j(render('form', :study_group_comment => @study_group_comment)) %>')
console.log new_comment
$('#newcomment').html(new_comment)