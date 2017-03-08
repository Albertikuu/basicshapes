document.addEventListener("turbolinks:load", function() {

$('.fr-element').attr('id', 'page_content');

$('#page').on('click', '#edit-page', editPage);
$('#page').on('click', '#save-page', savePage);

$('.btn-category-js').on('click', createCategory);
$('.btn-page-js').on('click', createPage);
$('.btn-commit-js').on('click', createCommit);

$('.edit-category-name').on('click', editCategory);
$('.edit-category-save').on('click', updateCategory);

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

document.getElementById("document_file").onchange = function() {
    document.getElementById("edit_page").submit();
};

});


