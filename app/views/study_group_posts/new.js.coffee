new_post = $('<%= j(render('form', :study_group_post => @study_group_post)) %>')
console.log new_post
$('#newpost').html(new_post)