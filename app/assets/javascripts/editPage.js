function editPage(){
    $('.disappear_on_edit').hide();
    $('.show_on_edit').show();
    $('div.fr-view').addClass('pre-edit')
    $('div.fr-view').froalaEditor({
      initOnClick: true
    });
    $('.fr-element').focus();
}
