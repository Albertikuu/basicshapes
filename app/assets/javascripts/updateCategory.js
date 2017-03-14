function updateCategory(event){
debugger
event.preventDefault();

	var newTitle = $('#category-title').val()

    request = $.post("/categories/change_title", {
            title: newTitle.toLowerCase(),
            title_slug: $('edit-category-save').context.activeElement.name
        });

	request.fail(function(error){
		console.log(error);
		alert("Something went wrong! Make sure that the category name is unique");
	});
 	request.success(function(data){
 		console.log('the category request was succesful', data)
 	});
	$('.category-title').text(newTitle);
};
