document.addEventListener("turbolinks:load", function() {

	$('.fr-element').attr('id', 'page_content');

	$('#page').on('click', '#edit-page', editPage);
	$('#page-edited').on('click', '#save-page', savePage);

	$('.btn-category-js').on('click', createCategory);
	$('.btn-page-js').on('click', createPage);
	$('.btn-commit-js').on('click', createCommit);

	$('.edit-category-name').on('click', editCategory);
	$('.edit-category-save').on('click', updateCategory);

	$('.btn-teams-js').on('click', createTeam)
	$('.invite-users-js').on('click', addUserToTeam)


	$('#addusers-js').on('click', function(event){
	event.preventDefault();
	$('#list-js').toggle();
	})

	$('.remove-member-js').on('click', removeMember)

	$('#eclink').on('click',function(){
	  document.querySelector('#edit-commit-list').scrollIntoView({ behavior: 'smooth' });
	});

	$('#file-link').on('click',function(){
	  document.querySelector('#file-list').scrollIntoView({ behavior: 'smooth' });
	});

	$('.add-file').on('click', function(e) {
		e.preventDefault();
	    $("#document_file").trigger('click');
	});

	$('#document_file').on('change', function(){
		$('#edit_page').trigger('submit');
	});

	$('#add_avatar').on('click', function(e) {
	e.preventDefault();
    	$("#user_avatar").trigger('click');
	});

	$('#user_avatar').on('change', function(){
		$('#upload_avatar').trigger('submit');
	});

});
