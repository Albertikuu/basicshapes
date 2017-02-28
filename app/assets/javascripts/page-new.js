function createPage(event){
	event.preventDefault();
    request = $.post("/pages", {
    	category_id: $('#page_category').val(),
    	slug: $('#version_title').val(),
        title: $('#version_title').val(),
        description: $('#version_description').val(),
    	content: $('.fr-element').html(),
    	user_id: $('#version_user').val()
        });

	request.fail(function(error){
		console.log(error)
	});
 	request.success(function(data){
 		console.log('the category request was succesful', data)
 	});
};

