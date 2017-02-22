function removeMember(event){
	event.preventDefault;
    request = $.post("/teams/remove_member", {
            user_id: event.currentTarget.id,
            team_name: $('#team_name').val().toLowerCase()
        });

	request.fail(console.log('the category request failed'));
 	request.done(console.log('the category request was succesful'))
}