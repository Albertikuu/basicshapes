function createTeam(event){
	event.preventDefault();
	debugger;

	var participants = new Array();
	participants = $('#participants-invite-js').val().split(',');
    request = $.post("/teams", {
            name: $('#team_name').val().toLowerCase(),
            members: participants
        });

	request.fail(console.log('the category request failed'));
 	request.done(console.log('the category request was succesful'))

};

