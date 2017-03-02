function createCommit(event){
	event.preventDefault();
    request = $.post("/commits", {
    	version_id: $('#linked_version').val(),
        title: $('#commit_title').val(),
    	message: $('.fr-element').html(),
    	user_id: $('#commit_user').val(),
    	page_id: $('#linked_page').val()
        });

	request.fail(function(error){
		console.log(error)
	});
 	request.success(function(data){
 		console.log('the category request was succesful', data)
 	});
};

