$(document).ready(function () {

  // AJAX for when users click 'attend' for games
  $('.attend').click(function(event){
  	event.preventDefault();
  	var postID = $(this).attr("ident");
  	var ajaxRequest = $.ajax({
  		url: '/event/' + postID + '/attend',
  		type: 'POST'
  	});
  	ajaxRequest.done(function(response){
      $('.attend').hide();
      $('.unattend').show();
      var attendance = $('.att');
      $(attendance).html(response);
  	})  	
  })


  //AJAX for when a user wants to unattend a game
   $('.unattend').click(function(event){
    event.preventDefault();
    var postID = $(this).attr("ident");
    var ajaxRequest = $.ajax({
      url: '/event/' + postID + '/unattend',
      type: 'POST'
    });
    ajaxRequest.done(function(response){
      $('.attend').show();
      $('.unattend').hide();
      var attendance = $('.att');
      $(attendance).html(response);
    })    
  })


  //toggles when a user wants to show and hide their choices
  $( ".toggle_user_sports_choices" ).click(function() {
  		$( ".user_sports_choices" ).toggle( "slow", function() {
 	 });
  });

  $( ".create_event_button" ).click(function() {
  		$( ".create_event_form" ).toggle( "slow", function() {
 	 });
  });

   $( ".submit_button" ).click(function() {
      event.preventDefault();
      $('.submit_button').fadeOut();
      $( ".search_item" ).delay(350).toggle( "slow", function() {
   });
  });

});
