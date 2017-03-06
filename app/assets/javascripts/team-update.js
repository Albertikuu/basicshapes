function removeMember(event){
	event.preventDefault;
	debugger;
    request = $.post("/teams/remove_member", {
            user_id: event.currentTarget.id,
            team_slug: event.currentTarget.dataset.team
        });

	request.fail(function(error){
		console.log(error)
	});
 	request.success(function(data){
 		console.log('the team request was succesful', data)
 	});
}