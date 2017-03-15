function updateCategory(event){
event.preventDefault();

	var newTitle = $('#category-title').val()

    request = $.post("/categories/change_title", {
            title: newTitle.toLowerCase(),
            title_slug: $('.edit-category-save').context.activeElement.name
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

