function createCategory(event){
	event.preventDefault();
	$team_id = parseInt($('#category_team').val());
    request = $.post("/categories", {
            title: $('#category_title').val().toLowerCase(),
            description: $('#category_description').val(),
            team_id: $team_id
        });

	request.fail(function(error){
		console.log('error')
	});
 	request.success(function(data){
 		console.log('the category request was succesful', data)
 	});
};

