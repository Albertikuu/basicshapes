function removeMember(event){
	event.preventDefault;
	debugger;
    request = $.post("/teams/remove_member", {
            user_id: event.currentTarget.id,
            team_slug: event.currentTarget.dataset.team
        });

	request.fail(console.log('the category request failed'));
 	request.done(console.log('the category request was succesful'))
}