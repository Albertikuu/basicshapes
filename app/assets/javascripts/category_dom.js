document.addEventListener("turbolinks:load", function() {

$('.btn-category-js').on('click', createCategory);
$('.btn-page-js').on('click', createPage);
$('.btn-commit-js').on('click', createCommit);

$('#addusers-js').on('click', function(event){
event.preventDefault();
$('#list-js').toggle();
})

$('.remove-member-js').on('click', removeMember)


});


