function createTeam(event){
	event.preventDefault();
	$participants = 
    request = $.post("/teams", {
            name: $('#team_name').val().toLowerCase(),
            description: $('#team_description').val(),
            $participants
        });

	request.fail(console.log('the category request failed'));
 	request.done(console.log('the category request was succesful'))

};

