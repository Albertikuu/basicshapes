
function createCategory(event){
	event.preventDefault();

    request = $.post("/categories", {
            title: $('#category_title').val().toLowerCase(),
            description: $('#category_description').val()
        });

	request.fail(console.log('the category request failed'));
 	request.done(console.log('the category request was succesful'))

};

