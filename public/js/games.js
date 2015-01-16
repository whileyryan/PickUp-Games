$(document).ready(function () {
	$('.submit_options').click(function(){
		send_ajax_sport();
	});

	$('.sunday').click(function(){
		send_ajax_day('Sunday');
	})
	$('.monday').click(function(){
		send_ajax_day('Monday');
	})
	$('.tuesday').click(function(){
		send_ajax_day('Tuesday');
	})
	$('.wednesday').click(function(){
		send_ajax_day('Wednesday');
	})
	$('.thursday').click(function(){
		send_ajax_day('Thursday');
	})
	$('.friday').click(function(){
		send_ajax_day('Friday');
	})
	$('.saturday').click(function(){
		send_ajax_day('Saturday');
	})

	$('.reset').click(function(){
		send_ajax_all();
	})

	$( ".register_game" ).click(function() {
  		$( ".create_game_form" ).toggle( "slow", function() {
 	 	});
  	});
});

function send_ajax_all(){
	var ajaxRequest = $.ajax({
		url: '/games/display_all',
		type: 'GET'
	});
	ajaxRequest.done(function(response){
		select_games(response);
	})
}

function send_ajax_day(day){
	var ajaxRequest = $.ajax({
		url: '/games/display_day',
		type: 'GET',
		data: {day: day}
	});
	ajaxRequest.done(function(response){
		select_games(response);
	})
}

function send_ajax_sport(){	
	var sport = $('select').val();
	var ajaxRequest = $.ajax({
		url: '/games/display_sport',
		type: 'GET',
		data: {sport: sport}
	});
	ajaxRequest.done(function(response){
		select_games(response);
	})
}

function select_games(response){
	var new_all_games = $('.all_games').clone();
	$('.all_games').empty();
	console.log(response);
	var length = response.length;
	for (var i = 0; i < length; i ++){
		var sport = response[i].sport;
		var place = response[i].location;
		var game_id = response[i].id;
		var weekday = response[i].weekday;
		var month_day = response[i].month_day;
		var time = response[i].time;
		var date = weekday + ' ' + month_day + ' ' + time 
		var game_details = "<a href='/event/" + game_id + "'><div class='single_game'>" + sport + '<br>' + place + '<br>' + date + '</div>' + '</a>';
		$('.all_games').append(game_details);
	}
}


