$('document').ready(function() {

$('.btn-category-js').on('click', createCategory)

$('#addusers-js').on('click', function(event){
event.preventDefault();
$('#list-js').toggle();
});


});


