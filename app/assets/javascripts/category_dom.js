document.addEventListener("turbolinks:load", function() {

$('.btn-category-js').on('click', createCategory);

$('#addusers-js').on('click', function(event){
event.preventDefault();
$('#list-js').toggle();
})

$('.remove-member-js').on('click', removeMember)


});


