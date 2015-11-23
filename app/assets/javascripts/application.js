// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require handlebars-205c61c

// function hideAllContainersExcept(divNotHidden) {
//   $('div.container > [class*="container"]').hide();
//   $(divNotHidden).show()
// };

// initialize();

// function initialize() {
//   google.maps.event.addDomListener(window, 'load', function() {
//     codeAddress('New York');
// });
// }

$(document).ready(function() {

  function initialize() {

    var myOptions = {
      zoom: 17,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map"), myOptions);

    // Get's user's current location
    if(navigator.geolocation) {
      browserSupportFlag = true;
      navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
  
      map.setCenter(initialLocation);

      var marker = new google.maps.Marker({
        position: initialLocation,
        map: map,
        title: 'Hello World!'
      });
    
      }, function() {
        handleNoGeolocation(browserSupportFlag);
      });
    }
    // Browser doesn't support Geolocation
    else {
      browserSupportFlag = false;
      handleNoGeolocation(browserSupportFlag);
    }

    function handleNoGeolocation(errorFlag) {
      if (errorFlag == true) {
        alert("Geolocation service failed.");
        initialLocation = newyork;
      } else {
        alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
        initialLocation = siberia;
      }
      map.setCenter(initialLocation);
    }
  }

  initialize();

});