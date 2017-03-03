document.addEventListener("turbolinks:load", function getCommits(){
	request = $.get('/api/commits', function(data){
		console.log('found commits');
		displayCommits(data);
	});
	
	request.fail(function(error){
		console.log(error)
	});
});

function displayCommits(data){
	var commits = data[0]
	commits.forEach(function(commit){
// add elements here
	})
}
