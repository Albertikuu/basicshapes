function updatePage(){

    request = $.post("/pages/create_version", {
        title: $('#version_title').val(),
        description: $('#version_description').val(),
    	content: $('#page_content').html(),
    	user_id: $('#version_user').val(),
    	page_slug: $('#page_slug').val()
        });

	request.fail(function(error){
		console.log(error)
	});
 	request.success(function(data){
 		console.log('the category request was succesful', data)
 	});
};

