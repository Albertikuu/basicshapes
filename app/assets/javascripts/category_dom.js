document.addEventListener("turbolinks:load", function() {

$('.fr-element').attr('id', 'page_content');

$('#edit-page').on('click', function(){
    $('.disappear_on_edit').hide();
    $('.show_on_edit').show();
    $('div.fr-view').addClass('pre-edit')
    $('div.fr-view').froalaEditor({
      initOnClick: true
    });
    $('div.fr-view').on('click',removeClass('pre-edit'));
});

$('.btn-category-js').on('click', createCategory);
$('.btn-page-js').on('click', createPage);
$('.btn-commit-js').on('click', createCommit);

$('#addusers-js').on('click', function(event){
event.preventDefault();
$('#list-js').toggle();
})

$('.remove-member-js').on('click', removeMember)


});


