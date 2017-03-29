function createTeam(event){
	event.preventDefault();

	var participants = new Array();
	participants = $('#participants-invite-js').val().split(',');
    request = $.post("/teams", {
            name: $('#team_name').val().toLowerCase(),
            members: participants
        });

	request.fail(function(error){
		console.log(error)
	});
 	request.success(function(data){
 		console.log('the category request was succesful', data)
 	});

};


function addUserToTeam(event){
	event.preventDefault();

	var participants = new Array();
	participants = $('#participants-invite-js').val().split(',');
    request = $.post("/teams/invite_users", {
            members: participants,
            team_slug: $('.invite-users-js').data('team')
        });

	request.fail(function(error){
		console.log(error)
	});
 	request.success(function(data){
 		console.log('the category request was succesful', data)
 	});

};

