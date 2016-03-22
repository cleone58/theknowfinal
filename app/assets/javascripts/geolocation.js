$(document).ready(function() {

    window.onload = function() {
      if("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition(success)
      }
  };
});

function success(position){
  var lat = position.coords.latitude
  var lon = position.coords.longitude
  console.log(position);
  $("input#latitude").val(lat);
  $("input#longitude").val(lon);
}
