
function createCategory(event){
	event.preventDefault();

    newRequest = $.post("/categories", {
            title: $('#category_title').val().toLowerCase(),
            description: $('#category_description').val()
        });

	newRequest.fail(console.log('the category request failed'));
 	newRequest.done(console.log('the category request was succesful'))

};
