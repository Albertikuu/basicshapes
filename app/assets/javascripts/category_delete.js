function deleteCategory(event){
	event.prevetDefault();

	$.ajax({
    url: '/script.cgi',
    type: 'DELETE',
    success: function(result) {
        // Do something with the result
    }
});
}