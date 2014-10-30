$(document).ready(function () {
	$('#new_tweet').on('ajax:complete', function (event, xhr) {
		var $tweet = $(xhr.responseText);
		$tweet.hide();
		$('.listed-tweets h4').after($tweet);
		$tweet.fadeIn();
		$('#tweet_content').val('');
	});


	$('#profile-image').on('click', function(){

	});
});

