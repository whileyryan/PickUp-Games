var geocoder;
var map;
function initialize() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(-34.397, 150.644);
  var mapOptions = {
    zoom: 8,
    center: latlng
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

function codeAddress() {
  var all_games = $('.all_games')[0].innerText.split('\n');
  var all_games_length = (all_games.length - 1)
  for (var i = 0; i < all_games_length; i++){
	var game_location = all_games[i].split(' at ').pop();
	console.log(game_location);
  	geocoder.geocode( { 'address': game_location}, function(results, status) {
	    if (status == google.maps.GeocoderStatus.OK) {
	      map.setCenter(results[0].geometry.location);
	      var marker = new google.maps.Marker({
	          map: map,
	          position: results[0].geometry.location
	      });
	    } else if (status === google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {    
            setTimeout(function() {
                i--;
            }, 200);
        } else {
            alert("Geocode was not successful for the following reason:" 
                  + status);
        }
  	});
  }
  
}


// google.maps.event.addDomListener(window, 'load', initialize);
// google.maps.event.addDomListener(window, 'load', codeAddress);
