var map;
var markers = [];
var geocoder;


function initialize() {
  geocoder = new google.maps.Geocoder();
  var mapOptions = {
    zoom: 14
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}



// Add a marker to the map and push to the array.
function addMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  markers.push(marker);
}

// Sets the map on all markers in the array.
function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

function codeAddress() {
  var game_location = $('.game_location')[0].innerText;
  var game_sport = $('.game_sport')[0].innerText;
  var game_date = $('.game_date')[0].innerText;
  console.log(game_date);
  var contentString = 'Sport: ' + game_sport + '<br>' + 'Location: ' + game_location + '<br>' + 'Date: ' + game_date;
  var infowindow = new google.maps.InfoWindow({
      content: contentString
  });
  geocoder.geocode( { 'address': game_location}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
      google.maps.event.addListener(marker, 'click', function() {
       console.log('stuff');
        infowindow.open(map,marker);
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'load', codeAddress);


