// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function initMap() {
  var mapPlaceholder = $('#map');
  var latLong = {lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')}
  map = new google.maps.Map(mapPlaceholder[0], {
    center: latLong,
    zoom: 16
  });

  var marker = new google.maps.Marker({
    position: latLong,
    map: map,
    title: "Venue Map"
  });
}
