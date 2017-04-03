function createPage(event){
	event.preventDefault();
    request = $.post("/pages", {
    	category_id: $('#page_category').val(),
    	slug: $('#version_title').val(),
        title: $('#version_title').val(),
        description: $('#version_description').val(),
    	content: $('#page_content').html(),
    	user_id: $('#version_user').val()
        });

	request.fail(function(error){
		console.log(error)
	});
 	request.success(function(data){
 		console.log('the page request was succesful', data)
 	});
};



function editPage(){
    $('.disappear_on_edit').hide();
    $('.show_on_edit').show();
    $('div.fr-view').addClass('pre-edit')
    $('div.fr-view').froalaEditor({
      initOnClick: true
    });
    $('.fr-element').focus();
};

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

function savePage(){
    $('.disappear_on_edit').show();
    $('.show_on_edit').hide();
    $('div.fr-view').removeClass('pre-edit');
    $('div.fr-view').froalaEditor('destroy');
    updatePage();
};
