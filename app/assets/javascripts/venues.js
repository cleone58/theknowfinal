// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function initMap() {
  mapPlaceholder = $('#map');
  map = new google.maps.Map(mapPlaceholder[0], {
    center: {lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')},
    zoom: 8

  });
}
