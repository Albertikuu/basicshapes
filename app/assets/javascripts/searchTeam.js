    function searchTeam() {
        var teamQuery = "/api/teams/";
        request = $.get(teamQuery);
        request.done(findTeam);
        request.fail(function(error){
            console.log(error);
            alert(error.message);
         });
    };

    function findTeam(response) {
        var query = $('#team_name').val();
        function sameName(team) {
            return team.name === query
        };
        var teams = response;
        var selectedTeam = teams.find(sameName);
        debugger;
    }
