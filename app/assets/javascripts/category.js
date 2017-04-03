function createCategory(event){
	event.preventDefault();
	$team_id = parseInt($('#category_team').val());
    request = $.post("/categories", {
            title: $('#category_title').val().toLowerCase(),
            description: $('#category_description').val(),
            team_id: $team_id
        });

	request.fail(function(error){
		console.log(error);
		alert("The category already exists!");
	});
 	request.success(function(data){
 		console.log('the category request was succesful', data)
 	});
};



function editCategory(e){
	e.preventDefault();
	$('.disappear_on_edit').hide();
    $('.show_on_edit').show();
    $('#category-title').show();
    $('.category-title').hide();
};

function updateCategory(event){
event.preventDefault();

	var newTitle = $('#category-title').val()

    request = $.post("/categories/change_title", {
            title: newTitle.toLowerCase(),
            title_slug: $('.edit-category-save').data('slug')
        });

	request.fail(function(error){
		console.log(error);
		alert(error.message);
	});
 	request.success(function(data){
 		console.log('the category request was succesful', data)
 	});
	$('.category-title').text(newTitle);
	
};
