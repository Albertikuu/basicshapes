function orderPages(){
	
	var objects = $('.card-page')
	var itemsArray = objects.toArray();
	var list = {};
	itemsArray.forEach(function(item){
		list[item.dataset.id] = objects.index(item)
	});

    request = $.post("/categories/order_pages", {
        title_slug: $('#pages_sortable').data('slug'),
        list: list
        });

	request.fail(function(error){
		console.log(error)
	});
 	request.success(function(data){
 		console.log('the category request was succesful', data)
 	});
};

