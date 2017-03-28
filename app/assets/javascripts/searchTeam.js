    function searchTeam() {
        var teamQuery = "/api/teams/";
        request = $.get(teamQuery);
        request.done(findTeam);
        request.fail(function(error){
            console.log(error);
         });
    };

    function findTeam(response) {
        var query = $('#team_name').val();
        function sameName(team) {
            return team.name === query
        };
        var teams = response;
        var selectedTeam = teams.find(sameName);
        if(selectedTeam == undefined){
            $('#find-team-alert').html('we cannot find a team with this name')
        } else {
            $('#find-team-alert').html('Is this the team you are looking for?');
            $('#found-team').show();
            $('#found-team').append("<p><a>" + selectedTeam.name.toUpperCase() + "</a></p>");
        }
    }
