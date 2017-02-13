
function createCategory(event){
	event.preventDefault();
    request = $.post("/categories", {
            title: $('#category_title').val(),
            description: $('#category_description').val(),
        });

	request.fail(console.log('noooope'));
 	request.done(console.log('yaaaay'))

};

