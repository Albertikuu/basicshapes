function savePage(){
    $('.disappear_on_edit').show();
    $('.show_on_edit').hide();
    $('div.fr-view').removeClass('pre-edit');
    $('div.fr-view').froalaEditor('destroy');
    updatePage();
};